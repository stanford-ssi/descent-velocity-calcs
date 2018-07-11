function density = rho(h)

A = 0;
i = 0;
if h < 0 || h > 150000
    h = 0;
end
while h >= A
  i = i + 1;
  A = altDensTable(i); 
end

density = (rhoTable(i) - rhoTable(i - 1))*(h-altDensTable(i-1))/(altDensTable(i) - altDensTable(i - 1)) + rhoTable(i - 1);

end