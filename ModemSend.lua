print("ModemOffice v1.1")
print("What channel will this message go to?");
port = tonumber(read());
print("Please type a message");
message = read();
modem = peripheral.find("modem")
modem.open(port);
modem.closeAll();
modem.transmit(port, 1, "<" .. os.getComputerLabel() .. ">" .. message);
term.clear();
