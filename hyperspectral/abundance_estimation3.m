%clear all
%close all
%works for only 3 endmembers or 2 dimensions. Slight modification required
%for more dimensions.
endmember3;
endmem_spec=spec_matrix(:,index_arr(1));
endmem_spec=horzcat(endmem_spec,spec_matrix(:,index_arr(2)));
endmem_spec=horzcat(endmem_spec,spec_matrix(:,index_arr(3)));
endmem_spec=horzcat(endmem_spec,spec_matrix(:,index_arr(4)));
%calculating some matrices for computational ease
mat1=inv(endmem_spec'*endmem_spec);
mat2=mat1*endmem_spec';
unit_mat=ones(4,1);
spec_dim=4;
abund_mat=zeros(spec_dim,x_dim*y_dim);
for iter=1:x_dim*y_dim
    random=(((unit_mat'*mat2*spec_matrix(:,iter))-1)./(unit_mat'*mat1*unit_mat));
    abund_mat(:,iter)=(mat2*spec_matrix(:,iter))-random*(mat1*unit_mat);
end
newtestpca;
    