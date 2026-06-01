
local mainMod = "SUPER"
local terminal = "kitty"
local menu = "hyprlauncher" 

-------------------
-- KEYBINDINGS --
-------------------

hl.bind(mainMod .. " + RETURN", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + Q", hl.dsp.window.close())

hl.bind(mainMod .. " + E", hl.dsp.exec_cmd("kitty -e yazi"))
hl.bind(mainMod .. " + M", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen())
hl.bind(mainMod .. " + R", hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + P", hl.dsp.window.pseudo())
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd("brave"))
hl.bind(mainMod .. " + L", hl.dsp.exec_cmd("hyprlock"))

-------------------------
-- CLIPBOARD / SCREENSHOT
-------------------------

hl.bind(
    mainMod .. " + PRINT",
    hl.dsp.exec_cmd('grim - | wl-copy')
)

hl.bind(
    mainMod .. " + SHIFT + PRINT",
    hl.dsp.exec_cmd('grim -g "$(slurp)" - | wl-copy')
)

hl.bind(
    "PRINT",
    hl.dsp.exec_cmd(
        'grim -g "$(slurp)" ~/Pictures/screenshot-$(date +%s).png'
    )
)

hl.bind(
    mainMod .. " + V",
    hl.dsp.exec_cmd(
        'cliphist list | rofi -dmenu -theme ~/.config/rofi/files/launchers/type-7/style-1.rasi | cliphist decode | wl-copy'
    )
)

------------------
-- WINDOW FOCUS --
------------------

hl.bind(mainMod .. " + LEFT",  hl.dsp.focus({ direction = "l" }))
hl.bind(mainMod .. " + RIGHT", hl.dsp.focus({ direction = "r" }))
hl.bind(mainMod .. " + UP",    hl.dsp.focus({ direction = "u" }))
hl.bind(mainMod .. " + DOWN",  hl.dsp.focus({ direction = "d" }))

----------------
-- WORKSPACES --
----------------

for i = 1, 9 do
    hl.bind(
        mainMod .. " + " .. i,
        hl.dsp.focus({ workspace = i })
    )

    hl.bind(
        mainMod .. " + SHIFT + " .. i,
        hl.dsp.window.move({ workspace = i })
    )
end

hl.bind(
    mainMod .. " + 0",
    hl.dsp.focus({ workspace = 10 })
)

hl.bind(
    mainMod .. " + SHIFT + 0",
    hl.dsp.window.move({ workspace = 10 })
)

--------------------
-- MOUSE WORKSPACE --
--------------------

hl.bind(
    mainMod .. " + mouse_down",
    hl.dsp.focus({ workspace = "e+1" })
)

hl.bind(
    mainMod .. " + mouse_up",
    hl.dsp.focus({ workspace = "e-1" })
)

-------------------
-- WINDOW DRAGGING
-------------------

hl.bind(
    mainMod .. " + mouse:272",
    hl.dsp.window.drag(),
    { mouse = true }
)

hl.bind(
    mainMod .. " + mouse:273",
    hl.dsp.window.resize(),
    { mouse = true }
)

-------------------
-- AUDIO CONTROLS
-------------------

hl.bind(
    "XF86AudioRaiseVolume",
    hl.dsp.exec_cmd(
        "wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"
    ),
    { repeating = true, locked = true }
)

hl.bind(
    "XF86AudioLowerVolume",
    hl.dsp.exec_cmd(
        "wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
    ),
    { repeating = true, locked = true }
)

hl.bind(
    "XF86AudioMute",
    hl.dsp.exec_cmd(
        "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
    ),
    { repeating = true, locked = true }
)

hl.bind(
    "XF86AudioMicMute",
    hl.dsp.exec_cmd(
        "wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
    ),
    { repeating = true, locked = true }
)

--------------------
-- BRIGHTNESS KEYS
--------------------

hl.bind(
    "XF86MonBrightnessUp",
    hl.dsp.exec_cmd(
        "brightnessctl -e4 -n2 set 5%+"
    ),
    { repeating = true, locked = true }
)

hl.bind(
    "XF86MonBrightnessDown",
    hl.dsp.exec_cmd(
        "brightnessctl -e4 -n2 set 5%-"
    ),
    { repeating = true, locked = true }
)

-------------------
-- MEDIA KEYS
-------------------

hl.bind(
    "XF86AudioNext",
    hl.dsp.exec_cmd("playerctl next"),
    { locked = true }
)

hl.bind(
    "XF86AudioPause",
    hl.dsp.exec_cmd("playerctl play-pause"),
    { locked = true }
)

hl.bind(
    "XF86AudioPlay",
    hl.dsp.exec_cmd("playerctl play-pause"),
    { locked = true }
)

hl.bind(
    "XF86AudioPrev",
    hl.dsp.exec_cmd("playerctl previous"),
    { locked = true }
)

-------------------
-- CUSTOM
-------------------

hl.bind(
    "ALT + SPACE",
    hl.dsp.exec_cmd(
        "~/.config/rofi/files/scripts/launcher_t7"
    )
)

hl.bind(
    mainMod .. " + SHIFT + S",
    hl.dsp.exec_cmd("systemctl suspend")
)

hl.bind(
    mainMod .. " + SHIFT + L",
    hl.dsp.exit()
)



