print("What channel will this message go to?");
port = tonumber(io.read());
print("Please type a message");
message = io.read();
modem = peripheral.find("modem")
modem.open(port);
modem.closeAll();
modem.transmit(port, 1, message);
term.clear();
