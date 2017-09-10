clear all
close all
f=@(x)x^3-5*x^2+6*x+8;
a=input('enter the initial value');
b=input('enter the final value');
area=0;
k=0;
%the value of n should be even for the logic to properly incorporate the
n=100;
area=0;
h=(b-a)/n;
    for i=a:h:b
        if (mod(k,2)==0)
            area=area+2*(h/3)*f(i);
            k=k+1;
        elseif (mod(k,2)==1)
            area=area+4*(h/3)*f(i);
            k=k+1;
        end
   end
area=area-h/3*f(a)-h/3*f(b);
area