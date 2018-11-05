function [Cd,S] = CdApogeeDeploy(h,t)
    Cd = .6;                        %Rocket Cd
    S = pi*(2*2.54/100)^2;
    
    if h < 6100/3.2808                %Drogue deployment in t or h
        Cd = 1.5;
        S = pi*(14*2.54/100)^2;           %Change 12 to 16 for IREC size drogue
    elseif t > 1                      %Streamer option
        Cd = .15;                          %Aspect ratio = 10 -> Cd = .15 AR =20 -> Cd = .1 *Very approximate - depends on material and AR*
        S = 2*(3.25*2.54/100)*(32.5*2.54/100);   %Streamer Area
    end

end