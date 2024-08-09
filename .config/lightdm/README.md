# LightDM Configuration

symlink the included files into /etc/lightdm

add yourself to the lightdm group



```
sudo usermod -aG $(whoami) lightdm

chmod g+rx ~/.config/lightdm

ln -s ~/.config/lightdm/lightdm.conf /etc/lightdm/lightdm.conf

# also do lightdm-mini-greeter, etc.
```
