# nvchad-custom

## Update Neovim

### Ubuntu

cd ~/.local/bin/
rm nvim
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
chmod u+x nvim.appimage
mv nvim.appimage nvim

## Download NerdFont

wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/Hack.zip
unzip Hack.zip -d ~/.fonts
fc-cache -fv
rm Hack.zip 

## Alacritty

font:
    normal:
        family: "Hack Nerd Font"
        style: Regular
    bold:
        family: "Hack Nerd Font"
        style: Bold
    italic:
        family: "Hack Nerd Font"
        style: Italic



## Setup NvChad with Custom Config

git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1 && nvim

git clone https://github.com/DanReia/nvchad-custom ~/.config/nvim/lua/custom
