function f = atmosphere(CdFunct,m,h0,t,y)

h = h0 - y(1); % current height

% Modified drag
% [Cd,Sf,Sw,L] = CdFunct(h,t);
[Cd,S] = CdFunct(h,t);

% Constants
G = 6.67*10^-11; % Gravitational constant
M = 5.9723*10^24; % Mass of Earth
re = 6371000; % Radius of Earth
R = 287.058;
gamma = 1.597;

% Do pressure drag and integrate here, or call a suppporting function
% that does that here

% Include Mach/improved drag
% a = sqrt(gamma*R*temp(h));
% Ma = y(2)/a;
% [u, k] = viscosity(h);
% Be = P*(L^2)/(u*k);
% Re = u*L/k; Reynolds Number
% Cdcalc = (Sw*Be)/(Sf*(Re^2));


f(1,1) = y(2);  % Velocity
f(2,1) = G*M/((re + h)^2) - .5*Cd*S*(y(2)^2)*rho(h)/m; % Acceleration 
f(3,1) = y(4);  % Velocity no drag
f(4,1) = G*M/((re + h0 - y(3))^2); % Dragless acceleration
f(5,1) = .5*Cd*S*(y(2)^2)*rho(h)/m; % Acceleration due to drag

end