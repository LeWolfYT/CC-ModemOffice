print("Channel:");
port = tonumber(io.read());
print("message:");
message = io.read();
if (peripheral.wrap("left") == nil)
  modem = back;
else
  modem = modem = peripheral.wrap("left");
end
modem.open(port);
model.closeAll();
modem.transmit(port, 1, message);
term.clear();
