function f = atmosphere(CdFunct,m,h0,t,y)

h = h0 - y(1);

% Modified drag
% [Cd,Sf,Sw,L] = CdFunct(h,t);
[Cd,S] = CdFunct(h,t);

% Constants
G = 6.67*10^-11;
M = 5.9723*10^24;
re = 6371000;
R = 287.058;
gamma = 1.597;

% Include Mach
a = sqrt(gamma*R*temp(h));
Ma = y(2)/a;
% Improve drag
% [u, k] = viscosity(h);
% Be = P*(L^2)/(u*k);
% Re = u*L/k;
% Cdcalc = (Sw*Be)/(Sf*(Re^2));


f(1,1) = y(2);  % Velocity
f(2,1) = G*M/((re + h)^2) - .5*Cd*S*(y(2)^2)*rho(h)/m; % Acceleration
f(3,1) = Ma;

end