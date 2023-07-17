from libqtile.config import Click, Drag, Key
from libqtile.lazy import lazy
from libqtile.utils import guess_terminal

mod = "mod4"
terminal = guess_terminal()

# Full list of keys https://github.com/qtile/qtile/blob/master/libqtile/backend/x11/xkeysyms.py

keys = [
    # Focus
    Key([mod], "space", lazy.next_screen(), desc="Move window focus to next monitor"),

    # Switch between windows
    Key([mod], "Left", lazy.layout.left(), desc="Move focus to left"),
    Key([mod], "Right", lazy.layout.right(), desc="Move focus to right"),
    Key([mod], "Down", lazy.layout.down(), desc="Move focus down"),
    Key([mod], "Up", lazy.layout.up(), desc="Move focus up"),

    # Move windows between left/right columns or move up/down in current stack.
    # Moving out of range in Columns layout will create new column.
    Key([mod, "shift"], "Left", lazy.layout.shuffle_left(), desc="Move window to the left"),
    Key([mod, "shift"], "Right", lazy.layout.shuffle_right(), desc="Move window to the right"),
    Key([mod, "shift"], "Down", lazy.layout.shuffle_down(), desc="Move window down"),
    Key([mod, "shift"], "Up", lazy.layout.shuffle_up(), desc="Move window up"),

    # Grow windows. If current window is on the edge of screen and direction
    # will be to screen edge - window would shrink.
    Key([mod, "control"], "Left", lazy.layout.grow_left(), desc="Grow window to the left"),
    Key([mod, "control"], "Right", lazy.layout.grow_right(), desc="Grow window to the right"),
    Key([mod, "control"], "Down", lazy.layout.grow_down(), desc="Grow window down"),
    Key([mod, "control"], "Up", lazy.layout.grow_up(), desc="Grow window up"),
    Key([mod], "n", lazy.layout.normalize(), desc="Reset all window sizes"),

    # General Windows
    Key([mod], 'm', lazy.layout.maximize()),
    Key([mod], "f", lazy.window.toggle_fullscreen()),
    Key([mod, "shift"], "f", lazy.window.toggle_floating()),

    # Print Screen
    Key([], "Print", lazy.spawn("flameshot full --clipboard")),
    Key([mod], "Print", lazy.spawn("flameshot gui")),

    # Toggle between split and unsplit sides of stack.
    # Split = all windows displayed
    # Unsplit = 1 window displayed, like Max layout, but still with
    # multiple stack panes
    Key(
        [mod, "shift"],
        "Return",
        lazy.layout.toggle_split(),
        desc="Toggle between split and unsplit sides of stack",
    ),
    Key([mod], "Return", lazy.spawn(terminal), desc="Launch terminal"),
    # Toggle between different layouts as defined below
    Key([mod], "Tab", lazy.next_layout(), desc="Toggle between layouts"),
    Key([mod], "w", lazy.window.kill(), desc="Kill focused window"),
    Key([mod, "control"], "r", lazy.reload_config(), desc="Reload the config"),
    Key([mod, "control"], "q", lazy.shutdown(), desc="Shutdown Qtile"),
    Key([mod], "r", lazy.spawncmd(), desc="Spawn a command using a prompt widget"),

    # Rofi
    Key([mod], "d", lazy.spawn("rofi -show drun"), desc="Spawn a command using a prompt widget"),
    Key([mod], "period", lazy.spawn("rofi -modi emoji -show emoji"), desc="Emoji picker"),

    # Volume
    Key([], "XF86AudioRaiseVolume", lazy.spawn("sh /home/jonny64bit/.config/qtile/volume-up.sh")),
    Key([], "XF86AudioLowerVolume", lazy.spawn("sh /home/jonny64bit/.config/qtile/volume-down.sh")),
    Key([], "XF86AudioMute", lazy.spawn("sh /home/jonny64bit/.config/qtile/volume-mute-toggle.sh")),

    # Audio controls
    Key([], "XF86AudioNext", lazy.spawn("sh /home/jonny64bit/.config/qtile/playerctl.sh next")),
    Key([], "XF86AudioPrev", lazy.spawn("sh /home/jonny64bit/.config/qtile/playerctl.sh previuos")),
    Key([], "XF86AudioPlay", lazy.spawn("sh /home/jonny64bit/.config/qtile/playerctl.sh play-pause")),
]

# Drag floating layouts.
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(), start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(), start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front()),
]

# Fixes high dpi mouse causing lag when moving a window
x11_drag_polling_rate = 500

# When using the Wayland backend, this can be used to configure input devices.
wl_input_rules = None

follow_mouse_focus = True
bring_front_click = False
cursor_warp = False
dgroups_key_binder = None
dgroups_app_rules = []  # type: list