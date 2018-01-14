function [next_value]=runge_kutta_fun(f,x,y,u,h)
temp_0=f(x,y,u);
temp_1=f(x+h/2,y+(h/2*u),u+h/2*(temp_0));
temp_2=f(x+h/2,y+(h/2*u),u+h/2*(temp_1));
temp_3=f(x+h,y+h*u,u+(h*temp_2));
next_value=u+((h/6)*(temp_0+2*temp_1+2*temp_2+temp_3));
end