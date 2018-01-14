k=input('enter the value of k');
n=input('enter the value of n');
a=zeros(1,k+1);
a(1)=1;
for j=2:k+1
    a(j)=-1;
end
t=roots(a);
g=zeros(k,k);
for j=1:k
    for p=1:k
        g(j,p)=t(p)^(j);
    end
end
q=zeros(k,1);
q(1)=1;
for se=2:k
    q(se)=sum(q(:))+1;
end
f=inv(g)*q;
summ=0;
for l=1:k
    summ=summ+f(l)*(t(l))^n;
end
round(summ)