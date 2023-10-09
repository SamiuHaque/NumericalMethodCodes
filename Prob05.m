clc, clear, close all

%Lagrange's Interpolation Method
x = [0 1.8 5 6 8.2 9.2 12];
y = [26 16.415 5.375 3.5 2.015 2.54 8];

n = length(x);
x_val = 3.5;

s = 0;

for i=1:n
    var = 1;
    for j=1:n
        if i==j
            continue
        end
        var = var*(x_val-x(j))/(x(i)-x(j));
    end
    s = s + var*y(i);
end

fprintf('\nThe required value at x = %0.2f is: %0.4f\n', x_val, s)
        