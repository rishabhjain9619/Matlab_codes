function [ener,mag]=isingenergy(arr,temp)
ener=0;
mag=0;
y=arr(:,1);
arr=[arr,y];
y=arr(:,21);
arr=[y,arr];
y=arr(20,:);
arr=[y;arr];
y=arr(2,:);
arr=[arr;y];
for i=2:21
    for j=2:21
       t=-1*(arr(i,j)*(arr(i-1,j)+arr(i+1,j)+arr(i,j+1)+arr(i,j-1)));
       mag=mag+arr(i,j);
       ener=ener+t;
    end
end
ener=ener/2;
mag=mag/400;
