function probability = ebola(dayNumber)

delta = [0.01 0.01 0.03 0.03 0.03 0.03 0.03 0.03 0.05 0.08 0.15 0.15 0 0 0 0.15 0.15 0.08 0.08 0.08 0.03 0.03 0.03 0.03 0.03 0.03 0.01 0.01 0.01];
if dayNumber >= 16 || dayNumber <= -14
    probability = 0;
else
    probability = delta(dayNumber + 14); 
end