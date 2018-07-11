function p = pressure(h)
%Approximate pressure from altitude/pressure table

A = 0;
i = 0;
if h < 0 || h > 500000
    h = 0;
end
while h >= A
  i = i + 1;
  A = alt(i); 
end

p = 1000*((pres(i) - pres(i - 1))*(h-alt(i-1))/(alt(i) - alt(i - 1)) + pres(i - 1));

end

