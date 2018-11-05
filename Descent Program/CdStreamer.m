function [Cd,S] = CdStreamer(h,t)
    Cd = .6;                        %Rocket Cd L1
    S = pi*(1*2.54/100)^2;
    
    if h < 150 + 4600/3.2808                    %Streamer option
        Cd = .06; %.15;                          %Aspect ratio = 10 -> Cd = .15 AR =20 -> Cd = .1 *Very approximate - depends on material and AR*
        S = 3*(4*2.54/100)*(40*2.54/100);%2*(3.25*2.54/100)*(32.5*2.54/100);   %Streamer Area
    end

end