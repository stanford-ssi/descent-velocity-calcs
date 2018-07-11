function f = atmosphere(m,h0,t,y)

h = h0 - y(1);

Cd = .6;                        %Rocket Cd
S = pi*(2*2.54/100)^2;

if h < 6100/3.2808              %1500 above spaceport ground in m - main deployment
    Cd = 1.5;
    S = pi*(45*2.54/100)^2;
elseif t > 10                    %Drogue deployment in t or h
    Cd = 1.5;
    S = pi*(16*2.54/100)^2;
end
    
G = 6.67*10^-11;
M = 5.9723*10^24;
re = 6371000;
R = 287.058;

f(1,1) = y(2);
f(2,1) = G*M/((re + h)^2) - .5*Cd*S*(y(2)^2)*pressure(h)/(R*temp(h))/m;
%I'm working on substituting in a density table, but it's in pdf, so I have to type it in

end