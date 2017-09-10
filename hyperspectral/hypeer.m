clear all
close all
addpath('C:\Users\RISHABH JAIN\Downloads\study\anant\image processing\hyperspectral');
a=multibandread('new.bil',[2000,500,87],'uint16',0,'bil','ieee-be');
a=uint16(a); 
for i=1:87
    figure(i)
    a(:,:,i)=imrotate(a(:,:,i),180);
    imshow(a(:,:,i));
    pause(.5)
end