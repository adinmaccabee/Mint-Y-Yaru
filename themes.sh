#!/bin/bash
 
# Install dependencies
sudo apt install -y ubuntu-wallpapers
 
# download and install Mint-Y-Yaru theme
wget -O /tmp/Mint-Y-Yaru.zip https://github.com/aidanoakes/Mint-Y-Yaru/raw/main/Mint-Y-Yaru.zip
mkdir -p ~/.themes
unzip -o /tmp/Mint-Y-Yaru.zip -d ~/.themes/
 
# apply themes
gsettings set org.cinnamon.desktop.interface cursor-theme "Yaru"
gsettings set org.cinnamon.desktop.interface gtk-theme "Mint-Y-Yaru"
gsettings set org.cinnamon.desktop.wm.preferences theme "Mint-Y-Yaru"
gsettings set org.cinnamon.desktop.interface icon-theme "Mint-Y-Yaru"
gsettings set org.cinnamon.theme name "Mint-Y-Yaru"
 
# set wallpaper
gsettings set org.cinnamon.desktop.background picture-uri "file:///usr/share/backgrounds/Fuwafuwa_nanbatto_san_by_amaral-light.png"
 
# move panel to left
gsettings set org.cinnamon panels-enabled "['1:0:left']"
 
# calendar custom date format
CALENDAR_DIR="$HOME/.config/cinnamon/spices/calendar@cinnamon.org"
mkdir -p "$CALENDAR_DIR"
cat > "$CALENDAR_DIR/calendar@cinnamon.org.json" << 'JSON'
{
    "use-custom-format": {
        "type": "checkbox",
        "value": true
    },
    "custom-format": {
        "type": "entry",
        "value": "%H:%M"
    },
    "custom-format-tooltip": {
        "type": "entry",
        "value": "%A, %B %e, %H:%M"
    }
}
JSON
 
# reload Cinnamon
#cinnamon --replace &
 
echo "done"