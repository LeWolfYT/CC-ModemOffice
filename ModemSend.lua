print("Channel:");
port = tonumber(io.read());
print("message:");
message = io.read();
modem = peripheral.wrap("left");
modem.open(port);
model.closeAll();
modem.transmit(port, 1, message);
term.clear();
