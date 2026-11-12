-- See https://wiki.hypr.land/Configuring/Basics/Monitors/
-- Create own monitor config per system

hl.monitor({ output = "eDP-1", mode = "2880x1800@120", position = "0x0",     scale = 2 })
hl.monitor({ output = "DP-2",  mode = "3440x1440@175", position = "0x-1440", scale = 1 })

hl.config({
    cursor = {
        no_hardware_cursors = true,
    },
})

-- hl.config({
--     xwayland = {
--         force_zero_scaling = true,
--     },
-- })
