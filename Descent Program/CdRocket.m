function [Cd, S] = CdRocket(h, U, Ma)
	visc = viscosity(temp(h));		% [dynamic, kinematic]
	L_rocket = 2; 				% meters
	L_nosecone = 0.2;			% meters
	L = L_rocket + L_nosecone;
	D = 0.1016;				% = 4 inches
	R = D/2;
	Re = U*L/visc(2);
	
	% approach #1 using (Mach << 1) Cp approximation
	Cp = 1.28; 				% Cd for a flat plate perpendicular to flow
	Pfront = 0.5*Cp*rho(h)*(U^2);
	% approach #2 using reynolds momentum transport theorem on a "streamline" over the nosecone (assumes slip condition, Mach << 1)
	v1x = U;
	v1y = 0;
	theta = atan(R/L_nosecone);
	v2x = U*cos(theta);
	v2y = U*sin(theta);
	FoverA(1) = abs((v1x^2)*rho(h) - (v2x^2)*rho(h));	% reynolds transport formula without the area term (later accounted for)
	FoverA(2) = abs((v1y^2)*rho(h) - (v2y^2)*rho(h));
	Aratio = sin(theta);					% ratio of control volume's dA (surface perpendicular to flow and touching the tip of the nosecone) to the corresponding nosecone surface area spanned by the control volume.
	P = FoverA*Aratio;					% F/A on the nosecone [x,y]
	Pfront = P(1)*sin(theta) + P(2)*cos(theta);
	Pfront = Pfront / sqrt(1 - Ma^2);		% mach adjustment

	Pback = 0;
	dP = Pfront - Pback;
	Be = dP*(L^2) / (visc(1)*visc(2));

	Awet = pi*R*sqrt(L_nosecone^2 + R^2) + 2*pi*R*L_rocket + pi*R^2;
	Afront = pi*R^2;
	Cd = 2*Be*Awet / (Afront*Re^2);
	S = Afront;
