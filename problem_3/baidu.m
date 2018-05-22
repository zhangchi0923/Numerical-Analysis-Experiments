clc
clear
m = 300;
k = 0:m;
x = -1+k*2/m;
y = 1./(1+25*x.^2);
u = linspace(-1,1,200);
p = my_polyfit(x,y,30);
v = (1./(1+25*u.^2));
plot(u,v,'b-.*')
hold on
plot(u,polyval(p,u),'r-.*')
title('Graphs of approximated func & approximating func with m=200 and n=30');
legend('Approximated Func','Approximating Func',1)


