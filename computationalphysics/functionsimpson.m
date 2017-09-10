function [area]=functionsimpson(a,b)
%clear all
close all
f=@(x)cos(pi*x^2/2);
%n=input('enter the number of values');
area=0;
%t=zeros(1,100);
k=0;
%for n=10:10:1000
%the value of n should be divisible by 4 for the logic to properly incorporate the
%last term
n=10000;
area=0;
h=(b-a)/n;
    for i=a:h:b
        if (mod(k,4)==0)
            area=area+28*(h/45)*f(i);
            k=k+1;
        elseif (mod(k,4)==1)
            area=area+64*(h/45)*f(i);
            k=k+1;
        elseif (mod(k,4)==2)
            area=area+24*(h/45)*f(i);
            k=k+1;
        elseif (mod(k,4)==3)
            area=area+64*(h/45)*f(i);
            k=k+1;
        end
    end
    area=area-14*h/45*f(a)-14*h/45*f(b);
    k=k+1;
end