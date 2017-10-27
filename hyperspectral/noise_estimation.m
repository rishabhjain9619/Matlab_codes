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