clear all
close all
addpath('C:\Users\RISHABH JAIN\Downloads\study\anant\image processing\hyperspectral');
a=multibandread('new.bil',[500,2000,87],'uint16',0,'bil','ieee-be');
a=uint16(a); 
for i=1:87
    figure(i)
    t=1;
    for j=1:4
        c=zeros(500,500);
        c=uint16(c);
        c=a(:,t:t+499,i);
        pause(.5)
        t=t+500;
        subplot(2,2,j)
        imshow(c);
    end
end