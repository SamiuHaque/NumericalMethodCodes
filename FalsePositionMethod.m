clc,clear,close all

%False Position Method
%Function: f = xe^x-cos(x)

    while 1
        
        f = @(x) x*exp(x)-cos(x);
    
        x0=input('Enter the value of x0: ');
        x1=input('Enter the value of x1: ');
    
        tolerance=0.0001; %for four decimal place accuracy
        
        fprintf('\n f(x0)=%0.6f  &  f(x1)=%0.6f\n',f(x0),f(x1))
    
        if f(x0)*f(x1)>0
            fprintf('\n The root does not exist between the given interval of %0.6f and %0.6f\n',x0,x1)
        else
            break
        end
    end
    
    i=0;
    
    while 1
        
        fprintf('\n The root lies between %0.6f and %0.6f', x0,x1)
        
        i=i+1;
        
        x2=(x0*f(x1)-x1*f(x0))/(f(x1)-f(x0));
        
        if f(x2)<0
            x0=x2;
        else f(x2)>0
            x1=x2;
        end
        
        if abs(f(x2))<tolerance
            break
        end
    end
    
    fprintf('\nRoot=%0.6f \nf(%0.6f)=%0.6f \nNo. of Iteration=%d\n',x2,x2,f(x2),i)
    
    fzero(f,0) %for verification