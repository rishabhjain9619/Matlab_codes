addpath('C:\Users\RISHABH JAIN\Downloads\study\anant\image processing\hyperspectral');
a=multibandread('new.bil',[2000,500,87],'uint16',0,'bil','ieee-be');
a=a(1:1300,:,:);
%chossing three random points for the classes, has to be done manually
spec1=a(835,44,:);
spec2=a(155,442,:);
spec3=a(1257,104,:);
spec4=a(110,80,:);
[x_dim, y_dim, spec_dim]=size(a);
%the spectral dimension will be based on the number of classes you have
%chosen
classified_image=zeros(x_dim,y_dim,3);
classified_image=uint8(classified_image);
%finally assigning the classes
for var1=1:x_dim
    for var2=1:y_dim
        randmat=[abs(sumsqr(a(var1,var2,:)-spec1)),abs(sumsqr(a(var1,var2,:)-spec2)),abs(sumsqr(a(var1,var2,:)-spec3)),abs(sumsqr(a(var1,var2,:)-spec4))];
        [min_val,min_ind]=min(randmat);
        if(min_ind==4)
            classified_image(var1,var2,1)=255;
            classified_image(var1,var2,2)=255;
            continue
        end
        classified_image(var1,var2,min_ind)=255;
    end
end
imshow(classified_image)