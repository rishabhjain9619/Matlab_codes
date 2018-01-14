dim=20;
arr=zeros(dim,dim);
r=rand(dim,dim);
mag_arr=zeros(13,1);
magsq_arr=zeros(13,1);
susc_arr=zeros(13,1);
l=1;
ab=1;
cd=1;
for temp=0.5:0.2:3
    for iter=1:10
        for i=1:dim
            for j=1:dim
                if(r(i,j)<0.5)
                    arr(i,j)=-1;
                else
                    arr(i,j)=1;
                end
            end
        end
        for n=1:10000
            [ener1,mag1]=isingenergy(arr);
            t=rand(2,1);
            arr2=arr;
            a=floor(t(1)*dim);
            b=floor(t(2)*dim);
            if(a==0)
                a=1;
            end
            if(b==0)
                b=1;
            end
            arr2(a,b)=arr2(a,b)*(-1);
            [ener2,mag2]=isingenergy(arr2);
            q=rand(1);
            if (ener2<ener1)
                arr=arr2;
            elseif (q<exp(-(ener2-ener1)/temp))
                arr=arr2;
            end
            imshow(arr)
        end
        mag_arr(l)=mag_arr(1)+abs(mag2);
        magsq_arr(l)=magsq_arr(l)+mag2^2;
        pause(1)
    end
    mag_arr(l)=mag_arr(l)/iter;
    magsq_arr(l)=magsq_arr(l)/iter;
    susc_arr(l)=(magsq_arr(l)-(mag_arr(l)*mag_arr(l)))/temp;
    l=l+1
end
temp2=0.5:0.2:3;
plot(temp2,mag_arr);
xlabel('temp');
ylabel('average mag');
figure(2)
plot(temp2,susc_arr);
xlabel('temp');
ylabel('susceptibility avg');