from libqtile import bar, widget
from libqtile.config import Screen
from colors import *

# this import requires python-xlib to be installed
from Xlib import display as xdisplay

widget_defaults = dict(
    font="JetBrainsMono Nerd Font Bold",
    fontsize=16,
    padding=3,
)
extension_defaults = widget_defaults.copy()

def standard_group_box():
    return widget.GroupBox(
        highlight_method="line",
        this_screen_border=colorGreen,
        this_current_screen_border=colorGreen,
        other_screen_border=colorRed,
        other_current_screen_border=colorRed,
        hide_unused=True,
        font="JetBrainsMono Nerd Font Bold",
        fontsize=22,
    )

def standard_task_list():
    return widget.TaskList(
            title_width_method="uniform",
            highlight_method="block",
            icon_size=24,
            margin_x=0,
            margin_y=0,
            padding_y=2,
            padding_x=5,
            rounded=True,
            spacing=5,
            markup_focused="<span foreground='#282A36'>{}</span>",
            font="JetBrainsMono Nerd Font Bold",
            fontsize=22,
            theme_mode="preferred",
            txt_floating="🗗",
            txt_minimized="🗕",
            txt_maximized="🗖 ",
            border=colorGreen,
        )


productive_bar = bar.Bar(
    [
        widget.CurrentLayoutIcon(),
        standard_group_box(),
        widget.Prompt(),
        widget.Spacer(),
        standard_task_list(),
        widget.Spacer(),
        widget.Chord(
            chords_colors={
                "launch": ("#ff0000", "#ffffff"),
            },
            name_transform=lambda name: name.upper(),
        ),
        widget.Systray(),             
        widget.Spacer(length=5),
        widget.Battery(
            discharge_char="BAT:",
            charge_char="",
            empty_char="EMPTY",
            hide_threshold=0.9,
            background=colorPurple,
            foreground=colorBackground,
            low_background=colorRed,
            low_foreground=colorBackground,
            low_percentage=0.1,
            format=" {char} {percent:2.0%} {hour:d}:{min:02d} {watt:.2f} W ",
            )
    ],
    32,
    background=colorBackground,
)

system_info_bar = bar.Bar(
    [
        widget.CurrentLayoutIcon(),
        standard_group_box(),
        widget.Spacer(),
        widget.CPU(),
        widget.CPUGraph(
            graph_color=colorPurple, border_color=colorPurple, fill_color=colorPurple
        ),
        widget.Memory(measure_mem="G", format="{MemUsed:.2f}G/{MemTotal:.2f}G"),
        widget.MemoryGraph(
            graph_color=colorOrange, border_color=colorOrange, fill_color=colorOrange
        ),
        widget.Net(format="\uea9a {down}"),
        widget.NetGraph(
            graph_color=colorGreen, border_color=colorGreen, fill_color=colorGreen
        ),
        widget.Net(format="\ueaa1 {up}"),
        widget.NetGraph(
            bandwidth_type="up",
            graph_color=colorRed,
            border_color=colorRed,
            fill_color=colorRed,
        ),
        widget.DF(visible_on_warn=False, format="{uf}{m}|{r:.0f}%"),
        widget.HDDBusyGraph(
            graph_color=colorCyan, border_color=colorCyan, fill_color=colorCyan
        ),
    ],
    32,
    background=colorBackgroundFade,
)

third_bar = bar.Bar(
    [
        widget.CurrentLayoutIcon(),
        standard_group_box(),
        widget.Spacer(),
        standard_task_list(),
        widget.Spacer(),
        widget.Clock(format="%d/%m/%y %H:%M"),
        widget.QuickExit(default_text="\uf011", padding=10, foreground=colorYellow),
    ],
    32,
    background=colorBackgroundFade,
)


def get_num_monitors():
    num_monitors = 0
    try:
        display = xdisplay.Display()
        screen = display.screen()
        resources = screen.root.xrandr_get_screen_resources()

        for output in resources.outputs:
            monitor = display.xrandr_get_output_info(output, resources.config_timestamp)
            preferred = False
            if hasattr(monitor, "preferred"):
                preferred = monitor.preferred
            elif hasattr(monitor, "num_preferred"):
                preferred = monitor.num_preferred
            if preferred:
                num_monitors += 1
    except Exception as e:
        # always setup at least one monitor
        return 1
    else:
        return num_monitors


number_of_monitors = get_num_monitors()


if number_of_monitors == 1:
    screens = [
        Screen(
            top=productive_bar,
        )
    ]

if number_of_monitors > 1:
    fake_screens = [
        Screen(top=productive_bar, x=1440, y=560, width=3440, height=1440),
        Screen(bottom=system_info_bar, x=0, y=1280, width=1440, height=1280),
        Screen(top=third_bar, x=0, y=0, width=1440, height=1280),
    ]
