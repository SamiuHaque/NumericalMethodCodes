clc,clear,close all
format short
x0 = input('Initial Guess: ');

[r,y,itr] = root_eqn(x0);
fprintf('\nRoot=%0.6f \nf(%0.6f)=%0.6f \nNo. of Iteration=%d\n',r,r,y,itr)

function [x2,y,i] = root_eqn(x0)
    f = @(x) 1/x;
    x1 = -1;
    tolerance=0.000000000000001;
    
    i=0;
    x2 = 0;
    if f(x0)*f(x1)>0
        fprintf('\n The root does not exist between the given interval of %0.6f and %0.6f',x0,x1)
        return
    end

    while 1
        i=i+1;

        x2=(x0*f(x1)-x1*f(x0))/(f(x1)-f(x0));

        if f(x2)<0
            x1=x2;
        else
            x0=x2;
        end
        y = f(x2);
        if abs(y)<tolerance
            break
        end
    end

end

