clear all
close all
i=1:10;
x=zeros(100,1);
y=zeros(100,1);
for j=1:100
    [x(j),y(j)]=new3(rand(j,j));
end
j=1:100;
plot(j,x,j,y);