f=@(x)cos(x)-x;
%initial guess
a=0;
%final guess
b=1;
c=(a+b)/2;
while(abs(f(c))>10^-8)
   c=(a+b)/2;
   if (f(a)*f(c))<0 
       b=c;
   elseif f(b)*f(c)<0
       a=c;
   else
       fprintf('your answer is x=%d and f(x)=%d\n',c,double(f(c)));
   end
end
fprintf('your final answer is x=%d and f(x)=%d\n',c,double(f(c)));
    