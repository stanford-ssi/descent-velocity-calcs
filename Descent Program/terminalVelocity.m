
clear all
close all

t0 = 0;
tf = 10000;
vi = 0;
vNS = 0;
vEW = 90;
yi = [0,vi,0,vNS,0,vEW,0,vNS,0,vEW,0,vNS,0,vEW,0,vNS,0,vEW];
h0 = [100000]; %,100000];%,5500/3.2808,33000/3.2808,7600/3.2808,100000,100000];        %Apogee height m
he = 4600/3.2808;   %Spaceport elevation converted to meters
m = [15]; %,15];%,.5,20,3,15,15];            %Rocket mass kg

funct = {@Cd2Deploy}; %,@CdApogeeDeploy};%,@CdStreamer,@CdIREC,@CdMockLow,@CdRocket,@Cd2DeployRing};

for j = 1:numel(funct)
    
    clear h v t F T Y x y
    
    [T,Y]= ode45(@(t,y) atmosphere(funct{j},m(j),h0(j),t,y),[t0,tf],yi);

    i = 1;
    t(i) = T(i);
    h(i) = h0(j) - Y(i,1);
    v(i) = Y(i,2);
    x(i) = Y(i,3);
    y(i) = Y(i,5);
    for i = 2:numel(T)
        if h0(j) - Y(i-1,1) >= he
           t(i) = T(i);
           h(i) = h0(j) - Y(i,1);
           v(i) = Y(i,2);
           x(i) = Y(i,3);
           y(i) = Y(i,5);
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

    q = 3;
    while q < numel(Y(1,:))
        x = Y(1:numel(h),q);
        q = q + 2;
        y = Y(1:numel(h),q);
        q = q + 2;
        figure(5)
        plot3(x,y,h)
        hold on
        figure(6)
        plot(y,x)
        hold on
    end

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

figure(5)
xlabel("NS drift (m)")
ylabel("E drift (m)")
zlabel("Height (m)")
grid on
legend(funcStr.' + [" Ave";" 1 std";" 2 std";" Max"])

figure(6)
xlabel("E drift (m)")
ylabel("NS drift (m)")
grid on
legend(funcStr.' + [" Ave";" 1 std";" 2 std";" Max"])
