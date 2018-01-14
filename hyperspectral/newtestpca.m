for k=spec_dim:-1:1
%temp=rot_spec_matrix(k,:);
%temp=affin_mat(k,:);
%temp=whitening_mat(k,:);
temp=abund_mat(k,:);
temp2=zeros(x_dim,y_dim);
for k=1:y_dim-1
    for l=1:x_dim
        temp2(l,k)=temp((k-1)*x_dim+l);
    end
end
imshow(temp2,[]);
pause(3)
end
imshow(temp3,[])