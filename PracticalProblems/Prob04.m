clc, clear, close all

syms x
f = 2*x*cos(2*x)-(x-2)^2;
df = diff(f,x); 

x0 = input('Lower Limit = ');
x1 = input('Upper Limit = ');

y0 = subs(f,x,x0);
y1 = subs(f,x,x1);
if y0*y1>0
    fprintf('No root lies between the given interval')
    return
end

y(1) = input('Initial Guess: ');

er = 0.00001;   %For Five decimal place accuracy
i=0;
while 1
    i=i+1;
    a = subs(f,x,y(i));
    b = subs(df,x,y(i));
    y(i+1) = y(i) - a/b;
    error(i) = abs((y(i+1)-y(i))/y(i+1));
    
    if error(i)<er
        break
    end
end

fprintf('\nRoot = %0.5f \nNo. of Iteration = %d\n',y(i+1),i)


