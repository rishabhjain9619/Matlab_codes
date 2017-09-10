function [area]=functionsimpson(a,b)
f=@(x)sin(pi*x^2/2);
area=0;
k=0;
n=10000;
area=0;
h=(b-a)/n;
    for i=a:h:b
        if (mod(k,4)==0)
            area=area+28*(h/45)*f(i);
            k=k+1;
        elseif (mod(k,4)==1)
            area=area+64*(h/45)*f(i);
            k=k+1;
        elseif (mod(k,4)==2)
            area=area+24*(h/45)*f(i);
            k=k+1;
        elseif (mod(k,4)==3)
            area=area+64*(h/45)*f(i);
            k=k+1;
        end
    end
    area=area-14*h/45*f(a)-14*h/45*f(b);
    k=k+1;
end