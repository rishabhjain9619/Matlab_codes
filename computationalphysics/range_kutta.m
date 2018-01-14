f=@(x,y)0.098-(10^-4)*y^2;
for h=0.1
    n=ceil(1000/h);
    arr_y=zeros(n,1);
    arr_x=zeros(n,1);
    %initial condition
    arr_y(1)=1;
    arr_x(1)=0;
    x=0;
    for i=2:n
        temp_0=f(arr_x(i-1),arr_y(i-1));
        temp_1=f(arr_x(i-1)+h/2,arr_y(i-1)+(h/2*temp_0));
        temp_2=f(arr_x(i-1)+h/2,arr_y(i-1)+(h/2*temp_1));
        temp_3=f(arr_x(i-1)+h,arr_y(i-1)+(h*temp_2));
        arr_y(i)=arr_y(i-1)+((h/6)*(temp_0+2*temp_1+2*temp_2+temp_3));
        arr_x(i)=arr_x(i-1)+h;        
    end
    arr_x=(0:h:n*h-h);
    plot(arr_x,arr_y)
    pause(2)
    hold on
end