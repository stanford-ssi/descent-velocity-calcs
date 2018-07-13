
clear all
close all

t0 = 0;
tf = 2000;
vi = 0;
yi = [0,vi];
h0 = [100000,4500];        %Apogee height m
he = 4500/3.2808;   %Spaceport elevation converted to meters
m = [20,20];             %Rocket mass kg

funct = {@Cd3Deploy,@CdMockLow};

for j = 1:numel(funct)
    
clear h v t F T Y
    
[T,Y]= ode45(@(t,y) atmosphere(funct{j},m(j),h0(j),t,y),[t0,tf],yi);

i = 1;
t(i) = T(i);
h(i) = h0(j) - Y(i,1);
v(i) = Y(i,2);
for i = 2:numel(T)
    if h0(j) - Y(i-1,1) >= he
       t(i) = T(i);
       h(i) = h0(j) - Y(i,1);
       v(i) = Y(i,2);
    end
end

figure(1)
plot(t,h)
hold on

figure(2)
plot(t,v)
hold on

figure(3)
plot(h,v)
hold on

F = m(j)*diff(v)./diff(t);

figure(4)
plot(t,[0 F])
hold on

end

funcStr = strings;
for k = 1:numel(funct)
   funcStr(k,:) = func2str(funct{k}); 
end

figure(1)
plot(t,ones(size(t))*he) %,t,h0(j) - 4.9*(t.^2))
xlabel("Time (s)")
ylabel("Height (m)")
ylim([0 max(h0)])
legend([funcStr;"Ground";"No drag"])

figure(2)
xlabel("Time (s)")
ylabel("Velocity (m/s)")
legend(funcStr)

figure(3)
xlabel("Height (m)")
ylabel("Velocity (m/s)")
xlim([0 max(h0)])
legend(funcStr)

figure(4)
xlabel("Time (s)")
ylabel("Force (N)")
legend(funcStr)
