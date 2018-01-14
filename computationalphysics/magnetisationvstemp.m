a=0.1;
b=2;
n=500;
arr=zeros(size(1:1.3:3.9));
l=1;
for temper=1:0.1:3.9
    f=@(x)tanh(4*x/temper)-x;
    a=0.1;
    b=2;
for i=1:n
        c=(a+b)/2;
        if (f(a)*f(c))<0
            b=c;
        elseif f(b)*f(c)<0
            a=c;
        end
end
arr(l)=c;
l=l+1;
end
p=1:0.1:3.9;
plot(p,arr);