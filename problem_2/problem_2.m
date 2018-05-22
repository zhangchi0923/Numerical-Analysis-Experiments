%分段线性插值
clc
clear
m =10;
t = linspace(-1,1,m+1);
tt = 1./sqrt(1-t.^2);
x = zeros(m+1);
for i = 2:m
    x(i) = -1+tt(i);
    x(i+1) = x(i);
end

phi = 1./(1+25.*x.^2);

delta = diff(phi)./diff(x);
n = length(x);
u = linspace(-1,1,100);
k = ones(size(u));

for j = 2:n-1
    k(x(j)<= u) = j;
end
s = u - x(k);
v = phi(k) + s.*delta(k);

figure(2)
y = @(u)(1./(1+25.*u.^2));
fplot(y,[-1,1],'r-.*');
hold on
plot(u,v,'b-.*');
title('Graphs of approximated func & piecewise linear interpolation func when n=10 and 20');
legend('Approximated Func','PLI Func',1);
