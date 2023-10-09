clc, clear, close all

%3rd degree polynomial fit
%y=a0+a1*x+a2*(x^2)+a3*(x^3)    for 3rd degree
Coeff = ["a0" "a1" "a2" "a3"];

x = [-20 0 20 40 60 80 100 120];
y = [4 .38 .095 .032 .015 .0078 .0045 .0032];

n = length(x);
y_bar = sum(y)/n;

%for 3rd degree
X = [n sum(x) sum(x.^2) sum(x.^3)
    sum(x) sum(x.^2) sum(x.^3) sum(x.^4)
    sum(x.^2) sum(x.^3) sum(x.^4) sum(x.^5)
    sum(x.^3) sum(x.^4) sum(x.^5) sum(x.^6)];
Y = [sum(y)
    sum(x.*y)
    sum((x.^2).*y)
    sum((x.^3).*y)];

A = X\Y;
for i=1:length(Coeff)
    fprintf('\n%s = %0.6f\n',Coeff(i),A(i))
end

st=0;
sr=0;
for i = 1:n
    st = st+((y(i)-y_bar)^2);
    sr = sr+((y(i)-A(1)-A(2)*x(i)-A(3)*(x(i))^2-A(4)*(x(i))^3)^2);
end

r = sqrt((st-sr)/st);
fprintf('\nCorrelation Coefficient,r = %0.6f\n', r);



    

