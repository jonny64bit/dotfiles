
from libqtile import layout
from libqtile.config import Match
from colors import *

layouts = [
    layout.Columns(
        border_focus=colorGreen,
        border_focus_stack=[colorGreen, "#8f3d3d"], 
        border_width=2,
        border_on_single=True
        ),
    layout.VerticalTile(
        border_focus=colorGreen,
        border_focus_stack=[colorGreen, "#8f3d3d"], 
        border_width=2,
        border_normal=colorBackground
    ),
    layout.Max(),
    layout.Floating(),
    layout.MonadTall(),
    layout.MonadWide(),
    layout.TreeTab(
        border_focus=colorGreen,
        bg_color="#00000000"
    ),
    #layout.RatioTile(),
    #layout.Tile(),
    #layout.Stack(num_stacks=4),
    #layout.Bsp(),
    #layout.Matrix(),
    #layout.Zoomy(),
    #layout.Slice(),
    #layout.Spiral()
]

floating_layout = layout.Floating(
    float_rules=[
        # Run the utility of `xprop` to see the wm class and name of an X client.
        *layout.Floating.default_float_rules,
        Match(wm_class="confirmreset"),  # gitk
        Match(wm_class="makebranch"),  # gitk
        Match(wm_class="maketag"),  # gitk
        Match(wm_class="ssh-askpass"),  # ssh-askpass
        Match(title="branchdialog"),  # gitk
        Match(title="pinentry"),  # GPG key password entry

        Match(wm_class="steam"),
    ]
)

auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True

# If things like steam games want to auto-minimize themselves when losing
# focus, should we respect this or not?
auto_minimize = True
