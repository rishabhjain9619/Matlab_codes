close all
clear all
f=@(x)sqrt(1-x^2);
%n=input('enter the number of values');
area=0;
z=zeros(1,100);
k=1;
for n=10:10:1000
area=0;
h=1/n;
    for i=0:1/n:1
    area=area+h*f(i);
    end
    z(1,k)=abs(pi-area*4)/pi;
    k=k+1;
end
n=10:10:1000;
plot(n,z);
title('value of error with number of iterations');
%fprintf('the final value if %d\n',pie);
%e=((pi-pie)/pi)*100