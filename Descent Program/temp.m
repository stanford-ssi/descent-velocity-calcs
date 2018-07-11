function temperature = temp(h)
%Approximate temp using model

if h < 11000
    temperature = -.0065*h + 288;
elseif h < 20100
    temperature = 216.5;
elseif h < 32200
    temperature = (228.5-216.5)*(h-20100)/(12100) + 216.5;   
elseif h < 47300
    temperature = (270.5-228.5)*(h-32200)/(47300-32200) + 228.5;
elseif h < 52400
    temperature = 270.5;
elseif h < 61600
    temperature = (252.5-270.5)*(h-52400)/(61600-52400) + 270.5;
elseif h < 80000
    temperature = (180.5-252.5)*(h-61600)/(80000-61600) + 252.5;
elseif h < 90000
    temperature = 180.5;
else
    temperature = (202-180.5)*(h-90000)/(10000) + 180.5;
end

end

