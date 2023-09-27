serialPort = '/dev/tty.usbmodem1301'; % Replace 'COMX' with your actual port name
baudRate = 57600; % Match the baud rate in your Arduino code

% Open the serial port
ser = serial(serialPort, 'BaudRate', baudRate);
fopen(ser);
numDataPoints = 100; % Change this to the number of data points you want to read
x = 1:numDataPoints;
y = zeros(1,numDataPoints);
hLine = plot(x,y);
ylim([0.0, 260.0]);
StripChart('Initialize',gca)
while 1==1
    data = fscanf(ser, '%lf');
    disp(data);
    StripChart('Update',hLine,data)
end