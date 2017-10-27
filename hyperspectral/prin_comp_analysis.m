clear all
close all
%a=imread('mine.jpg');
%a=double(a);
addpath('C:\Users\RISHABH JAIN\Downloads\study\anant\image processing\hyperspectral');
a=multibandread('new.bil',[2000,500,87],'uint16',0,'bil','ieee-be');
a=double(a);
[x_dim, y_dim, spec_dim]=size(a);
[mean_spec, covar, spec_matrix]=stat_rep(a);
%calculating eigen value and eigenvectors of the covariance matrix
%the eigenvalue here are in increasing order and eigenvectors are arranged
%correspondingly.magnitude of eigenvalue=variance
[eig_vec, diag_eigval]=eig(covar);
%normalizing all the eigenvectors
%{
%for normalizing the eig_vec that is already done in matlab
for k=1:spec_dim
    temp=eig_vec(:,k);
    eig_vec(:,k)=temp/norm(temp,2);
end
%}
%applying the principal component transformation that is equivalent to
%rotation
rot_spec_matrix=eig_vec'*spec_matrix;
%plotting the variance on a logarithmic scale with eigenvalues
temp=(diag(diag_eigval));
figure(1)
plot(log(temp))
xlabel('bands');
ylabel('variance')
%plotting the three leading eigenvectors
figure(2)
plot(eig_vec(:,spec_dim))
xlabel('bands');
ylabel('most variant eigenband')
figure(3)
plot(eig_vec(:,spec_dim-1))
xlabel('bands');
ylabel('second most variant eigenband')
figure(4)
plot(eig_vec(:,spec_dim-2))
xlabel('bands');
ylabel('third most variant eigenband');
figure(5)
temp=rot_spec_matrix(spec_dim,:);
temp2=zeros(x_dim,y_dim);
for k=1:y_dim-1
    for l=1:x_dim
        temp2(l,k)=temp((k-1)*x_dim+l);
    end
end
imshow(temp2,[])
title('the most variant band');