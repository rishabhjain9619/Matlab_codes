clear all
close all
%a=imread('mine.jpg');
%a=double(a);
addpath('C:\Users\RISHABH JAIN\Downloads\study\anant\image processing\hyperspectral');
a=multibandread('new.bil',[2000,500,87],'uint16',0,'bil','ieee-be');
a=a(1:1300,:,:);
[x_dim, y_dim, spec_dim]=size(a);
[mean_spec, covar, spec_matrix]=stat_rep(a);
[eig_vec, diag_eigval]=eig(covar);
%applying the affine transformation
unit_mat=ones(1,(x_dim*y_dim));
%centering and demeaning
affin_mat=(eig_vec')*(spec_matrix-(mean_spec*unit_mat));
%unit variance whitening the data
inv_diag_eigval=zeros(spec_dim,spec_dim);
for t=1:spec_dim
    inv_diag_eigval(t,t)=1./(diag_eigval(t,t));
    inv_diag_eigval(t,t)=sqrt(inv_diag_eigval(t,t));   
end
whitening_mat=inv_diag_eigval*(eig_vec')*(spec_matrix-(mean_spec*unit_mat));