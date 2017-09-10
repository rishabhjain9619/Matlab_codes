clear all
close all
f=@(x)cos(pi*x^2/2);
g=@(x)sin(pi*x^2/2);
final=zeros(49,1);
o=1;
q=input('enter the step size for different integrals');
for b=0.2:q:5;
k=0;
a=0.2;
%the value of n should be even for the logic to properly incorporate the
n=1000;
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
area1=area-h/3*f(a)-h/3*f(b);
k=0;
area=0;
for i=a:h:b
        if (mod(k,2)==0)
            area=area+2*(h/3)*g(i);
            k=k+1;
        elseif (mod(k,2)==1)
            area=area+4*(h/3)*g(i);
            k=k+1;
        end
   end
area2=area-h/3*g(a)-h/3*g(b);
%consider inot to be 1
final(o,1)=1/2*((area1+0.5)^2+(area2+0.5^2));
area=0;
o=o+1;
area1=0;
area2=0;
end
t=0.2:q:b;
plot(t,final)