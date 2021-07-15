print("Channel:");
port = tonumber(io.read());
print("message:");
message = io.read();
modem = nil;
if (peripheral.wrap("left") == nil) then
  modem = back;
else
  modem = peripheral.wrap("left");
end
modem.open(port);
model.closeAll();
modem.transmit(port, 1, message);
term.clear();
