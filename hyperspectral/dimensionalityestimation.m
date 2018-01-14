prin_comp_analysis;
eigenvalues_covar=diag(diag_eigval);
dimensions=zeros(spec_dim,1);
netsum=sum(eigenvalues_covar);
for j=1:spec_dim
    dimensions(j)=sum(eigenvalues_covar(1:j))/netsum;
end
dimensions=dimensions';
dimensions=fliplr(dimensions);
plot(1-dimensions)
xlabel('no. of bands');
ylabel('percentage of total variance captured');