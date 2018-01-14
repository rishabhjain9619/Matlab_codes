clear all
close all
t=zeros(1,180);
l=1;
for k=1:0.05:10;
    i=k/10;
    t(l)=functionsimpson(i);
    l=l+1;
end
j=1:181;
plot(j,t)
hold on
a=1:162;
q=t(1:162);
p=polyfit(a,q,5);
%g=@(x)p(4)+p(3)*x+p(2)*x^2+p(1)*x^3;
%r=zeros(181,1);
%for k=1:181
 %   r(k)=g(k);
%end
u=polyval(p,j);
plot(u)