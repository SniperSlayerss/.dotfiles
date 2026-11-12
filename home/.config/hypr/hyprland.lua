----------------
---- MONITORS ----
----------------

-- Create own monitor config per system
-- NOTE: loaded first, same as the old `source=` order, so anything below
-- (e.g. cursor.no_hardware_cursors) overrides it.
require("monitors")

local c                = require("rose-pine")

local terminal         = "alacritty"
local fileManager      = "dolphin"
local menu             = "tofi-drun --drun-launch=true"
local screenshotRegion = "hyprshot -m region -o ~/screenshots/"

---------------------
---- AUTOSTART ------
---------------------

hl.on("hyprland.start", function()
    hl.exec_cmd("waybar")
    hl.exec_cmd("awww-daemon")
    hl.exec_cmd("gsettings set org.gnome.desktop.interface cursor-theme BreezeX-RosePine-Linux")
    hl.exec_cmd("gsettings set org.gnome.desktop.interface cursor-size 20")
    hl.exec_cmd("awww img Downloads/Wallpapers/faye-webster.png --resize=fit")
    hl.exec_cmd("/usr/bin/lxqt-policykit-agent")
end)

hl.env("XCURSOR_THEME", "rose-pine-hyprcursor")
hl.env("XCURSOR_SIZE", "30")
hl.env("HYPRCURSOR_THEME", "rose-pine-hyprcursor")
hl.env("HYPRCURSOR_SIZE", "30")

---------------------
---- AESTHETICS -----
---------------------

-- hl.window_rule({ match = { class = "(.*)(Alacritty)$" }, opacity = "0.97 0.97 override" })
-- hl.window_rule({ match = { class = "(.*)(code)$" },      opacity = "0.97 0.97 override" })

hl.config({
    general = {
        gaps_in          = 2,
        gaps_out         = 0,

        border_size      = 0,

        col              = {
            active_border   = { colors = { c.rose, c.pine, c.love, c.iris }, angle = 90 },
            inactive_border = "rgba(595959aa)",
        },

        resize_on_border = true,

        allow_tearing    = false,

        layout           = "dwindle",
    },

    -- https://wiki.hypr.land/Configuring/Basics/Variables/#decoration
    decoration = {
        rounding         = 0,

        active_opacity   = 1,
        inactive_opacity = 1,

        blur             = {
            enabled  = true,
            size     = 12,
            passes   = 2,

            vibrancy = 0.1696,
        },
    },

    animations = {
        enabled = false,
    },

    cursor = {
        no_hardware_cursors = false,
    },

    dwindle = {
        -- pseudotile = true, -- bound to mainMod + P in the keybinds section below
        preserve_split = true, -- You probably want this
    },

    misc = {
        force_default_wallpaper = 0,    -- Set to 0 or 1 to disable the anime mascot wallpapers
        disable_hyprland_logo   = true, -- disables the random hyprland logo / anime girl background
    },
})

-- Default animations, see https://wiki.hypr.land/Configuring/Core/Animations/
-- (globally disabled above, kept so you can flip animations.enabled back on)
hl.curve("myBezier", { type = "bezier", points = { { 0.05, 0.9 }, { 0.1, 1.05 } } })

hl.animation({ leaf = "windows", enabled = true, speed = 7, bezier = "myBezier" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 7, bezier = "default", style = "popin 80%" })
hl.animation({ leaf = "border", enabled = true, speed = 10, bezier = "default" })
hl.animation({ leaf = "borderangle", enabled = true, speed = 8, bezier = "default" })
hl.animation({ leaf = "fade", enabled = true, speed = 7, bezier = "default" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 6, bezier = "default" })

-------------
---- INPUT --
-------------

hl.config({
    input = {
        kb_layout      = "us",
        kb_options     = "caps:escape, altwin:swap_alt_win",

        accel_profile  = "flat",
        follow_mouse   = 1,
        force_no_accel = true,

        sensitivity    = -0.5, -- -1.0 - 1.0, 0 means no modification.

        touchpad       = {
            natural_scroll = true,
        },
    },
})

hl.device({
    name        = "epic-mouse-v1",
    sensitivity = -0.5,
})

-------------------
---- KEYBINDINGS --
-------------------

local mainMod = "SUPER"

hl.bind(mainMod .. " + RETURN", hl.dsp.exec_cmd(terminal))

hl.bind(mainMod .. " + Q", hl.dsp.window.close())
hl.bind(mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + D", hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + P", hl.dsp.window.pseudo())       -- dwindle

hl.bind(mainMod .. " + J", hl.dsp.layout("togglesplit")) -- dwindle only

hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen())

-- Toggle waybar
hl.bind("CTRL + ALT + W", hl.dsp.exec_cmd("killall waybar || waybar"))

hl.bind("Print", hl.dsp.exec_cmd(screenshotRegion))
hl.bind("SHIFT + Print", hl.dsp.exec_cmd("~/.config/hypr/screenshot-org.sh"))

-- Move focus with mainMod + arrow keys
hl.bind(mainMod .. " + Left", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + Right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + Up", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + Down", hl.dsp.focus({ direction = "down" }))

-- Switch workspaces with mainMod + [0-9]
-- Move active window to a workspace with mainMod + SHIFT + [0-9]
for i = 1, 10 do
    local key = i % 10 -- 10 maps to key 0
    hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
    hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

-- Example special workspace (scratchpad)
hl.bind(mainMod .. " + S", hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

-- Scroll through existing workspaces with mainMod + scroll
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

------------------------------
---- WINDOWS AND WORKSPACES --
------------------------------

-- hl.window_rule({ match = { class = ".*" }, suppress_event = "maximize" })
-- hl.window_rule({ match = { class = "^(Unity)$" }, scale = 2.5 })
