local Path = require("plenary.path")
local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")
local conf = require("telescope.config").values

local notebook_path = vim.fn.expand("$NOTEBOOK")

local function sanitize_title(title)
    return title:lower():gsub("%W+", "-")
end

local function list_subfolders(dir)
    local subfolders = {}
    local p = io.popen('find "' .. dir .. '" -not -path "*/.*" -mindepth 1 -maxdepth 1 -type d')
    if p then
        for folder in p:lines() do
            table.insert(subfolders, folder:match(".*/(.*)"))
        end
        p:close()
    end
    return subfolders
end

local function get_note_titles()
    local notes = {}
    for file in io.popen('find "' .. notebook_path .. '" -type f -name "*.md"'):lines() do
        local title = "Untitled"
        local f = io.open(file, "r")
        if f then
            local first_line = f:read("*l") or ""
            f:close()
            title = first_line:match("^#%s*(.+)") or first_line
        end
        table.insert(notes, { display = title, filename = file })
    end
    return notes
end

local function select_or_create_note(linkMode)
    linkMode = linkMode or 0;

    if not notebook_path or notebook_path == "" then
        vim.notify("ERROR: $NOTEBOOK is not set!", vim.log.levels.ERROR)
        return
    end

    local note_entries = get_note_titles()

    pickers.new({}, {
        prompt_title = "Search or Create Note",
        finder = finders.new_table({
            results = note_entries,
            entry_maker = function(entry)
                return {
                    value = entry.filename,
                    display = entry.display,
                    ordinal = entry.display, -- Makes it searchable by title
                }
            end
        }),
        sorter = conf.generic_sorter({}),
        attach_mappings = function(prompt_bufnr, map)
            
            local function read_visual_selection() 
                local srow, scol = vim.fn.getpos("'<")[2], vim.fn.getpos("'<")[3]
                local erow, ecol = vim.fn.getpos("'>")[2], vim.fn.getpos("'>")[3]


                if srow == erow and scol < ecol then
                    ecol = ecol - 1
                end

                local buf = vim.api.nvim_get_current_buf()
                return table.concat(vim.api.nvim_buf_get_text(buf, srow - 1, scol - 1, erow - 1, ecol, {}), "")
            end

            local function replace_visual_selection(replacement)
              -- Get visual selection range
              local srow, scol = vim.fn.getpos("'<")[2], vim.fn.getpos("'<")[3]
              local erow, ecol = vim.fn.getpos("'>")[2], vim.fn.getpos("'>")[3]
            
              if srow == erow and scol < ecol then
                ecol = ecol - 1
              end

              -- Ensure valid selection
              if srow > erow or (srow == erow and scol > ecol) then
                return
              end
            
              -- Get the current buffer
              local buf = vim.api.nvim_get_current_buf()

            
              -- Replace the selected text
              vim.api.nvim_buf_set_text(buf, srow - 1, scol - 1, erow - 1, ecol , { replacement })
            end

            local function update(filename, title, create_new)
                if create_new then 
                    Path:new(filename):write("# " .. title .. "\n", "w")
                end

                if linkMode == 0 then -- standard open & edit
                    vim.cmd("edit " .. filename)
                elseif linkMode == 1 then -- insert link at cursor
                    vim.api.nvim_put({ "[[" .. title .. "]]" }, "c", true, true)
                    --vim.cmd("normal i [[" .. title .. "]]")
                elseif linkMode == 2 then -- replace selected text with link at cursor 
                    replace_visual_selection("[[" .. title .. "]]")
                elseif linkMode == 3 then -- replace selected text with linux using selection as alias at cursor 
                    local alias = read_visual_selection()
                    replace_visual_selection("[[" .. title .. "|" .. alias .. "]]")
                end
            end
 
            local function open_selected()
                local selection = action_state.get_selected_entry()
                actions.close(prompt_bufnr)
                if selection then
                    update(selection.value, selection.display, false)
                end
            end

            local function create_new_note()
                actions.close(prompt_bufnr)
                vim.ui.input({ prompt = "New Note Title: " }, function(title)
                    if not title or title == "" then return end
                    local filebasename = sanitize_title(title)
                    local filename = sanitize_title(title) .. ".md"

                    -- Select or create category
                    local categories = list_subfolders(notebook_path)
                    table.insert(categories, "[New Category]")

                    pickers.new({}, {
                        prompt_title = "Select Category",
                        finder = finders.new_table(categories),
                        sorter = conf.generic_sorter({}),
                        attach_mappings = function(cat_bufnr, map)
                            local function choose_category()
                                local cat_selection = action_state.get_selected_entry()
                                actions.close(cat_bufnr)

                                local category = cat_selection and cat_selection.value or ""
                                local note_path = ""
                                if category == "[New Category]" then
                                    vim.ui.input({ prompt = "New Category: " }, function(new_cat)
                                        if not new_cat or new_cat == "" then return end
                                        category = new_cat
                                        local cat_path = notebook_path .. "/" .. category
                                        vim.fn.mkdir(cat_path, "p")
                                        note_path = cat_path .. "/" .. filename
                                    end)
                                else
                                    note_path = notebook_path .. "/" .. category .. "/" .. filename
                                end

                                update(note_path, filebasename, true)
                            end

                            map("i", "<CR>", choose_category)
                            map("n", "<CR>", choose_category)
                            return true
                        end
                    }):find()
                end)
            end

            map("i", "<CR>", open_selected)
            map("n", "<CR>", open_selected)
            map("i", "<C-n>", create_new_note)
            map("n", "<C-n>", create_new_note)

            return true
        end
    }):find()
end


if os.getenv("NOTES_MODE") == "1" then
    vim.g.notes_mode = true
    vim.defer_fn(function()
        select_or_create_note()
    end, 100)

    -- Auto-trigger note selection when last buffer is closed
    vim.api.nvim_create_autocmd("BufDelete", {
    callback = function()
        vim.defer_fn(function()
            local listed_buffers = vim.fn.getbufinfo({ buflisted = 1 })
            local all_buffers = vim.fn.getbufinfo()

            -- If there are no listed buffers but at least one unlisted buffer (likely "No Name"), trigger prompt
            if #listed_buffers == 1 and #all_buffers > 0 and listed_buffers[1].name == "" then
                select_or_create_note()
            end
        end, 10) -- Small delay ensures buffer state updates before checking
    end
})
end



return {
    select_or_create_note = select_or_create_note
}

