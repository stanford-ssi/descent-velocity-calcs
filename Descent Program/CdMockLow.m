function [Cd,S] = CdMockLow(h,t)
    Cd = .6;                        %Rocket Cd
    S = pi*(2*2.54/100)^2;
    
if h < 6100/3.2808              %1500 above spaceport ground in m - main deployment
    Cd = 1.5;
    S = pi*(36*2.54/100)^2;
elseif h < 7600/3.2808                %Drogue deployment in t or h
    Cd = 1.5;
    S = pi*(10*2.54/100)^2;           %Change 10 to 16 for IREC size drogue
end

end