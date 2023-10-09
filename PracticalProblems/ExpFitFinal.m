clc, clear, close all

%Problem 03
%Exponential curve fit
%y=ae^(b*x) or ln(y)=ln(a)+bx

x = [-20 0 20 40 60 80 100 120];
y = [4 0.38 0.095 0.032 0.015 0.0078 0.0045 0.0032];

X = x;
Y = log(y);

n = length(X);

SX = [n sum(X);sum(X) sum(X.^2)];
SY = [sum(Y);sum(X.*Y)];

A = SX\SY;

a = exp(A(1))
b = A(2)

y_bar = sum(y)/n;

st=0;
sr=0;
for i = 1:n
    st = st+((y(i)-y_bar)^2);
    sr = sr+((y(i)-a*exp(b*x(i)))^2);
end

r = sqrt((st-sr)/st);

fprintf('Correlation Coefficient, r = %0.6f\n', r);

% scatter(x,y,'*','r')
% grid on
% hold on
% 
% syms Xg
% Yg = a*exp(b*Xg);
% 
% Xg = linspace(X(1),X(n),100);
% Yg = subs(Yg);
% 
% plot(Xg,Yg,'cyan')
% legend('Data Points','Fitted exponential curve')
% xlabel('x')
% ylabel('f(x)')

