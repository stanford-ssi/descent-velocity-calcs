function temp = tempViscTable(index)

tempTable = [-150, -100, -50:10:0, 5:5:50, 60:10:100, 120:20:200, 250:50:500, 600:100:1000, 1500, 2000];

temp = 273.15 + tempTable(index);

end