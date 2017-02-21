function property = createNetworkProperty(networkNum)
property.num = networkNum;
property.wholeNum = zeros(networkNum,1);
property.sickNum = zeros(networkNum,1);
property.deadNum = zeros(networkNum,1);
property.freeNum = zeros(networkNum,1);
property.waiting = zeros(networkNum,1);
property.couplingProperty = zeros(networkNum,1);
sickTimeHere = zeros(1,1000);
property.sickTime = repmat(sickTimeHere,[networkNum,1]);

%   1: network number
%   2: whole number
%   3: sick number
%   4: coupling variable
%   5: sick time


for i = 1:networkNum
    
    % people number
    property.wholeNum(i) = randi([200,1000]);
    % coupling number
    property.couplingProperty(i) = randi([4,20]);
    
end
