clear all
close all
x_coord=0;
l=100;
arr=zeros(100,1);
dis=zeros(100,1);
n=10000;
p=1000;
%for p random walkers 
%arr is mean square distance
for t=1:p
    r=rand(1,n);
for k=1:n
     if(r(1,k)<0.5&&r(1,k)>=0)
          x_coord=x_coord+1;
     else 
          x_coord=x_coord-1;
     end
     if(l==k) 
       dis(l/100)=(x_coord^2);
       l=l+100;
     end
end
    x_coord=0;
    l=100;
    arr=arr+dis;
end
k=1:100;
arr=arr./p;
plot(k*100,arr);
