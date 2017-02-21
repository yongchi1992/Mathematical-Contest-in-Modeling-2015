
% if you want to simulate a model with 30 country:
countryNum = 25;

property = createNetworkProperty(countryNum);

% generate network from variable "property":
network = createMNetwork(property);

% generate the axisPoint
axisPoint = drawNetwork(property);

% initial netowrk
property = initialNetwork(property);

% set process number
processTime = 40;

% recorde the data
result.sickNum = zeros(processTime,countryNum);
result.freeNum = zeros(processTime,countryNum);
result.waiting = zeros(processTime,countryNum);
result.deadNum = zeros(processTime,countryNum);

% begin graphic animation
figure;
hold;

% begin process the network
for i = 1:processTime   
    property = processWholeNetwork(network, property);
    
    result.sickNum(i,:) = property.sickNum;
    result.freeNum(i,:) = property.freeNum;
    result.deadNum(i,:) = property.deadNum;
    result.waiting(i,:) = property.waiting;
    
    % draw figure
    drawAnimitation(axisPoint, property, network);
    
    % show the process time
    disp(i);
    pause(0.3);
    
    %---------------BE----CAUTIOUS-------------------------------
    %---------------Here is for figure capture-------------------
    %------------------------------------------------------------
    %     prompt = '';
    %     str = input(prompt,'s');
    %------------------------------------------------------------
    
end