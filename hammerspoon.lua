hyper = {"ctrl", "cmd", "alt"}

resizeHandler = {
  -- Max
  u = function(x, y, w, h)
    return x, y, w, h
  end,
  -- Medium
  m = function(x, y, w, h)
    return x+(w-h*0.96)/2, y+h*0.2, h*0.96, h*0.6
  end,
  -- Buttom
  j = function(x, y, w, h)
    return x, y+h*0.5, w, h*0.5
  end,
  -- Top
  k = function(x, y, w, h)
    return x, y, w, h*0.5
  end,
  -- Left
  h = function(x, y, w, h)
    return x, y, w*0.5, h
  end,
  -- Right
  l = function(x, y, w, h)
    return x+w*0.5, y, w*0.5, h
  end,
}

for key, handler in pairs(resizeHandler) do
  hs.hotkey.bind(hyper, key, function()
    local win = hs.window.focusedWindow()
    local max = win:screen():frame()
    local frame = win:frame()

    frame.x, frame.y, frame.w, frame.h = handler(max.x, max.y, max.w, max.h)
    win:setFrame(frame)
  end)
end

hs.hotkey.bind(hyper, "delete", function()
  hs.caffeinate.systemSleep()
end)
