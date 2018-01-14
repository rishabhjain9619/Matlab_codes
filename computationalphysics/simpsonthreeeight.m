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
%the value of n should be divisible by 3 for the logic to properly incorporate the
%last term
n=99;
area=0;
h=(b-a)/n;
    for i=a:h:b
        if (mod(k,3)==0)
            area=area+6*(h/8)*f(i);
            k=k+1;
        elseif (mod(k,3)==1)
            area=area+9*(h/8)*f(i);
            k=k+1;
        elseif (mod(k,3)==2)
            area=area+9*(h/8)*f(i);
            k=k+1;
        end
    end
    area=area-3*h/8*f(a)-3*h/8*f(b);
    area
    k=k+1;
%end
%n=10:10:1000;
%plot(n,t);
%title('value of error with number of iterations');
%fprintf('the final value if %d\n',pie);
%error for 1000 terms is -1.081357225984903e-12