%clear all
close all
f=@(x)log(sinh(cos((tan(x)))));
%n=input('enter the number of values');
a=input('enter the initial value');
b=input('enter the final value');
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
    area
    k=k+1;
%end
%n=10:10:1000;
%plot(n,t);
%title('value of error with number of iterations');
%fprintf('the final value if %d\n',pie);
%error for 1000 terms is -1.081357225984903e-12