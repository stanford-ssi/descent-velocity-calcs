function [s] = shockAngle(Ma, gamma, a)
% find angle of shock wave; see https://www.grc.nasa.gov/www/BGH/oblique.html
% a = angle of nosecone (radians), Ma = Mach num, gamma = adiabatic index
eqn = tan(s) * ( ((gamma + 1) * Ma^2) / (2 * (M^2 * (sin(s))^2 - 1) - 1) );
s = vpasolve(eqn == cot(a), s); 
end

