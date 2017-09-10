clear all
close all
f=@(x)sin(x);
%n=input('enter the number of values');
area=0;
a=input('enter the initial value');
b=input('enter the final value');
k=1;
n=100;
area=0;
h=(b-a)/n;
    for i=a:(b-a)/n:b
    area=area+h*f(i);
    end
area=area-(f(a)/2+f(b)/2)*h;
syms x
clear f
f(x)=input('enter the expression once again');
%diff of f
g(x)=diff(f,x);
%triple diff of f
l(x)=diff(f,x,x,x);
areaerror=2-area
area=area+h^2/12*(g(a)-g(b));
area=area-h^4/720*(l(a)-l(b));
area=double(area);
areaerror=2-area
%fprintf('the final value if %d\n',pie);
%e=the error in the final value is 1.644934336297865e-06