term.clear()
print("What channel do you want to recieve?")
port = tonumber(io.read())
modem = peripheral.wrap("left")
modem.open(port)

while true do
  event, modemSide, senderChannel, replyChannel, message, senderDistance = os.pullEvent("modem_message")
  print("Message recieved on channel "..senderChannel)
  print(message)
end
