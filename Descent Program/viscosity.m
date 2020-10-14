function viscosity = viscosity(T)

A = 0;
i = 0;
if T < 123.15 || T > 2273.15
    T = 123.15;
end
while T >= A
  i = i + 1;
  A = tempViscTable(i); 
end

viscosity(1) = (dViscTable(i) - dViscTable(i - 1))*(T-tempViscTable(i-1))/(tempViscTable(i) - tempViscTable(i - 1)) + dViscTable(i - 1);

viscosity(2) = (kViscTable(i) - kViscTable(i - 1))*(T-tempViscTable(i-1))/(tempViscTable(i) - tempViscTable(i - 1)) + kViscTable(i - 1);

end