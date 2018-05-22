function [p] = my_polyfit(x,y,n)
x = x(:);
y = y(:);
V(:,n+1) = ones(length(x),1,class(x));
for j = n:-1:1
    V(:,j) = x.*V(:,j+1);
end
[Q,R] = qr(V,0);
p = R\(Q'*y);
r = y - V*p;
p = p.';