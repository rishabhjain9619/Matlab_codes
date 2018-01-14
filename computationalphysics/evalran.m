clear all
close all
x_coord=0;
l=100;
arr=zeros(100,1);
dis=zeros(100,1);
z=1;  
o=zeros(11,1);
%for p random walkers 
%arr is mean square distance
for a=1:0.2:3
    n=10000;
    p=1000;  
for t=1:p
    r=rand(1,n);
for k=1:n
     if(r(1,k)<0.5&&r(1,k)>=0)
          x_coord=x_coord+a;
     else 
          x_coord=x_coord-a;
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
k=k';
arr=arr./p;
temp2=polyfit(k*100,arr,1);
o(z)=temp2(1);
z=z+1;
end
temp3=1:0.2:3;
plot(temp3,o)