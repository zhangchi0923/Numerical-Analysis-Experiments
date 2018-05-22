clc
clear

n = 30;
k = 1:n+1;
x = cos((2.*(k-1)*pi/(2*(n+1))));
phi = 1./(1+25.*x.^2);

u = linspace(-1,1,100);
v = zeros(size(u));

for k = 1:n+1
    w = ones(size(u));
    for j = [1:k-1 k+1:n+1]
        w = (u-x(j))./(x(k)-x(j)).*w;
    end
    v = v + phi(k)*w;
end

y = @(u)(1./(1+25.*u.^2));
fplot(y,[-1,1],'r-.*');
hold on
plot(u,v,'b-.*')
title('Graphs of approximated func & interpolation func when n=30');
legend('Approximated Func','Interpolation Func',1)