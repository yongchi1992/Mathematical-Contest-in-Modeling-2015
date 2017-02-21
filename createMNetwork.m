function network = createMNetwork(property)
network = zeros(property.num);


for i = 1 : property.num
    for j = 1: property.num
        if i>j
            % for neighbouring
            if abs(i-j)<=2 || abs(i-property.num)+j<=2
                network(i,j) = 1;
            end
            % for strengthening
            if sqrt(property.wholeNum(i) * property.wholeNum(j))>=850
                network(i,j) = network(i,j) + 3;
            elseif sqrt(property.wholeNum(i) * property.wholeNum(j))>=700
                network(i,j) = network(i,j) + 2;
            elseif sqrt(property.wholeNum(i) * property.wholeNum(j))>=650
                network(i,j) = network(i,j) + 1;
            else
                network(i,j) = network(i,j) + 0;
            end
        end
    end
end


