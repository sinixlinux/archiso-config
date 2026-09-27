#!/usr/bin/env bash

# Aguarda o plasma-desktop carregar completamente em segundo plano
sleep 2

# Comando nativo do KDE para forçar o wallpaper via Javascript API
qdbus org.kde.plasmashell /PlasmaShell org.kde.PlasmaShell.evaluateScript "
    var allDesktops = desktops();
    for (var i = 0; i < allDesktops.length; i++) {
        var d = allDesktops[i];
        d.wallpaperPlugin = 'org.kde.image';
        d.currentConfigGroup = Array('Wallpaper', 'org.kde.image', 'General');
        d.writeConfig('Image', 'file:///usr/share/wallpapers/livewp.png');
    }
"
