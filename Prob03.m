clc,clear,close all

y = [8 7.5 6.5 5.7 4.7 3.8 3];
                    %Widths of deep tank bulkhead
h = 1.2;            %Interval
n = length(y)-1;    %No. of intervals
lever = 0:n;        %Lever for taking moments

s(1) = y(1);
s(n+1) = y(end);
for i=2:n   %for terms y(2) to y(n)
    %For this pattern [1 4 2 4 2 4 1]
    if(rem(i,2)==0)         
        s(i) = 4*y(i);   %if term is even multiply with 4
    else                    
        s(i) = 2*y(i);   %else multiply with 2
    end
end  
PA = sum(s);        %Summation of Product for Area

Area = (h/3)*PA;    %Area of the Bulkhead

First_M = sum(s.*lever);

Load = First_M*((h^2)/3)*1.025*9.81;

Sec_M = sum(s.*(lever.^2));

CP = (Sec_M*h)/First_M;

fprintf('\nArea = %0.4f\n',Area)
fprintf('\nLoad = %0.4f\n',Load)
fprintf('\nCP from top = %0.4f\n',CP)



