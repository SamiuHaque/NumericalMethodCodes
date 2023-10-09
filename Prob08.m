clc, clear, close all
format short

syms x
f = log(x);
n = 4;     %Order of expansion
a = 1;     %Base Point 
T = taylor(f, 'ExpansionPoint', a, 'Order', (n+1));  %for expanded ln(1+x) series
disp(T);

y = 2;      %For f(2)

tv = log(y);    %True Value
ev = 0;
for i=1:n
    ev = ev+((-1)^(i-1))*((y-1)^i)/i;
    err(i) = (abs(tv-ev)/tv)*100;
end

disp('True Percent Relative Error: ')
disp(err)