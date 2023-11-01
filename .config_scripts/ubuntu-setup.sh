check_command() {
  echo -n "$1 - "; if command -v $2 &> /dev/null; then echo 'Installed'; else echo 'Not Installed'; fi
}

# Update & upgrade 
sudo apt update && sudo apt upgrade

# Install some common packages
sudo apt install -y build-essential unzip gpg wget apt-transport-https software-properties-common

# Ensure version environment vars are present 
source /etc/os-release

# POWERSHELL
if ! command -v pwsh &> /dev/null
then 
  # download repository keys
  wget -q https://packages.microsoft.com/config/ubuntu/$VERSION_ID/packages-microsoft-prod.deb

  # register repository keys
  sudo dpkg -i packages-microsoft-prod.deb

  # delete repository keys file
  rm packages-microsoft-prod.deb

  # update list of packages
  sudo apt-get update

  # install PowerShell
  sudo apt-get install -y powershell
fi;

# NEOVIM

if ! command -v nvim &> /dev/null
then
  wget https://github.com/neovim/neovim/releases/download/stable/nvim-linux64.tar.gz
  tar -xvf nvim-linux64.tar.gz
  sudo mv nvim-linux64 /usr/share
  sudo ln -s /usr/share/nvim-linux64/bin/nvim /bin/nvim 

  #Packer Plugin Manager
  git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim 
  nvim --headless +PackerSync +q
fi

# ALL DONE - check commands
check_command PowerShell pwsh
check_command NeoVim nvim
