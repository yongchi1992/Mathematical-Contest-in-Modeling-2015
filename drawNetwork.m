function axisPoint = drawNetwork(property)
theta = 2*pi/property.num;
radius = 10;
axisPoint = zeros(property.num,2);
axis([-2*radius 2*radius -2*radius 2*radius])
for i = 1:property.num
    flag = 0;
    while flag == 0
        x = radius * cos(theta*i) + randi(10) - 5;
        y = radius * sin(theta*i) + randi(10) - 5;
        flag = 1;
        for j = max(1,i-15):i-1
            if (axisPoint(j,1) - x)^2 + (axisPoint(j,2) - y)^2 <= 14
                flag = 0;
            end
        end
        if flag == 1
            axisPoint(i,1) = x;
            axisPoint(i,2) = y;
        end
    end
    
end
