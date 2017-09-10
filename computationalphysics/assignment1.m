syms x;
f(x)=input('enter the value of the functions whose root you want to calculate');
a=input('enter the initial guess');
b=input('enter the final guess');
n=input('enter the number of desired iterations');
d=0;
if (f(a)*f(b)>0)
    e=(a+b)/2;
    g=(a+b)/2;
    for t=1:n
        if (f(a)*f(e)>0)&&(f(b)*f(g)>0)
            e=(a+e)/2;
            g=(b+g)/2;
        elseif (f(a)*f(e))<0
            b=e;
            break
        elseif f(g)*f(b)<0
            a=g;
            break
        elseif (f(a)*f(e)==0)||(f(b)*f(g)==0)
            fprintf('your final answer is x=%d or x=%d',e,g);
            return
        end
    end
end
if (f(a)*f(b)<0)
    for i=1:n
        c=(a+b)/2;
        if (f(a)*f(c))<0
            b=c;
        elseif f(b)*f(c)<0
            a=c;
        else
            fprintf('your answer is x=%d and f(x)=%d',c,double(f(c)));
            return
        end
    end
    fprintf('your final answer is x=%d and f(x)=%d',c,double(f(c)));
    return
end
fprintf('choose a better guess');     