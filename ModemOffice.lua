local w,h = term.getSize()

local winone = window.create(term.current(),1,1,w,math.floor(h/2))
local wintwo = window.create(term.current(),1,math.ceil(h/2),w,math.ceil(h/2))

winone.setBackgroundColor(colors.gray)
winone.setTextColor(colors.white)

wintwo.setBackgroundColor(colors.lightGray)

local function get()
  term.redirect(winone)
  shell.run("./ModemStart.lua")
end
local function send()
  while true do
    term.redirect(wintwo)
  end
end
parallel.waitForAll(get,send)
