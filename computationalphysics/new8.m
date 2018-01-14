syms x;
f(x)=input('enter the function whose root you want to calculate');
tol=10^-10;
a=input('enter the initial guess');
t=a;
g(x)=diff(f(x),x);
h(x)=diff(f(x),x,x);
for i=1:100
    a
    t
    t=a*h(a)-g(a)-sqrt(g(a)^2+a^2*(h(a)^2)-2*a*g(a)*(h(a))-2*f(a)+2*a*g(a)-a^2*h(a));
    t=double(t);
    if (abs(t-a)/a)<tol
        break;
    end
    t=double(t);
    a=t;
end
fprintf('the answer is %d and the value is %d',a,double(f(a)));