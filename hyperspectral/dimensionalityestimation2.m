%after applying noise-parameters and pca analysis
%not of much use according to me
clear all
close all
addpath('C:\Users\RISHABH JAIN\Downloads\study\anant\image processing\hyperspectral');
a=multibandread('new.bil',[2000,500,87],'uint16',0,'bil','ieee-be');
[x_dim, y_dim, spec_dim]=size(a);
[mean_spec, covar, spec_matrix]=stat_rep(a);
%converting each column as one band of N*1 and will remove one band to
%calculate parameters according to the book
spec_matrix_trans=spec_matrix';
%Calculating the regression coefficients pertaining to each band
reg_coeff=zeros(spec_dim-1,spec_dim);
noise_spec_matrix=zeros(x_dim*y_dim,spec_dim);
for k=1:spec_dim
    temp=horzcat(spec_matrix_trans(:,1:k-1),spec_matrix_trans(:,k+1:spec_dim));
    reg_coeff(:,k)=(inv(temp'*temp))*(temp')*(spec_matrix_trans(:,k));
    noise_spec_matrix(:,k)=spec_matrix_trans(:,k)-(temp*reg_coeff(:,k));
    k
end
%converting noise_spec_matrix to k*N before finding out other things
%because the previous function was written for it
[noise_mean_spec,noise_covar,noise_samp_coreal]=noise_parameters(noise_spec_matrix');


[dim1, dim2]=size(spec_matrix);
mean_spec=mean(spec_matrix');
mean_spec=mean_spec';
covar=(1/dim2*(spec_matrix*spec_matrix'))-(mean_spec)*(mean_spec');
samp_coreal=covar+(mean_spec*mean_spec');
[eig_vec, diag_eigval]=eig(covar);


arr=zeros(spec_dim,1);
eig_vec=fliplr(eig_vec);
samp_coreal=fliplr(samp_coreal);
noise_samp_coreal=fliplr(noise_samp_coreal);
for g=1:spec_dim
    temp1=eig_vec(:,1:g);
    proj_sig=temp1*temp1';
    proj_noise=eye(spec_dim)-(temp1*temp1');
    arr(g)=trace(proj_noise*samp_coreal)+2*trace(proj_sig*noise_samp_coreal);
end
%dimen is the final value
%this min gives you the global minima, it is better and more practical to
%take the local first minima
[value dimen]=min(arr);