arr=zeros(spec_dim,1);
for g=1:spec_dim
    temp1=eig_vec(:,1:g);
    proj_sig=temp1*temp1';
    proj_noise=eye(spec_dim)-(temp1*temp1');
    arr(g)=trace(proj_noise*samp_coreal)+2*trace(proj_sig*noise_samp_coreal);
end