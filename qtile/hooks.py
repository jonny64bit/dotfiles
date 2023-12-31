import os
import subprocess

from libqtile import hook

# Auto Start Script
@hook.subscribe.startup_once
def autostart():
    home = os.path.expanduser("~/.config/qtile/autostart.sh")
    subprocess.Popen([home])