term.clear()
print("What channel do you want to recieve?")
port = tonumber(io.read())
if peripheral.wrap("left")~=nil then
  modem = peripheral.wrap("left")
else
  modem = peripheral.wrap("back")
end
modem.open(port)

while true do
  event, modemSide, senderChannel, replyChannel, message, senderDistance = os.pullEvent("modem_message")
  print("Message recieved on channel "..senderChannel)
  print(message)
end
--Credit to BasicCorruption for modem detect script
