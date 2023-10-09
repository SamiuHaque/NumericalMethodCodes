clc, clear, close all
format long

%2nd and 3rd degree polynomial fit
%y=a0+a1*x+a2*(x^2)             for 2nd degree
%y=a0+a1*x+a2*(x^2)+a3*(x^3)    for 3rd degree

x = [-20 0 20 40 60 80 100 120];
y = [4 .38 .095 .032 .015 .0078 .0045 .0032];

n = length(x);
y_bar = sum(y)/n;

%for 2nd degree
X2 = [n sum(x) sum(x.^2)
    sum(x) sum(x.^2) sum(x.^3)
    sum(x.^2) sum(x.^3) sum(x.^4)];
Y2 = [sum(y)
    sum(x.*y)
    sum((x.^2).*y)];

A2 = X2\Y2

st=0;
sr2=0;
for i = 1:n
    st = st+((y(i)-y_bar)^2);
    sr2 = sr2+((y(i)-A2(1)-A2(2)*x(i)-A2(3)*(x(i))^2)^2);
end

r2 = sqrt((st-sr2)/st);
fprintf('Correlation Coefficient for 2nd degree, r2 = %0.6f\n', r2);


%for 3rd degree
X3 = [n sum(x) sum(x.^2) sum(x.^3)
    sum(x) sum(x.^2) sum(x.^3) sum(x.^4)
    sum(x.^2) sum(x.^3) sum(x.^4) sum(x.^5)
    sum(x.^3) sum(x.^4) sum(x.^5) sum(x.^6)];
Y3 = [sum(y)
    sum(x.*y)
    sum((x.^2).*y)
    sum((x.^3).*y)];

A3 = X3\Y3

sr3=0;
for i = 1:n
    sr3 = sr3+((y(i)-A3(1)-A3(2)*x(i)-A3(3)*(x(i))^2-A3(4)*(x(i))^3)^2);
end

r3 = sqrt((st-sr3)/st);
fprintf('Correlation Coefficient for 3rd degree, r3 = %0.6f\n', r3);

% %Plotting for 2nd and 3rd degree
% scatter(x,y,'*','r')
% grid on
% hold on
% 
% syms Xg
% Yg2 = A2(1)+A2(2)*Xg+A2(3)*(Xg^2);
% Yg3 = A3(1)+A3(2)*Xg+A3(3)*(Xg^2)+A3(4)*(Xg^3);
% 
% Xg = linspace(x(1),x(n),100);
% Yg2 = subs(Yg2);
% Yg3 = subs(Yg3);
% 
% plot(Xg,Yg2,'b')
% plot(Xg,Yg3,'g')
% legend('Data Points','2nd degree fitted polynomial','3rd degree fitted polynomial')
% xlabel('x')
% ylabel('f(x)')
% 

