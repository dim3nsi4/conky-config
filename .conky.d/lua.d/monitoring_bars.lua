require 'cairo'


-- GAUGES DATA CPU

gauges_cpu = {
   {
      name       = 'cpu',
      arg        = 'cpu1',
      max_value  = 100,
      x          = 0,
      y          = 0,
      xoffset    = 0,
      yoffset    = 18,
      width      = 12,
      height     = 80,
      bg_color   = 0x1a1a1a,
      bg_alpha   = 1,
      fg_color_1 = 0xFf6347,
      fg_color_2 = 0xFf6347,
      fg_alpha   = 0.75,
      mode       = "vertical",
   },
   {
      name       = 'cpu',
      arg        = 'cpu2',
      max_value  = 100,
      x          = 21,
      y          = 0,
      xoffset    = 0,
      yoffset    = 18,
      width      = 12,
      height     = 80,
      bg_color   = 0x1a1a1a,
      bg_alpha   = 1,
      fg_color_1 = 0x7ccd7c,
      fg_color_2 = 0x7ccd7c,
      fg_alpha   = 0.75,
      mode       = "vertical",
   },
   {
      name       = 'cpu',
      arg        = 'cpu3',
      max_value  = 100,
      x          = 42,
      y          = 0,
      xoffset    = 0,
      yoffset    = 45,
      width      = 12,
      height     = 53,
      bg_color   = 0x1a1a1a,
      bg_alpha   = 1,
      fg_color_1 = 0x1874cd,
      fg_color_2 = 0x1874cd,
      fg_alpha   = 0.75,
      mode       = "vertical",
   },
   {
      name       = 'cpu',
      arg        = 'cpu4',
      max_value  = 100,
      x          = 63,
      y          = 0,
      xoffset    = 0,
      yoffset    = 45,
      width      = 12,
      height     = 53,
      bg_color   = 0x1a1a1a,
      bg_alpha   = 1,
      fg_color_1 = 0xEedd82,
      fg_color_2 = 0xEedd82,
      fg_alpha   = 0.75,
      mode       = "vertical",
   },
}

-- GAUGES DATA MEMORY

gauges_mem = {
   {
      name       = 'memperc',
      arg        = '',
      max_value  = 100,
      x          = 23,
      y          = 0,
      xoffset    = 0,
      yoffset    = 45,
      width      = 12,
      height     = 53,
      bg_color   = 0x1a1a1a,
      bg_alpha   = 1,
      fg_color_1 = 0x8b008b,
      fg_color_2 = 0x8b008b,
      fg_alpha   = 0.75,
      mode       = "vertical",
   },
}


-- GAUGES DATA DISKS

gauges_disk = {
   {
      name       = 'fs_used_perc',
      arg        = '/',
      max_value  = 100,
      x          = 0,
      y          = 0*14.5,
      xoffset    = 175,
      yoffset    = 20,
      width      = 7,
      height     = 70,
      bg_color   = 0x1a1a1a,
      bg_alpha   = 1,
      fg_color_1 = 0xB3b3b3,
      fg_color_2 = 0xB3b3b3,
      fg_alpha   = 0.75,
      mode       = "horizontal",
   },
   {
      name       = 'fs_used_perc',
      arg        = '/home',
      max_value  = 100,
      x          = 0,
      y          = 1*14.5,
      xoffset    = 175,
      yoffset    = 20,
      width      = 7,
      height     = 70,
      bg_color   = 0x1a1a1a,
      bg_alpha   = 1,
      fg_color_1 = 0xB3b3b3,
      fg_color_2 = 0xB3b3b3,
      fg_alpha   = 0.75,
      mode       = "horizontal",
   },
   {
      name       = 'fs_used_perc',
      arg        = '/mnt/Storage',
      max_value  = 100,
      x          = 0,
      y          = 2*14.5,
      xoffset    = 175,
      yoffset    = 20,
      width      = 7,
      height     = 70,
      bg_color   = 0x1a1a1a,
      bg_alpha   = 1,
      fg_color_1 = 0xB3b3b3,
      fg_color_2 = 0xB3b3b3,
      fg_alpha   = 0.75,
      mode       = "horizontal",
   },
   {
      name       = 'fs_used_perc',
      arg        = '/var',
      max_value  = 100,
      x          = 0,
      y          = 3*14.5,
      xoffset    = 175,
      yoffset    = 20,
      width      = 7,
      height     = 70,
      bg_color   = 0x1a1a1a,
      bg_alpha   = 1,
      fg_color_1 = 0xB3b3b3,
      fg_color_2 = 0xB3b3b3,
      fg_alpha   = 0.75,
      mode       = "horizontal",
   },
   {
      name       = 'fs_used_perc',
      arg        = '/boot',
      max_value  = 100,
      x          = 0,
      y          = 4*14.5,
      xoffset    = 175,
      yoffset    = 20,
      width      = 7,
      height     = 70,
      bg_color   = 0x1a1a1a,
      bg_alpha   = 1,
      fg_color_1 = 0xB3b3b3,
      fg_color_2 = 0xB3b3b3,
      fg_alpha   = 0.75,
      mode       = "horizontal",
   },
   {
      name       = 'swapperc',
      arg        = '',
      max_value  = 100,
      x          = 0,
      y          = 5*14.5,
      xoffset    = 175,
      yoffset    = 20,
      width      = 7,
      height     = 70,
      bg_color   = 0x1a1a1a,
      bg_alpha   = 1,
      fg_color_1 = 0xB3b3b3,
      fg_color_2 = 0xB3b3b3,
      fg_alpha   = 0.75,
      mode       = "horizontal",
   },
}


