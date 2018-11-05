function [Cd,S] = Cd2DeployRing(h,t)
    Cd = .6;                        %Rocket Cd
    S = pi*(2*2.54/100)^2;
    
if h < 6100/3.2808                %Drogue deployment in t or h
    Cd = 1.5;
    S = pi*(10*2.54/100)^2;           %Change 12 to 16 for IREC size drogue
elseif h < 9500 %7600                      %Streamer option
    Cd = .45;                          %Aspect ratio = 10 -> Cd = .15 AR =20 -> Cd = .1 *Very approximate - depends on material and AR*
    S = pi*(6*2.54/100)^2;   %Streamer Area
end

end