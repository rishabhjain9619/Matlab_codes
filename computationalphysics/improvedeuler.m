f=@(x,y)y^2+1;
for h=0.1
    n=ceil(1/h);
    arr_y=zeros(n,1);
    %initial condition
    arr_y(1)=0;
    x=0;
    for i=2:n
        arr_y(i)=arr_y(i-1)+h/2*(f(0,arr_y(i-1))+f(0,arr_y(i-1)+h*f(0,arr_y(i-1))));
        x=x+h;        
    end
    arr_x=(0:h:n*h-h);
    plot(arr_x,arr_y)
    pause(2)
    hold on
end