function [mean_spec,covar, spec_matrix]=stat_rep(a)
%normal distribution assumption
%clear all
%close all
%addpath('C:\Users\RISHABH JAIN\Downloads\study\anant\image processing\hyperspectral');
%a=multibandread('new.bil',[2000,500,87],'uint16',0,'bil','ieee-be');
%creating other matrix that will have dimension (2000*500)*87
temp=zeros(87,1);
[x_dim, y_dim, spec_dim]=size(a);
spec_matrix=zeros(spec_dim,1);
for l=1:y_dim
    temp=squeeze(a(:,l,:));
    temp=temp';
    spec_matrix=horzcat(spec_matrix,temp);
end
[dim1, dim2]=size(spec_matrix);
spec_matrix=spec_matrix(:,2:dim2);
mean_spec=mean(spec_matrix');
%converting the dimension of mean_spec to spec_dim*1(87*1) from 1*spec_dim
mean_spec=mean_spec';
%calculating the covariance matrix
covar=(1/dim2*(spec_matrix*spec_matrix'))-(mean_spec)*(mean_spec');
%calculating the sample corelation matrix
samp_coreal=covar+(mean_spec*mean_spec');
%unbiasing the covar matrix
covar=dim2/(dim2-1)*covar;
end