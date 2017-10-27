clear all
close all
%calculating the three endmembers with two pca bands. Can generalize to n
%dimension by drawing lines in n dimension
%first applying the affine tranformation to obtain the most variant bands
affine_trans;
band1=whitening_mat(spec_dim,:);
band2=whitening_mat(spec_dim-1,:);
%creating an array to keep count
count=zeros(1,x_dim*y_dim);
for iter=1:1000
    %generating coefficients of x and y for random lines
    coeff = -1+2*rand(1,2);
    x_coeff=coeff(1);
    y_coeff=coeff(2);
    x_proj=zeros(1,x_dim*y_dim);
    %step for reducing computation
    dis=x_coeff^2+y_coeff^2;
    for iter2=1:x_dim*y_dim
        x_proj(iter2)=(y_coeff*(y_coeff*band1(iter2)-x_coeff*band2(iter2)))/dis;
    end
    [max_value,ind]=max(x_proj);
    count(ind)=count(ind)+1;
    [min_value,ind]=min(x_proj);
    count(ind)=count(ind)+1;
end
%extracting the endmembers from the count
[end_mem,index]=max(count);
arr1=band1(index);
arr2=band2(index);
index_arr=index;
for endmem=1:8
    count(index)=0;
    [end_mem,index]=max(count);
    arr1=[arr1,band1(index)];
    arr2=[arr2,band2(index)];
    index_arr=[index_arr, index];
end
comb1=combnk(arr1,3);
comb2=combnk(arr2,3);
combindex_arr=combnk(index_arr,3);
siz=size(comb1);
%choosing the best endmembers
impo=0;
max_determ=0;
for dete=1:siz(1)
    matr=[1, comb1(dete,1), comb2(dete,1); 1,comb1(dete,2),comb2(dete,2);1,comb1(dete,3),comb2(dete,3)];
    determ=det(matr);
    if(abs(determ)>max_determ)
        max_determ=determ;
        impo=dete;
    end
end
arr1=comb1(impo,:);
arr2=comb2(impo,:);
index_arr=combindex_arr(impo,:);
arr1=horzcat(arr1,arr1(1));
arr2=horzcat(arr2,arr2(1));
plot(band1,band2);
hold on
plot(arr1,arr2)
clearvars -except whitening_mat index_arr a spec_matrix spec_dim x_dim y_dim