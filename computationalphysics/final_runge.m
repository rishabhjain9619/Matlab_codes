diff_y=@(u)u;
diff_u=@(x,y,u)-y+(0.2*(1-y^2)*u);
for h=0.1
    n=ceil(8*pi/h);
    arr_y=zeros(n,1);
    arr_u=zeros(n,1);
    arr_x=zeros(n,1);
    %initial condition
    arr_y(1)=0.5;
    arr_u(1)=0;
    arr_x(1)=0;
    for i=2:n
        temp_0=diff_u(arr_x(i-1),arr_y(i-1),arr_u(i-1));
        temp_1=diff_u(arr_x(i-1)+h/2,arr_y(i-1)+(h/2*arr_u(i-1)),arr_u(i-1)+h/2*(temp_0));
        temp_2=diff_u(arr_x(i-1)+h/2,arr_y(i-1)+(h/2*arr_u(i-1)),arr_u(i-1)+h/2*(temp_1));
        temp_3=diff_u(arr_x(i-1)+h,arr_y(i-1)+h*arr_u(i-1),arr_u(i-1)+(h*temp_2));
        arr_u(i)=arr_u(i-1)+((h/6)*(temp_0+2*temp_1+2*temp_2+temp_3));
        temp_4=diff_y(arr_u(i-1));
        temp_5=diff_y(arr_u(i-1)+(h/2*temp_0));
        temp_6=diff_y(arr_u(i-1)+(h/2*temp_2));
        temp_7=diff_y(arr_u(i-1)+h*temp_3);
        arr_y(i)=arr_y(i-1)+((h/6)*(temp_4+2*temp_5+2*temp_6+temp_7));
        arr_x(i)=arr_x(i-1)+h;
    end
    plot(arr_x,arr_y)
    figure(2)
    plot(arr_y,arr_u)
end