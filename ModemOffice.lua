local w,h = term.getSize()
paintutils.drawLine(1,1,w,1,colors.cyan)
term.setCursorPos(1,1)
local toptext = "ModemOffice v1.2"
term.blit(toptext,(string.rep("f",#toptext)),(string.rep("9",#toptext)))
term.setCursorPos(1,2)
local channeltext = "Receiving channel: "
term.blit(channeltext,(string.rep("f",#channeltext)),(string.rep("b",#channeltext)))
term.setCursorPos(#channeltext,2)
local sendport = read()
local winone = window.create(term.current(),1,3,w,(math.floor(h/2) - 1))
local wintwo = window.create(term.current(),1,(math.ceil(h/2) + 2),w,(math.ceil(h/2) - 2))

winone.setBackgroundColor(colors.gray)
winone.setTextColor(colors.white)

wintwo.setBackgroundColor(colors.lightGray)

local function send()
  term.redirect(winone)
  print("What channel will this message go to?")
  local sendport = tonumber(read())
  print("Please type a message")
  local message = read()
  modem = peripheral.find("modem")
  modem.open(port)
  modem.closeAll()
  modem.transmit(port, 1, "<" .. os.getComputerLabel() .. ">" .. message)
end
local function get()
    term.redirect(wintwo)
    term.clear()
    term.setCursorPos(1,1)
    modem = peripheral.find("modem")
    modem.open(sendport)
  term.clear()
  while true do
    local event, modemSide, senderChannel, replyChannel, message, senderDistance = os.pullEvent("modem_message")
    print(message)
  end
end
parallel.waitForAll(get,send)
