clc, clear, close all

%Problem 01
%Straight line fit
%y=a0+a1*x

x = [-20 0 20 40 60 80 100 120];
y = [4 0.38 0.095 0.032 0.015 0.0078 0.0045 0.0032];

n = length(x);

X1 = [n sum(x);sum(x) sum(x.^2)];
Y1 = [sum(y);sum(x.*y)];

A1 = X1\Y1

y_bar = sum(y)/n;

st=0;
sr1=0;
for i = 1:n
    st = st+((y(i)-y_bar)^2);
    sr1 = sr1+((y(i)-A1(1)-A1(2)*x(i))^2);
end

r1 = sqrt((st-sr1)/st);

fprintf('Correlation Coefficient, r1 = %0.6f\n', r1);

% scatter(x,y,'*','r')
% grid on
% hold on
% 
% Yg1 = A1(1)+A1(2)*x;
% 
% plot(x,Yg1,'y')
% legend('Data Points','Fitted straight line')
% xlabel('x')
% ylabel('f(x)')


