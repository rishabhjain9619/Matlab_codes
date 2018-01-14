function [area]=calculatearea(m,k)
area=0;
%m=input('enter the value of m'); this is the number of divisions in log2
%k=input('enter the value of k'); this is the order of correction
area=recursiveromberg(m+k,k);
function [area]=rombergrule(m)
f=@(x)1/(1+x^2);
n=2^m;
a=0;
b=2;
area=0;
h=2/n;
for i=a:h:b
    area=area+h*f(i);
end
area=area-(f(a)/2+f(b)/2)*h;
end
% initially , y is m+k
function [area]=recursiveromberg(y,k)
if(k==0)
    area=rombergrule(y);
    return
else
    area=(4^k*recursiveromberg(y,k-1)-recursiveromberg(y-1,k-1))/(4^k-1);
    return
end
end
%this will be the error term
atan(2)-area
end
