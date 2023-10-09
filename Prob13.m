clc, clear, close all

F = ["CG1" "CG2" "CG3" "CG4" "CG5" "CL1" "CL2" "CL3" "CL4" "CL5"];

A = [2.8 0 0 0 0 -.8 0 0 0 0
    2 -2.8 0 0 0 0 .8 0 0 0
    0 2 -2.8 0 0 0 0 .8 0 0
    0 0 2 -2.8 0 0 0 0 .8 0
    0 0 0 2 -2.8 0 0 0 0 .8
    -.8 0 0 0 0 1.8 -1 0 0 0
    0 -.8 0 0 0 0 1.8 -1 0 0
    0 0 -.8 0 0 0 0 1.8 -1 0
    0 0 0 -.8 0 0 0 0 1.8 -1
    0 0 0 0 -.8 0 0 0 0 1.8];

c = [200 0 0 0 0 0 0 0 0 10];

n = size(A,1);

x = zeros(n,1);

normVal = Inf;      %To ensure that normVal is greater than tolerance
                    %for first iteration
                    
tol = 0.000001;         %Given tolerance
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



