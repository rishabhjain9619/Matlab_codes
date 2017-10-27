%after implementing the noise_estimation
[noise_eig_vec, noise_diag_eigval]=eig(noise_covar);
%unit variance whitening the data by noise_covariance matrix
noise_inv_diag_eigval=zeros(spec_dim,spec_dim);
for t=1:spec_dim
    noise_inv_diag_eigval(t,t)=1./(noise_diag_eigval(t,t));
    noise_inv_diag_eigval(t,t)=sqrt(noise_inv_diag_eigval(t,t));   
end
noise_whitening_mat=noise_inv_diag_eigval*(noise_eig_vec')*(spec_matrix);
%applying standard pca treating this as the new spec_matrix should be
%careful in this step
spec_matrix=noise_whitening_mat;
[dim1, dim2]=size(spec_matrix);
mean_spec=mean(spec_matrix');
%converting the dimension of mean_spec to spec_dim*1(87*1) from 1*spec_dim
mean_spec=mean_spec';
%calculating the covariance matrix
covar=(1/dim2*(spec_matrix*spec_matrix'))-(mean_spec)*(mean_spec');
covar=dim2/(dim2-1)*covar;
[eig_vec, diag_eigval]=eig(covar);
rot_spec_matrix=eig_vec'*spec_matrix;
%now apply newtestpca for loading images in terms of signal to noise ratio