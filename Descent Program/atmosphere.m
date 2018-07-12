function f = atmosphere(CdFunct,m,h0,t,y)

h = h0 - y(1);

[Cd,S] = CdFunct(h,t);
    
G = 6.67*10^-11;
M = 5.9723*10^24;
re = 6371000;
R = 287.058;

f(1,1) = y(2);
f(2,1) = G*M/((re + h)^2) - .5*Cd*S*(y(2)^2)*rho(h)/m;
%f(3,1) = G*M/((re + h)^2) - .5*Cd*S*(y(3)^2)*pressure(h)/(R*temp(h))/m; %Previous formula

end