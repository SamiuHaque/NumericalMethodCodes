clc, clear, close all

%Calculation of Truncation Error for Taylor Series Expansion
%Function: f = log(1+x)

syms x
f = log(1+x);
n = 9;                       %degree of expansion

T = taylor(f,'Order',(n+1));  %for expanded ln(1+x) series
disp(T);

Obs = 0:2.5:10;
Pos = 1:n;       
Error = [];

for i = 1:length(Obs)
    
    a = Obs(i);     
    
    terms = -(a.^Pos ./Pos).*(-1).^Pos;    
    expVal = cumsum(terms);
    trueVal = log(1+a);
    fprintf('Error for ln(1+%0.2f)', a);
    Error = abs(trueVal - expVal);
    disp(Error);
end



