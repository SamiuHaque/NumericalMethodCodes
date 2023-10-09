clc, clear, close all

A = [10 2 -1
    -3 -6 2
    1 1 5];      %Coefficient Matrix

c = [27;-61.5;-21.5];   %Constants

n = size(A,1);

for i=1:n
    temp = sum(abs(A(i,[1:i-1 i+1:n])));
    di = abs(A(i,i))>temp;
    if di==false
        fprintf('The system is not diagonally dominant');
    end
end

x = zeros(n,1);

normVal = Inf;      %To ensure that normVal is greater than tolerance
                    %for first iteration
                    
tol = 0.05;         %Given tolerance
itr = 0;            

while normVal>tol   %the loop will continue as long as 
                    %the normVal doesn't exceed the tolerance
                    
    x_old = x;      %x_old will always be updated before the new iteration
    
    for i=1:n
        s = 0;
        for j=1:i-1
            s = s+A(i,j)*x(j);  %for updated value
        end
        for j=i+1:n
            s = s+A(i,j)*x_old(j);  %for old value
        end
        x(i) = (1/A(i,i))*(c(i)-s);   %the overall value of x(i)
    end
    
    itr = itr+1;
    normVal = norm(x_old-x);    %Update normVal
end

fprintf('Solution of the system:\n x = \n');
disp(x);
fprintf('No. of iteration: %d\n', itr);
