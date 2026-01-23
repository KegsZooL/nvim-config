local ok, smear_cursor = pcall(require, "smear_cursor")
if not ok then return end

smear_cursor.setup({
    particles_enabled = true,
    stiffness = 0.95,                      -- 0.6      [0, 1]
    trailing_stiffness = 0.6,             -- 0.45     [0, 1]
    stiffness_insert_mode = 0.7,          -- 0.5      [0, 1]
    trailing_stiffness_insert_mode = 0.7, -- 0.5      [0, 1]
    damping = 0.95,                       -- 0.85     [0, 1]
    damping_insert_mode = 0.95,           -- 0.9      [0, 1]
    distance_stop_animating = 0.5,        -- 0.1      > 0
    min_distance_emit_particles = 0,
    hide_target_hack = true,
    never_draw_over_target = true
})
