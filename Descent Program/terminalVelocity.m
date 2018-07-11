
clear all
close all

t0 = 0;
tf = 2000;
vi = 0;
yi = [0,vi];
h0 = 100000;        %Apogee height m
he = 4600/3.2808;   %Spaceport elevation converted to meters
m = 20;             %Rocket mass kg

[T,Y]= ode45(@(t,y) atmosphere(m,h0,t,y),[t0,tf],yi);

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
plot(t,h,t,ones(size(t))*he)
xlabel("Time (s)")
ylabel("Height (m)")
ylim([0 h0])

figure(2)
plot(t,v)
xlabel("Time (s)")
ylabel("Velocity (m/s)")

figure(3)
plot(h,v)
xlabel("Height (m)")
ylabel("Velocity (m/s)")
xlim([0 h0])
