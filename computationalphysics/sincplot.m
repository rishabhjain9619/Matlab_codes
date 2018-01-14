clear all
close all
u=-5:0.01:5;
for a=0.1:0.3:5
    y=2*a*sinc(2*pi*u*a);
    y=y.*y;
    plot(u,y)
    pause(1)
end