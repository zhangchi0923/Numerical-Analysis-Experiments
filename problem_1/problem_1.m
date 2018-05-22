%%多项式插值
clc
clear
x = linspace(-1,1,30);
phi = 1./(1+25.*x.^2);

n = length(x);
u = linspace(-1,1,100);
v = zeros(size(u));
%拉格朗日插值法
for k = 1:n
    w = ones(size(u));
    for j = [1:k-1 k+1:n]
        w = (u-x(j))./(x(k)-x(j)).*w;
    end
    v = v + w*phi(k);
end

t = linspace(-1,1,100);
y = @(t)(1./(1+25.*t.^2));

figure(1)
fplot(y,[-1,1],'r-.*');
hold on
axis manual
plot(u,v,'b-.*');
title('Graphs of approximated func & interpolation func when n=30');
legend('Approximated Func','Interpolation Func',1);
    


