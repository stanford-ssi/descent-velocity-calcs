
clear all
close all

t0 = 0;
tf = 2000;
vi = 0;
yi = [0,vi];
h0 = 100000;        %Apogee height m
he = 4600/3.2808;   %Spaceport elevation converted to meters
m = 20;             %Rocket mass kg

funct = {@CdRocket,@Cd3Deploy,@CdIREC};

for j = 1:numel(funct)
[T,Y]= ode45(@(t,y) atmosphere(funct{j},m,h0,t,y),[t0,tf],yi);

i = 1;
t(i) = T(i);
h(i) = h0 - Y(i,1);
v(i) = Y(i,2);
for i = 2:numel(T)
    if h0 - Y(i-1,1) >= he
       t(i) = T(i);
       h(i) = h0 - Y(i,1);
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

F = m*diff(v)./diff(t);

figure(4)
plot(t,[0 F])
hold on
end

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
ylabel("Velocity (m/s)")
legend(funcStr)

figure(3)
xlabel("Height (m)")
ylabel("Velocity (m/s)")
xlim([0 h0])
legend(funcStr)

figure(4)
xlabel("Time (s)")
ylabel("Force (N)")
legend(funcStr)
