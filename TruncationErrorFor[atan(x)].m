clc, clear, close all

%Calculation of Truncation Error for Taylor Series Expansion
%Function: f = tan^-1(x)

syms x
f = atand(x);
n = 9;                       %degree of expansion

T = taylor(f,'Order',(n+1))  %for expanded tan-inverse(x) series

Obs = [0:2.5:10];
Vec = [1:2:n];          
Pos = [0:((n+1)/2)-1];       
Error = [];

for i = 1:length(Obs)
    
    a = Obs(i);    
    
    terms = (a.^Vec ./Vec).*(180/pi).*(-1).^Pos;
    
    expVal = cumsum(terms);
    trueVal = atand(a);
    fprintf('Error for tan-inverse(%0.2f)', a);
    Error = abs(trueVal - expVal);
    disp(Error);

end



