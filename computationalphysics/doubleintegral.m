f=@(x,y)exp(-(x*y));
area=0;
arr=zeros(101,1);
k=1;
for p=0:1/1000:1
g=boolefunctiondouble(0,1,@(x)f(x,sqrt(1-p^2)));
%arr(k)=boolefunctiondouble(0,1,@(x)f(x,sqrt(1-p^2)));
area=area+g*0.001;
k=k+1;
end
area
k=1;
area2=0;
h=1/1000;
for i=0:h:1
        if (mod(k,4)==0)
            area2=area2+28*(h/45)*arr(k);
            k=k+1;
            
        elseif (mod(k,4)==1)
            area2=area2+64*(h/45)*arr(k);
            k=k+1;
        elseif (mod(k,4)==2)
            area2=area2+24*(h/45)*arr(k);
            k=k+1;
        elseif (mod(k,4)==3)
            area2=area2+64*(h/45)*arr(k);
            k=k+1;
        end
end
area2=area2-14*h/45*arr(1)-14*h/45*arr(1001);
area2
%ans is 0.6759