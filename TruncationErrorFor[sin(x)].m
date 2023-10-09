clc, clear, close all

%Calculation of Truncation Error for Taylor Series Expansion
%Function: f = sin(x)

syms x
f = sind(x);
n = 9;                       %degree of expansion

T = taylor(f,'Order',(n+1));  %for expanded sin(x) series
disp(T);

Obs = 0:2.5:10;
Vec = 1:2:n;               %for power and factorial
Pos = 0:((n+1)/2)-1;       %for sign of terms
Error = [];

for i = 1:length(Obs)
    
    a = Obs(i)*(pi/180);     %for degree to radian conversion
    
    terms = (a.^Vec ./factorial(Vec)).*(-1).^Pos;
    
    expVal = cumsum(terms);
    trueVal = sin(a);
    
    fprintf('Error for sin(%0.2f Degree)', Obs(i));
    Error = abs(trueVal - expVal);
    
    disp(Error);

end



