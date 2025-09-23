#!/usr/bin/env python3
import subprocess
import sys

def set_wallpaper_for_screen(screen_number, wallpaper_path):
    script = f'''
    var allDesktops = desktops();
    for (i=0; i<allDesktops.length; i++) {{
        d = allDesktops[i];
        if (d.screen == {screen_number}) {{
            d.wallpaperPlugin = "org.kde.image";
            d.currentConfigGroup = Array("Wallpaper", "org.kde.image", "General");
            d.writeConfig("Image", "file://{wallpaper_path}");
        }}
    }}
    '''
    
    subprocess.run([
        'qdbus6', 'org.kde.plasmashell', '/PlasmaShell',
        'org.kde.PlasmaShell.evaluateScript', script
    ])

# Usage
if __name__ == "__main__":
    if len(sys.argv) != 3:
        print("Usage: script.py <screen_number> <wallpaper_path>")
        sys.exit(1)
    
    screen = int(sys.argv[1])
    wallpaper = sys.argv[2]
    set_wallpaper_for_screen(screen, wallpaper)
