local w,h = term.getSize()
paintutils.drawLine(1,1,w,1,colors.cyan)
term.setCursorPos(1,1)
local toptext = "ModemOffice v1.2"
term.blit(toptext,(string.rep("f",#toptext)),(string.rep("9",#toptext)))
local winone = window.create(term.current(),1,2,w,(math.floor(h/2) - 1))
local wintwo = window.create(term.current(),1,(math.ceil(h/2) + 1),w,(math.ceil(h/2) - 1))

winone.setBackgroundColor(colors.gray)
winone.setTextColor(colors.white)

wintwo.setBackgroundColor(colors.lightGray)

local function get()
  term.redirect(winone)
  print("What channel will this message go to?")
  local port = tonumber(read())
  print("Please type a message")
  local message = read()
  modem = peripheral.find("modem")
  modem.open(port)
  modem.closeAll()
  modem.transmit(port, 1, "<" .. os.getComputerLabel() .. ">" .. message)
end
local function send()
    term.redirect(wintwo)
    term.clear()
    term.setCursorPos(1,1)
    print("What channel do you want to recieve?")
    local port = tonumber(io.read())
    modem = peripheral.find("modem")
    modem.open(port)
  term.clear()
  while true do
    local event, modemSide, senderChannel, replyChannel, message, senderDistance = os.pullEvent("modem_message")
    print(message)
  end
end
parallel.waitForAll(get,send)