-- RGB_TO_R_G_B
--
-- Converts color from hexa to decimal
--
function rgb_to_r_g_b(color)
   return ((color / 0x10000) % 0x100) / 255., ((color / 0x100) % 0x100) / 255., (color % 0x100) / 255.
end


-- DRAW_GAUGE_BAR

function draw_bar(cr, data, value)

    local max_value  = data['max_value']
    local x          = data['x']
    local y          = data['y']
    local xoffset    = data['xoffset']
    local yoffset    = data['yoffset']
    local width      = data['width']
    local height     = data['height']
    local bg_hex     = data['bg_color']
    local bg_alpha   = data['bg_alpha']
    local fg_hex_1   = data['fg_color_1']
    local fg_hex_2   = data['fg_color_2']
    local fg_alpha   = data['fg_alpha']
    local mode       = data['mode']

    local bg_r , bg_g , bg_b  = rgb_to_r_g_b(bg_hex)
    local fg_r1, fg_g1, fg_b1 = rgb_to_r_g_b(fg_hex_1)
    local fg_r2, fg_g2, fg_b2 = rgb_to_r_g_b(fg_hex_2)

    -- value = math.random(0,max_value)

    fg_r = fg_r2 * value/max_value + fg_r1 * (1-value/max_value)
    fg_g = fg_g2 * value/max_value + fg_g1 * (1-value/max_value)
    fg_b = fg_b2 * value/max_value + fg_b1 * (1-value/max_value)

    cairo_set_line_width(cr, line_width)

    if mode == "horizontal" then
       cairo_rectangle(cr, x + xoffset, y + yoffset, height, width)
    else
       cairo_rectangle(cr, x + xoffset, y + yoffset, width, height)
    end
    cairo_set_source_rgba(cr, bg_r, bg_g, bg_b, bg_alpha)
    cairo_fill(cr)

    if mode == "horizontal" then
       local width2  = height*value/max_value
       local height2 = width
       local x2 = x + xoffset
       local y2 = y + yoffset
       cairo_rectangle(cr, x2, y2, width2, height2)
    else
       local width2  = width
       local height2 = height*value/max_value
       local x2 = x + xoffset
       local y2 = y + yoffset + height - height2
       cairo_rectangle(cr, x2, y2, width2, height2)
    end

    cairo_set_source_rgba(cr, fg_r, fg_g, fg_b, fg_alpha)
    cairo_fill(cr)

end


-- LOAD AND DISPLAY THE GAUGES

function draw_gauges_bar(cr, gauges)

   local function load_gauge_bar(cr, data)
        local str, value = '', 0
        str = string.format('${%s %s}',data['name'], data['arg'])
        str = conky_parse(str)
        value = tonumber(str)
        draw_bar(cr, data, value)
   end

   for i in pairs(gauges) do
      load_gauge_bar(cr, gauges[i])
   end

end


-- MAIN CPU

function conky_cpu()

    if conky_window == nil then
        return
    end

    local cs = cairo_xlib_surface_create(conky_window.display,
                                         conky_window.drawable,
                                         conky_window.visual,
                                         conky_window.width,
                                         conky_window.height)
    local cr = cairo_create(cs)

    local updates = tonumber(conky_parse('${updates}'))

    if updates >= 1 then
       draw_gauges_bar(cr, gauges_cpu)
    end

    cairo_destroy(cr)
    cairo_surface_destroy(cs)
    cr = nil

end


-- MAIN MEM

function conky_mem()

    if conky_window == nil then
        return
    end

    local cs = cairo_xlib_surface_create(conky_window.display,
                                         conky_window.drawable,
                                         conky_window.visual,
                                         conky_window.width,
                                         conky_window.height)
    local cr = cairo_create(cs)

    local updates = tonumber(conky_parse('${updates}'))

    if updates >= 1 then
       draw_gauges_bar(cr, gauges_mem)
    end

    cairo_destroy(cr)
    cairo_surface_destroy(cs)
    cr = nil

end


-- MAIN DISK

function conky_disk()

    if conky_window == nil then
        return
    end

    local cs = cairo_xlib_surface_create(conky_window.display,
                                         conky_window.drawable,
                                         conky_window.visual,
                                         conky_window.width,
                                         conky_window.height)
    local cr = cairo_create(cs)

    local updates = tonumber(conky_parse('${updates}'))

    if updates >= 1 then
       draw_gauges_bar(cr, gauges_disk)
    end

    cairo_destroy(cr)
    cairo_surface_destroy(cs)
    cr = nil

end
