%fixed iteration method
syms x;
f(x)=input('enter the value of the functions whose root you want to calculate');
a=input('enter the guess');
%n=input('enter the number of desired iterations');
n=10;
g(x)=x+f(x);
tol=10^-10;
for i=1:n
    t=(g(a));
    t=double(t)
    if(abs(f(t))<tol)
        fprintf('what the hell %d',i);
        break;
    end
    a=t;
end
fprintf('the final value of the root is %d and the value of the function if %d',a,double(f(t)));