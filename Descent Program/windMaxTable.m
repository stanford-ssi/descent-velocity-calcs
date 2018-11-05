function [wNS,wE] = windMaxTable(h)

    altitude = altWindTable();
    max = numel(altitude);
    A = altitude(1);
    i = 0;
    
    if h < 0 || h > altitude(1)
        wNS = 0;
        wE = 0;
%     elseif h < altitude(end)
%         wNS = windNSTable(max);
%         wE = windETable(max);
    else
        while h <= A && i < max
          i = i + 1;
          A = altitude(i); 
        end

        wNS = (maxNSTable(i) - maxNSTable(i - 1))*(h-altitude(i-1))/(altitude(i) - altitude(i - 1)) + maxNSTable(i - 1);
        wE = (maxETable(i) - maxETable(i - 1))*(h-altitude(i-1))/(altitude(i) - altitude(i - 1)) + maxETable(i - 1);
    end
end