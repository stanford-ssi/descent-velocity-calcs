function [Cd,S] = Cd2Deploy(h,t)
    Cd = .6;                        %Rocket Cd
    S = pi*(2*2.54/100)^2;
    
    if h < 6100/3.2808                %Drogue deployment in t or h
        Cd = 1.5;
        S = pi*(14*2.54/100)^2;           %Change 12 to 16 for IREC size drogue
    elseif h < 9500 %7600                      %Streamer option
        Cd = .06;                          %Aspect ratio = 10 -> Cd = .15 AR =20 -> Cd = .1 *Very approximate - depends on material and AR*
        S = (8*2.54/100)*(80*2.54/100);   %Streamer Area
    end

end