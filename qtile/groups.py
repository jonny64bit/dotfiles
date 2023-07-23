from libqtile.config import Group, Key, Match
from keys import *

groups = [
    Group("1"),
    Group("2"),
    Group(
        name="3",
        layout="max",
        matches=[Match(wm_class=["discord"]), Match(wm_class=["notion-app"])],
    ),
    Group("4"),
    Group("5"),
    Group("6"),
    Group("7"),
    Group("8"),
    Group("9")
]

for i in groups:
    keys.extend(
        [
            # mod1 + letter of group = switch to group
            Key(
                [mod],
                i.name,
                lazy.group[i.name].toscreen(),
                desc="Switch to group {}".format(i.name),
            ),
            # mod1 + shift + letter of group = switch to & move focused window to group
            Key(
                [mod, "shift"],
                i.name,
                lazy.window.togroup(i.name),
                desc="Move focused window to group {}".format(i.name),
            ),
        ]
    )
