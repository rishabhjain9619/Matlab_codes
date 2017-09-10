clear all
close all
syms x
f(x)=input('enter the function whose roots you want to find out');
a=input('enter the initial guess');
b=input('enter the final guess');
g(x)=diff(f(x),x);
for i=1:100
    c=a;
    d=b;
    if f(a)*f(b)<0
        if (c-(f(c)/g(c))<b && c-(f(c)/g(c))>c)
            break;
        end
        
    end
end
fprintf('%d',c);