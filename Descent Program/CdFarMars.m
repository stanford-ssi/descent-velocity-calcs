function [Cd,S] = CdFarMars(h,t)
    Cd = .6;                        %Rocket Cd
    S = pi*(2*2.54/100)^2;
    
    if h < 5600/3.2808                %Drogue deployment in t or h
        Cd = 2.2;
        S = pi*(36*2.54/100)^2;           %Change 12 to 16 for IREC size drogue
    elseif t > 1 %7600                      %Streamer option
        Cd = 1.5;
        S = pi*(12*2.54/100)^2;
    end

end