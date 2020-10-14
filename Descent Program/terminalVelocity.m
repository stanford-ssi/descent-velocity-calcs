
clear
close all

t0 = 0;
tf = 2000;
vi = 0;
yi = [0,vi,0,vi,0];
h0 = 30000;        %Apogee height m
he = 4600/3.2808;   %Spaceport elevation converted to meters
m = 10;             %Rocket mass kg

funct = {@CdZeroG,@CdShield};

for j = 1:numel(funct)
[T,Y]= ode45(@(t,y) atmosphere(funct{j},m,h0,t,y),[t0,tf],yi);

i = 1;
t(i) = T(i);
h(i) = h0 - Y(i,1);
v(i) = Y(i,2);
vd(i) = Y(i,5);
for i = 2:numel(T)
    if h0 - Y(i-1,1) >= he
       t(i) = T(i);
       h(i) = h0 - Y(i,1);
       v(i) = Y(i,2);
       vd(i) = Y(i,5);
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

h_diff = Y(:,3) - Y(:,1);

figure(5)
plot(T(:,1),h_diff)

ad = diff(vd)./diff(t);

G = 6.67*10^-11;
M = 5.9723*10^24;
re = 6371000;
g = G*M/((re)^2);

figure(6)
plot(t,[0 ad/g])

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

figure(5)
xlabel("Time (s)")
ylabel("Height Difference (m)")
ylim([0 6])
legend(funcStr)

figure(6)
xlabel("Time (s)")
ylabel("gs of force")
legend(funcStr)