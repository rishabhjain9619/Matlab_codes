diff_u1=@(u2)u2;
diff_u2=@(u1,u2)-u1+(0.2*(1-u1^2)*u2);
for h=0.001
    n=ceil(8*pi/h);
    arr_u1=zeros(n,1);
    arr_u2=zeros(n,1);
    arr_x=zeros(n,1);
    %initial condition
    arr_u1(1)=0.5;
    arr_u2(1)=0;
    arr_x(1)=0;
    for i=2:n
        temp_0=diff_u1(arr_u2(i-1));
        temp_1=diff_u1(arr_u2(i-1)+(h/2*temp_0));
        temp_2=diff_u1(arr_u2(i-1)+(h/2*temp_1));
        temp_3=diff_u1(arr_u2(i-1)+(h*temp_2));
        arr_u1(i)=arr_u1(i-1)+((h/6)*(temp_0+2*temp_1+2*temp_2+temp_3));
        temp_0=diff_u2(arr_u1(i-1),arr_u1(i-1));
        temp_1=diff_u2(arr_u1(i-1)+h/2,arr_u1(i-1)+(h/2*temp_0));
        temp_2=diff_u2(arr_u1(i-1)+h/2,arr_u1(i-1)+(h/2*temp_1));
        temp_3=diff_u2(arr_u1(i-1)+h,arr_u1(i-1)+(h*temp_2));
        arr_u2(i)=arr_u2(i-1)+((h/6)*(temp_0+2*temp_1+2*temp_2+temp_3));
        arr_x(i)=arr_x(i-1)+h;         
    end
    plot(arr_x,arr_u1)
    figure(2)
    plot(arr_u1,arr_u2)
end