function sickTimeArrayAfter = processOneCountryOut(outProbility, outNumber, sickTimeArray, wholeNum)

sickTimeArrayAfter = sickTimeArray;
 
outInProbability = outNumber/wholeNum;


for i = 1:wholeNum
    if rand() <= outInProbability
        if rand() <= outProbility * 0.5
            if sickTimeArray(i) == 0
                if rand() <= 0.85
                    sickTimeArrayAfter(i) = -10 + randi(9) - 5;
                else
                    sickTimeArrayAfter(i) = 10 + randi(9) - 5;
                end
            end
        end
    end
end

