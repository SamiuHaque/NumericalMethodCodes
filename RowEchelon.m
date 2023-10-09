clc, clear,close all

format rat

N = 3  %No. of unknowns

K = [3 -1 1 4
    -1 7 -2 1
    2 6 -1 5]; %Augmented Matrix

Rank_K = rank(K)
R_K = RowEchelonForm(K)

A = [3 -1 1
    -1 7 -2
    2 6 -1];    %Coefficient Matrix

Rank_A = rank(A)
R_A = RowEchelonForm(A)

if Rank_A==Rank_K
    if Rank_K>=N
        fprintf('\nThe equations are independent and have unique solution\n')
    else
        fprintf('\nThe equations are dependent and have infinite number of solution\n')
    end
else
    fprintf('\nThe equations are inconsistent and have no solution\n')
end    



function R = RowEchelonForm(R)
    a = diag(R);    %Diagonal Values
    for i=1:length(a)
        if a(i)==0  %Check if any diagonal value is zero
            disp('\nPlease, avoid diagonal zeros for this method\n')
            return
        end
    end

    for i=1:size(R,1)   %iterate 1 to R(row)
        if abs(R(i,i))<=0.000000001
            fprintf('\nZero Pivot Element at %dth row\n',i)
            continue
        end

        R(i,:) = R(i,:)/R(i,i); %r(i)=r(i)/r(i,i)
        for j=i+1:size(R,1)   %iterate 1 to R(row)
            R(j,:)=R(j,:)-R(i,:)*R(j,i); %r(j)=r(j)-r(i)*r(j,i)
        end
    end
    fprintf('\nRow Echelon Form:\n')
end



  