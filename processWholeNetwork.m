function property = processWholeNetwork(network, property)

for i = 1 : property.num
    property.sickTime(i,:) = processOneCountry(property.couplingProperty(i), property.sickTime(i,:), property.wholeNum(i));
    
    for j = 1 : property.num
        for k = 1 : property.num
            if (j == i || k == i) && (network(j,k)~=0)
                outNumber = 20*network(j,k);
                if j==i
                    outProbility = property.sickNum(k)/property.wholeNum(k);
                elseif k==i
                    outProbility = property.sickNum(j)/property.wholeNum(j);
                end
                property.sickTime(i,:) = processOneCountryOut(outProbility, outNumber, property.sickTime(i,:), property.wholeNum(i));
            end 
        end
    end
    property.sickNum(i) = sum(property.sickTime(i,:)<=-2) + sum(property.sickTime(i,:)>=2);
    property.deadNum(i) = sum(property.sickTime(i,:) == -1);
    property.freeNum(i) = sum(property.sickTime(i,:) == 1);
    property.waiting(i) = sum(property.sickTime(i,:) == 0)- 1000 + property.wholeNum(i);
end
%disp(sum(property.deadNum(5))/(sum(property.freeNum(5))+sum(property.sickNum(5))+sum(property.deadNum(5))+sum(property.waiting(5))));
%disp(sum(property.waiting(:))/(sum(property.freeNum(:))+sum(property.sickNum(:))+sum(property.deadNum(:))+sum(property.waiting(:))));