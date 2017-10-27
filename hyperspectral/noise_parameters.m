function [noise_mean_spec,noise_covar,noise_samp_coreal]=noise_parameters(noise_spec_matrix)
[dim1, dim2]=size(noise_spec_matrix);
noise_mean_spec=mean(noise_spec_matrix');
%converting the dimension of mean_spec to spec_dim*1(87*1) from 1*spec_dim
noise_mean_spec=noise_mean_spec';
%calculating the covariance matrix
noise_covar=(1/dim2*(noise_spec_matrix*noise_spec_matrix'))-(noise_mean_spec)*(noise_mean_spec');
%calculating the sample corelation matrix
noise_samp_coreal=noise_covar+(noise_mean_spec*noise_mean_spec');
%unbiasing the covar matrix
noise_covar=dim2/(dim2-1)*noise_covar;
end