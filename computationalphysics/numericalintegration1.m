clear all
close all
syms x
f(x)=input('enter the function you want to integrate');
h=input('enter the step size');
a=input('enter the inital value');
b=input('enter the final value');
area=0;
for i=a:h:b
    t=f(i);
    area=area+h*double(t);
end
fprintf('the final value if %d',area);
e=(2-area)/2*100