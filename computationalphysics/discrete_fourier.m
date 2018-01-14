clear all
close all
fourier=zeros(1024,1);
funct=zeros(1024,1);
for k=231:281
    funct(k)=1;
end
for k=743:793
    funct(k)=1;
end
for u=0:1023
    sum=0;
    for k=1:1024
        sum=sum+(funct(k)*((-1)^k)*exp((-1i*2*pi*u*k)/1024));
    end
    fourier(u+1)=sum/1024;
end
%fourier=abs(fourier);
k=1:1024;
k=k-512;
hold on;
plot(k,abs(fourier))
plot(k,fftshift(abs(fft(funct))),'r-');