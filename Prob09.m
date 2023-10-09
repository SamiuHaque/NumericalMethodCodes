clc, clear, close all

syms x
f = x-1-0.5*sin(x);
a = pi/2;     %Base Point 
T = taylor(f, 'ExpansionPoint', a, 'Order', 10);  %for expanded series
disp(T);

max_error = 0.015;

M = 1;
h = pi/2;

R = Inf;
n = 0;
while R>max_error
    n = n+1;
    R = (M*(h^(n+1)))/factorial(n+1);
end

fprintf('\nHighest Order for the maximum error of %0.4f: %d\n',max_error, n)