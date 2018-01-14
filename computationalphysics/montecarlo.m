%create random number and calculate average and then just multiply by the
%total size
clear all
close all
a=input('enter the initial value');
b=input('enter the final value');
area=zeros(1,20);
for m=1:20
n=2^m;
r = a + (b-a).*rand(1,n);
c=sin(r)./(sqrt(4-r.^2));
aver=sum(c(:))/n;
area(m)=aver*(b-a);
m
end
m=1:20;
plot(m,area)