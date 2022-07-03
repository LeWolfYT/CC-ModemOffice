term.clear()
term.setCursorPos(1,1)
print("ModemOffice v1.1")
print("What channel do you want to recieve?")
port = tonumber(io.read())
modem = peripheral.find("modem")
modem.open(port)

while true do
  event, modemSide, senderChannel, replyChannel, message, senderDistance = os.pullEvent("modem_message")
  print(message)
end
