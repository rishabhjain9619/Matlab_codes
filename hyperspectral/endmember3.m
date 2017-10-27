clear all
close all
%calculating the three endmembers with two pca bands. Can generalize to n
%dimension by drawing lines in n dimension
%first applying the affine tranformation to obtain the most variant bands
affine_trans;
band1=whitening_mat(spec_dim,:);
band2=whitening_mat(spec_dim-1,:);
band3=whitening_mat(spec_dim-2,:);
%creating an array to keep count
count=zeros(1,x_dim*y_dim);
for iter=1:1000
    %generating direction ratios x and y and z for random lines
    coeff = -1+2*rand(1,3);
    x_coeff=coeff(1);
    y_coeff=coeff(2);
    z_coeff=coeff(3);
    x_proj=zeros(1,x_dim*y_dim);
    %step for reducing computation
    dis=x_coeff^2+y_coeff^2+z_coeff^2;
    for iter2=1:x_dim*y_dim
        x_proj(iter2)=(x_coeff*(x_coeff*band1(iter2)+y_coeff*band2(iter2)+z_coeff*band3(iter2)))/dis;
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
arr3=band3(index);
index_arr=index;
for endmem=1:8
    count(index)=0;
    [end_mem,index]=max(count);
    arr1=[arr1,band1(index)];
    arr2=[arr2,band2(index)];
    arr3=[arr3,band3(index)];
    index_arr=[index_arr, index];
end
comb1=combnk(arr1,4);
comb2=combnk(arr2,4);
comb3=combnk(arr3,4);
combindex_arr=combnk(index_arr,4);
siz=size(comb1);
%choosing the best endmembers
impo=0;
max_determ=0;
for dete=1:siz(1)
    matr=[1,comb1(dete,1),comb2(dete,1),comb3(dete,1); 1,comb1(dete,2),comb2(dete,2),comb3(dete,2);1,comb1(dete,3),comb2(dete,3),comb3(dete,3);1,comb1(dete,4),comb2(dete,4),comb3(dete,4)];
    determ=det(matr);
    if(abs(determ)>max_determ)
        max_determ=determ;
        impo=dete;
    end
end
arr1=comb1(impo,:);
arr2=comb2(impo,:);
arr3=comb3(impo,:);
index_arr=combindex_arr(impo,:);
plot3(band1,band2,band3);
hold on
plot3(arr1,arr2,arr3)
clearvars -except whitening_mat index_arr a x_dim y_dim spec_dim spec_matrix