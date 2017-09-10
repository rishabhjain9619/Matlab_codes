m=input('enter the value of m');
k=input('enter the value of k');
t=zeros(k,k+1);
area=0;
f=@(x)1/(1+x^2);
for c=m:m+k
n=2^c;
a=0;
b=2;
area=0;
h=2/n;
for i=a:h:b
    area=area+h*f(i);
end
area=area-(f(a)/2+f(b)/2)*h;
t(1,(c-m+1))=area;
end
for l=2:k
    for j=l:k+1
        t(l,j)=(4^(l-1)*t(l-1,j)-t(l-1,j-1))/(4^(l-1)-1);
    end
end
%this will be the error term
atan(2)-t(k,k+1)

