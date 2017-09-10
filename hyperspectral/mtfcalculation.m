a=imread(input('enter the image'));
a=rgb2gray(a);
[b c]=size(a);
q=zeros(c,1);
for i=1:380
%plot(a(:,i))
t=(a(:,i));
d=[1;-1];
lsf=imfilter(t,d,'circular');
%figure(2)
%plot(lsf)
%figure(3)
u=fft(lsf);
u=abs(u);
q(i)=max(u(:));z
end
plot(q)