function [Cd,S] = CdDrogueOnly(h,t)
    Cd = .6;                        %Rocket Cd
    S = pi*(2*2.54/100)^2;
    
if h < 6100/3.2808                %Drogue deployment in t or h
    Cd = 1.5;
    S = pi*(16*2.54/100)^2;           
end

end