function [Cd,S] = Cd3Deploy(h,t)
    Cd = .6;                        %Rocket Cd
    S = pi*(2*2.54/100)^2;
    
if h < 6100/3.2808              %1500 above spaceport ground in m - main deployment
    Cd = 1.5;
    S = pi*(45*2.54/100)^2;
elseif h < 9100/3.2808                %Drogue deployment in t or h
    Cd = 1.5;
    S = pi*(10*2.54/100)^2;           %Change 10 to 16 for IREC size drogue
elseif h < 10500                      %Streamer option
    Cd = .1;                          %Aspect ratio = 10 -> Cd = .15 AR =20 -> Cd = .1 *Very approximate - depends on material and AR*
    S = (4*2.54/100)*(80*2.54/100);   %Streamer Area
end

end