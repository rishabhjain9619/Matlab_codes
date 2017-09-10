a=imread(input('enter the image'));
a=rgb2gray(a);
[b c]=size(a);
q=zeros(b,1);
for i=1:c
    k=sum(a(i,:));
    figure(i);
    k=k/380;
    q(i)=k;
end
plot(q)