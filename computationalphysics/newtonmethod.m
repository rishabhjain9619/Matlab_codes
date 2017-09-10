syms x;
f(x)=input('enter the function whose root you want to calculate');
tol=10^-10;
a=input('enter the initial guess');
t=a;
g(x)=diff(f(x),x);
for i=1:100
    t=a-(f(a)/g(a));
    if (abs(t-a)/a)<tol
        break;
    end
    t=double(t);
    a=t;
end
fprintf('the answer is %d and the value is %d',a,double(f(a)));