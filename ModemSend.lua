print("What channel will this message go to?");
port = tonumber(io.read());
print("Please type a message");
message = io.read();
if peripheral.wrap("left")~=nil then
  modem = peripheral.wrap("left")
else
  modem = peripheral.wrap("back")
end
modem.open(port);
model.closeAll();
modem.transmit(port, 1, message);
term.clear();
