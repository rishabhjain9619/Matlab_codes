clear all
close all
addpath('C:\Users\RISHABH JAIN\Downloads\study\anant\image processing\hyperspectral');
a=multibandread('new.bil',[2000,500,87],'uint16',0,'bil','ieee-be');
%finding distance between points in spectral region
[point1]=input('enter the co-ordinates of the first point,i,e x and y');
[point2]=input('enter the co-ordinates of the second point,i.e x and y');
spec1=a(point1(1),point1(2),:);
spec2=a(point2(1),point2(2),:);
spec1=spec1(1,:);
spec2=spec2(1,:);
%calculating the distance between two points
spec3=spec2-spec1;
distance=norm(spec3,2);
%calculating the angle between two points
theta=acos(spec1*spec2'/sqrt((spec1*spec1')*(spec2*spec2')));