## TODO add ripgrep

check_command() {
  echo -n "$1 - "; if command -v $2 &> /dev/null; then echo 'Installed'; else echo 'Not Installed'; fi
}
check_path() {
  echo -n "$1 - "; if [ -e "$2" ]; then echo 'Installed'; echo 'Not Found'; fi
}

tmpdir="/tmp/inst$RANDOM"
mkdir $tmpdir
pushd $tmpdir

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

# TMUX
if ! command -v tmux &> /dev/null
then
  sudo apt-get install -y tmux
fi

# TMUXINATOR
if ! command -v tmuxinator &> /dev/null
then
  sudo apt-get install -y tmuxinator
fi

# TPM (Tmux Plugin Manager)
if [ ! -e ~/.tmux/plugins/tpm ]
then 
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi

# ZK
if ! command -v zk &> /dev/null
then
  relver="0.14.0"
  relname="zk-v$relver-linux-amd64"
  wget "https://github.com/mickael-menu/zk/releases/download/v$relver/$relname.tar.gz"
  mkdir ./$relname
  tar -xvf $relname.tar.gz -C $relname
  sudo mv $relname /usr/share
  sudo ln -s /usr/share/$relname/zk /bin/zk
fi

# ripgrep
if ! command -v ripgrep &> /dev/null
then
  sudo apt-get install -y ripgrep
fi

# terraform
if ! command -v terraform &> /dev/null
then
  sudo apt-get install -y terraform
fi

# terragrunt
if ! command -v terragrunt &> /dev/null
then
  relver="0.53.2"
  relname="terragrunt_linux_amd64"
  wget "https://github.com/gruntwork-io/terragrunt/releases/download/v$relver/$relname" 
  sudo mv $relname /usr/bin/terragrunt
  sudo chmod +x /usr/bin/terragrunt
fi

# ALL DONE - check commands
check_command PowerShell pwsh
check_command NeoVim nvim
check_command Tmux tmux 
check_command Tmuxinator tmuxinator
check_command ZK zk
check_command Ripgrep rg
check_command Terraform terraform
check_command Terragrunt terragrunt
check_path TPM ~/.tmux/plugins/tpm
popd
rm -r $tmpdir
