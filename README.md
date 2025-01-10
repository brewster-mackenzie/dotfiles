# Linux dotfiles

## Summary

My Linux dotfiles for:

- bash (aliases, env vars)
- i3
- kitty
- lightdm
- neofetch
- polybar
- ranger
- rofi
- vim
- wallust
- X11

And some submodules:

- [Tokyonight-rofi-theme](https://github.com/w8ste/Tokyonight-rofi-theme)
- [Bluejive Wallpapers](https://git.27hs.co.uk/brewster/blu3jive-wallpapers) using my fork of [this](https://github.com/bluejive/Wallpapers) 
- [Rofi Power Menu](https://github.com/jluttine/rofi-power-menu)

Using the Tokyo Night theme where possible.


## Installation

### Checkout the bare repository

```
git clone --bare <remote-git-repo-url> <checkout-dir>
```
- replace `<remote-git-repo-url>` with the repository URL
- replace `<checkout-dir>` with the checkout location (NOT the home folder)

**Example**
```
git clone --bare https://git.27hs.co.uk/brewster/dotfiles /home/brewster/repos/dotfiles
```

### Create a git alias

```
git config --global alias.dotfiles '!git --git-dir=<checkout-dir> --work-tree=<home-dir>'
```

- replace `<checkout-dir>` with the checkout location (NOT the home folder)
- replace `<home-dir>` with the home folder (e.g. `c:/users/brewster` or `/home/brewster`)

**Example**

```
git config --global alias.dotfiles '!git --git-dir=/home/brewster/repos/dotfiles --work-tree=/home/brewster'
```

Now you can invoke git commands on this repository by using `git dotfiles` instead of `git` in the cli. 


### Checkout the repo

```
git dotfiles checkout
```

### Making changes

My `.gitignore` file excludes everything outside of the `.config` folder, so changed outside of this folder will need to be staged using the `--force` switch.

### Next Steps

You can create a branch per-machine for any changes and merge specific changes into `main` if you want to update the base files.

```
git dotfiles checkout -b 202409-new-machine-name
```

Make changes specifically for this machine
```
git dotfiles add ~/.config/app/app.config
git dotfiles commit -m "added new app config file"
git dotfiles push
```
If you're expecting to make extensive changes to the base files, it might be best to just fork the repo instead.