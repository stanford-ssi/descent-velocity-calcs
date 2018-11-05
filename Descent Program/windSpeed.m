function [wNS,wE] = windSpeed(h)

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

        wNS = (windNSTable(i) - windNSTable(i - 1))*(h-altitude(i-1))/(altitude(i) - altitude(i - 1)) + windNSTable(i - 1);
        wE = (windETable(i) - windETable(i - 1))*(h-altitude(i-1))/(altitude(i) - altitude(i - 1)) + windETable(i - 1);
    end
end