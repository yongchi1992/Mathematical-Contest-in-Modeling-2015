function property = initialNetwork(property)
for i = 1:20
    y = randi(200);
    x = randi(1);
    property.sickTime(x,y) = 12;
end