function dragForce = pressureDrag(h, Ma) 
% Inputs
a = 0.2; % angle of nose cone, radians
% L_nosecone = 0.25; maybe use this if we decide to integrate pressure
diam = 0.1016;
gamma = 1.4; % should make a temp-based function for this--adiabatic index
P_0 = pressure(h); % atmospheric pres

s = shockAngle(Ma, gamma, a);
% P_1 = pressure behind shock wave; see https://www.grc.nasa.gov/www/BGH/oblique.html
P_1 = (P_0 * (2 * gamma * Ma^2 * (sin(s))^2 - (gamma - 1))) / (gamma + 1);
A = (diam / 2)^2 * pi;
dragForce = (P_1 - P_0) * A;
disp(dragForce);
end
