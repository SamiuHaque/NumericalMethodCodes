clc, clear, close all

%Calculation of Truncation Error for Taylor Series Expansion
%Function: f = sin(x-2)

syms x
f = sind(x-2);
n = 9;                       %degree of expansion

T = taylor(f,'Order',(n+1)); %for expanded sin(x-2) series
disp(T);

Obs = 0:2.5:10;
Pos = 0:n;       
Error = [];

for i = 1:length(Obs)
    
    a = Obs(i)*(pi/180);     %for degree to radian conversion
    
    terms = (a.^Pos ./factorial(Pos)).*sind((90.*Pos)-2);
    
    expVal = cumsum(terms);
    trueVal = sin(a-(pi/90));
    
    fprintf('Error for sin((%0.2f-2) Degree)', Obs(i));
    Error = abs(trueVal - expVal);
    
    disp(Error);

end



