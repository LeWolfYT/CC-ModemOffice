print("What channel will this message go to?");
port = tonumber(io.read());
print("Please type a message");
message = io.read();
modem = peripheral.wrap("left");
modem.open(port);
model.closeAll();
modem.transmit(port, 1, message);
term.clear();
