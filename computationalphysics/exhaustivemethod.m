clear all
close all
syms x
f(x)=input('enter the function whose roots you want to find out');
a=input('enter the initial guess');
g(x)=diff(f(x),x);
b=input('enter the number of roots you want to find');;
c=zeros(b,1);
e=zeros(b,1);
k=1;
tol=10^-10;
while 1
    d=a+0.013;
    if f(a)*f(d)<=0
        fprintf('value of a is %d and value of d is %d\n',a,d);
        c(k)=d;
        k=k+1;
        if k==b+1
            break
        end
    end
    a=d;
end
for i=1:b
    a=c(i);
    for j=1:1000
        t=a-(f(a)/g(a));
            if (abs(t-a)/a)<tol
                break;
            end
    t=double(t);
    a=t;
    end
    fprintf('enter the value of your %d root is %d\n',i,a);
end

