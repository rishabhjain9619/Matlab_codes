dis=@(v)v;
vel=@(x)-x;
Ener=0.5;
for h=0.1
    n=ceil(20/h);
    arr_vel=zeros(n,1);
    arr_dis=zeros(n,1);
    %initial condition
    arr_vel(1)=1;
    arr_dis(1)=0;
    x=0;
    for i=2:n
        arr_dis(i)=arr_dis(i-1)+h*dis(arr_vel(i-1));
        x=x+h;
        arr_vel(i)=abs(sqrt(2*Ener-(arr_dis(i)^2)))*sign(arr_vel(i-1)-h*arr_dis(i-1));
    end
    a=0:n-1;
    a=a*h;
    plot(a,arr_vel)
    hold on
    plot(a,arr_dis)
    plot(a,1/2*(arr_vel.*arr_vel)+1/2*(arr_dis.*arr_dis))
    hold on
end
