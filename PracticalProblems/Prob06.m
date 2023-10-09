clc, clear, close all

r = linspace(5,8,6);
u = [0.0038731 0.0036165 0.0034222 0.0032743 0.0031618 0.0030769];

n = length(r);
h = r(2)-r(1);

t = 1; %For 1st term at radius r = 5

f = 0;
for i=1:n-t
    d = diff(u,i);
    f = f+(d(t)/i)*(-1)^(i-1);
end
f = (1/h)*f; %Value of du/dr(5)

Sigma = 3.2967e6*(u(t)/5+0.3*f); 

fprintf('\nMaximum Stress = %0.4f psi\n', Sigma)

