
clear
close all

% Inputs
t0 = 0;
tf = 2000;
vi = 0;             %Initial conditions
yi = [0,vi,0];      %Initial velocity
h0 = 100000;        %Apogee height m
he = 4600/3.2808;   %Spaceport elevation converted to meters
m = 10;             %Rocket mass kg

funct = {@CdRocket, @Cd3Deploy};    %Drag profile (Can be many)

for j = 1:numel(funct)
    
    % Numerical ODE
    [T,Y]= ode45(@(t,y) atmosphere(funct{j},m,h0,t,y),[t0,tf],yi);
    
    % Extract data
    i = 1;
    t(i) = T(i);    % time
    h(i) = h0 - Y(i,1); % height
    v(i) = Y(i,2);  % velocity
    MaI(i) = Y(i,3);    % Integrted Mach #
    for i = 2:numel(T)
        if h0 - Y(i-1,1) >= he
           t(i) = T(i);
           h(i) = h0 - Y(i,1);
           v(i) = Y(i,2);
           MaI(i) = Y(i,3);
        end
    end
    
    % Plot data
    figure(1)
    plot(t,h)
    hold on
    
    figure(2)
    yyaxis left
    plot(t,v)
    hold on
    
    figure(3)
    plot(h,v)
    hold on
    
    F = m*diff(v)./diff(t);
    
    figure(4)
    plot(t,[0 F])
    hold on
    
    Ma = diff(MaI)./diff(t);
    
    figure(2)
    yyaxis right
    plot(t,[0 Ma])
    hold on

end

%Format plots
funcStr = strings;
for k = 1:numel(funct)
   funcStr(k,:) = func2str(funct{k}); 
end

figure(1)
plot(t,ones(size(t))*he,t,h0 - 4.9*(t.^2))
xlabel("Time (s)")
ylabel("Height (m)")
ylim([0 h0])
legend([funcStr;"Ground";"No drag"])

figure(2)
xlabel("Time (s)")
yyaxis left
ylabel("Velocity (m/s)")
yyaxis right
ylabel("Mach #")
legend(funcStr,"Location","best")

figure(3)
xlabel("Height (m)")
ylabel("Velocity (m/s)")
xlim([0 h0])
legend(funcStr)

figure(4)
xlabel("Time (s)")
ylabel("Force (N)")
legend(funcStr)
