sudo apt update && sudo apt upgrade && sudo apt install gpg

# GCC etc.
sudo apt install build-essential

# Lua
if ! command -v lua-language-server &> /dev/null
then
  relver="3.7.0"
  relname="lua-language-server-$relver-linux-x64"

  wget https://github.com/LuaLS/lua-language-server/releases/download/$relver/$relname.tar.gz

  mkdir ./$relname
  tar -xvf $relname.tar.gz -C $relname
  sudo mv $relname /usr/share
  sudo ln -s /usr/share/$relname/bin/lua-language-server /usr/bin/lua-language-server
fi

# Terraform Language Server
if ! command -v terraform-ls &> /dev/null
then
  wget -O- https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg

  gpg --no-default-keyring --keyring /usr/share/keyrings/hashicorp-archive-keyring.gpg --fingerprint

  echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list

  sudo apt update

	echo "Installing Terraform Language Server"
	sudo apt install terraform-ls
fi

# Powershell
# if ! command v



