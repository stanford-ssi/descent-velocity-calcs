function [Cd,S] = CdRocket(Ma, U, gamma)
    %Cd = .6;                        %Baseline Rocket Cd
    %S = pi*(2*2.54/100)^2;
    
    %TO DO: 
    % Double check the physics/math in general
    % Figure out a less sketchy way to calculate Cp from nosecone + from wake of rocket (??). A flow-perpendicular plate
    %   is being assumed right now and that might not be applicable because the flow at the wake will be comparatively 
    %   very disturbed after flowing past the whole rocket's body.
    % Make Sparalx vector.
    
    
    % The theory we find in textbooks describes near Mach forces using Cp and Cf separately, not Cd
    % Skye's comments suggest we calculate drag from the Bejan and Reynold's number,
    % but for Be you need pressure drop, which we don't have (wind tunnel results??)
    % PSA: +x = against direction of travel, with x = 0 at the tip of the nosecone
    
    %% Cf
    % This uses a baseline Cf calculation that doesn't consider different flow regimes 
    % (different regime, different Cf = f(Re)).
    % Consider using Ch 9 in Smits, where local Cf is integrated considering flow regime:
    % http://www.efluids.com/efluids/books/Smits_text_part1.pdf
    % This all also uses flat plate theory for Cf estimation which is sus
    L_rocket = 2;   % meters % dummy numbers
    L_nosecone = 0.2; % meters % dummy numbers
    L = L_rocket + L_nosecone;
    D = 0.1016; % 4 inches in meters
    R = D/2; % radius
    Sparal = L_rocket*2*pi*R + L_nosecone*pi*R;     % surface area parallel to flow, nosecone contribution is cos(theta)*S_cone
    Sperp = pi*R^2;      % ...perpendicular to flow (for spaceshot, rly just the nosecone)
    
    viscosity = viscosity(temp); % [dynamic, kinematic]
    n = 10; % # sections rocket is being split up into
    x_vals = linspace(0, L, n); % vector of x values running down the height of the rocket
    Rex_vals = U.*x_vals./viscosity(2); % (sketchy) ASSUMPTION: Reynolds number profile resembles that of a flat plate boundary layer as a function of x
    Cfx = 0.664./sqrt(Rex_vals); % flat plate theory
    AF = 1 + ( (Ma^2)*((gamma-1)/2) ); % mach adjustment factor
    Cfx_Ma = Cfx./AF; % mach adjusted
    
    while (Sparal > 0);
        % make sparalx vector
    end
    
    %% Cp
    Cp = 1.28; % Cd for a flat plate perpendicular to flow (Cf for this is 0, so Cd = Cp)
    Cp_Ma = Cp/sqrt(1 - Ma^2);
    
    %% Compile Calculations
    % Dividing by the total parallel area to find average Cf is an extra step considering atmosphere.m
    %    multiplies back again by total parallel area. This is just for readability.
    Sparal = sum(Sparalx);
    Cf = Cfx_Ma*transpose(Sparalx)/Sparal;
    S = [Sparal, Sperp];
    Cp = Cp_Ma;
    Cd = [Cf, Cp];
end
