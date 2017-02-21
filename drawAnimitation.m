function drawAnimitation(axisPoint, property, network)
for i = 1:property.num
    
    red = (property.wholeNum(i) - property.deadNum(i))/property.wholeNum(i);
    yellow = property.waiting(i)/property.wholeNum(i);
    scatter(axisPoint(i,1), axisPoint(i,2) , property.wholeNum(i)/2,[0, 0, 0])
    scatter(axisPoint(i,1), axisPoint(i,2) , property.wholeNum(i)/2,[red, yellow, yellow],'filled')
end
for i = 1 : property.num
    for j = 1 : property.num
        if network(i,j) ~= 0
            xPoint = [axisPoint(i,1),axisPoint(j,1)];
            yPoint = [axisPoint(i,2),axisPoint(j,2)];
            lineWidth = network(i,j);
            if lineWidth < 3
                line(xPoint,yPoint,'LineWidth',lineWidth/5, 'Color', [lineWidth/4,1-lineWidth/4,1-lineWidth/4])
            elseif lineWidth <=4
                line(xPoint,yPoint,'LineWidth',lineWidth/2, 'Color', [lineWidth/4,1-lineWidth/4,1-lineWidth/4])
            end
           
        end
    end
end
