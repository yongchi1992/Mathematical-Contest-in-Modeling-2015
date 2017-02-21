function sickTimeArrayAfter = processOneCountry(coupling, sickTimeArray, wholeNum)

sickTimeArrayAfter = sickTimeArray;

for i = 1 : wholeNum
   if sickTimeArray(i) > 2
       % sick but will survive
       sickTimeArrayAfter(i) = sickTimeArray(i) - 1;
   elseif sickTimeArray(i) < -2
       % sick, will be dead, but not this time
       sickTimeArrayAfter(i) = sickTimeArray(i) + 1;
   elseif sickTimeArray(i) == 2
       % become healthy and will never get ebola
       sickTimeArrayAfter(i) = 1;
   elseif sickTimeArray(i)  == -2
       % sick and will be dead
       sickTimeArrayAfter(i) = -1;
   elseif sickTimeArray(i) == 0
       % healthy people, have a certain probability to be sick
       connection = i-fix(coupling/2):i+fix(coupling/2);
       %disp(numel(connection));
       probabilityThisTime = 1;
       
       for j = 1:numel(connection)
           if connection(j)<=0
               connection(j) = connection(j) + wholeNum;
           end
           if connection(j)>=1001
               connection(j) = connection(j) - wholeNum;
           end
           probabilityThisTime = probabilityThisTime*(1-ebola(sickTimeArray(connection(j))));
       end
       for j = 1:fix(numel(connection)/2)
           probabilityThisTime = probabilityThisTime*(1-ebola(sickTimeArray(randi(wholeNum))));
       end
       
       probabilityThisTime = 1 - probabilityThisTime;
%        disp(probabilityThisTime)
%        disp(sickTimeArray(connection))
       if rand() <= probabilityThisTime
           if rand() <= 0.85
               sickTimeArrayAfter(i) = -12 + randi(9) - 5;
           else
               sickTimeArrayAfter(i) = 12 + randi(9) - 5;
           end
       end
   end
end