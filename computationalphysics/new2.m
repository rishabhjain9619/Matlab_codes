a=input('enter the starting value');
r=input('the common ratio between terms');
n=input('enter the number of terms');
y=zeros(n,1);
t=0;
for k=1:n
    t=t+a*(r^(k-1));
    y(k)=t;
end
fprintf('the answer is %d',t);
z=1:n;
plot(z,y,'-o');