clear all
close all
f=@(x)sqrt(1-x^2);
%n=input('enter the number of values');
area=0;
t=zeros(1,100);
k=1;
for n=10:10:1000
area=0;
h=1/n;
    for i=0:1/n:1
    area=area+h*f(i);
    end
    area=area-(f(0)/2+f(1)/2)*h;
    t(1,k)=(pi-area*4)/pi;
    k=k+1;
end
n=10:10:1000;
plot(n,t);
title('value of error with number of iterations');
%fprintf('the final value if %d\n',pie);
%e=((pi-pie)/pi)*100