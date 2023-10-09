clc, clear, close all

F = ["x1" "x2" "x3"];

A = [0.8 -0.4 0
    -0.4 0.8 -0.4
    0 -0.4 0.8];

c = [41 25 105];

n = size(A,1);

x = zeros(n,1);

normVal = Inf;      %To ensure that normVal is greater than tolerance
                    %for first iteration
                    
tol = 0.05;         %Given tolerance 5%
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

disp('Solution of the system:');
for i=1:n
   fprintf('\n%s = %0.4f\n', F(i), x(i));
end
fprintf('\nNo. of iteration: %d\n', itr);



