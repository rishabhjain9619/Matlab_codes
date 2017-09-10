clear all
close all
f=@(x)cos(pi*x^2/2);
g=@(x)sin(pi*x^2/2);
o=1;
q=input('enter the step size for different integrals');
a=input('enter the initial value');
b=input('enter the final value');
r=((b-a)/q)+1;
r=round(r);
final=zeros(r,1);
area1=0;
area2=0;
for z=a:q:b;
k=0;
area1=functionsimpson(a,z);
area2=functionsimpson2(a,z);
%consider inot to be 1
final(o,1)=1/2*((area1+0.5)^2+(area2+0.5)^2);
o=o+1;

end
t=a:q:b;
plot(t,final)