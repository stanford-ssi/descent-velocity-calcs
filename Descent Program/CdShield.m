function [Cd,Sf] = CdShield(h,t)
    Cd = .6;                      %Rocket Cd
    Sf = pi*(2*2.54/100)^2;
    % Two integrations of changing Cd due to Mach number; one over nosecone
    % surface and one over rocket body surface; can be done here or we can
    % make up another supporting function to do the actual integration. We
    % can also make up a completely separate function to do this kind of
    % thing, and then we can compare Cd = 0 to Cd = 0.6 to Cd = variant
end