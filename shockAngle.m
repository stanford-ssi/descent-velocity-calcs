function [s] = shockAngle(Ma, gamma, a)
% find angle of shock wave; see https://www.grc.nasa.gov/www/BGH/oblique.html
% a = angle of nosecone (radians), Ma = Mach num, gamma = adiabatic index
syms x;
eqn = tan(x) * ( ((gamma + 1) * Ma^2) / (2 * (Ma^2 * (sin(x))^2 - 1) - 1) );
s = vpasolve(eqn == cot(a), x); 
s = double(s);
s = mod(s, 2 * pi);
s = 2 * pi - s;
disp(s);
end

