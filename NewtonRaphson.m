clc, clear, close all

syms x

f = x^3-2*x-5;
df = diff(f,x);

xl = 2;
xu = 3;
a = subs(f,x,xl);
b = subs(f,x,xu);
if a*b>0
    fprintf('The root does not lie in this interval')
end
tol = 0.00001;
x0 = 2;
i = 0;

while 1
    i = i+1;
    fr = subs(f,x,x0);
    dfr = subs(df,x,x0);
    
    xr = x0-fr/dfr;
    err = abs((xr-x0)/xr);
    if err<=tol
        break
    end
    x0 = xr;
end

fprintf('Root = %0.6f', xr)

    
