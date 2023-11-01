echo "Installing NeoVim"

wget https://github.com/neovim/neovim/releases/download/stable/nvim-linux64.tar.gz
tar -xvf nvim-linux64.tar.gz
sudo mv nvim-linux64 /usr/share
sudo ln -s /usr/share/nvim-linux64/bin/nvim /bin/nvim 

echo "Installing Packer plugin manager"

git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim 

echo "DONE - don't forget to run :PackerSync !!"


