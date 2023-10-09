clc, clear, close all

x = [1 2 3 4 5];
y = [0.5 1.7 3.4 5.7 8.4];

n = length(x);
ybar = sum(y)/n;

SX = [n sum(x) sum(x.^2) sum(x.^3)
    sum(x) sum(x.^2) sum(x.^3) sum(x.^4)
    sum(x.^2) sum(x.^3) sum(x.^4) sum(x.^5)
    sum(x.^3) sum(x.^4) sum(x.^5) sum(x.^6)];

SY = [sum(y)
    sum(x.*y)
    sum((x.^2).*y)
    sum((x.^3).*y)];

A = SX\SY

Sr = 0;
St = 0;

for i=1:n
    St = St+(y(i)-ybar)^2;
    Sr = Sr+(y(i)-A(1)-A(2)*x(i)-A(3)*(x(i)^2)-A(4)*(x(i)^3))^2;
end

r = sqrt((St-Sr)/St)

scatter(x,y,'r*')
hold on
grid on

syms Xg
Yg = A(1)+A(2)*Xg+A(3)*Xg^2+A(4)*Xg^3;

Xg = linspace(x(1),x(end),100);
Yg = subs(Yg);

plot(Xg,Yg,'b')
legend('Data Points','3rd Degree Fit')
xlabel('x')
ylabel('f(x)')

