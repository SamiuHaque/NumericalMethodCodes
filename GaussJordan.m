clc, clear, close all

R = [-4 1 0 1 0 0 0 0 0 -600
    1 -4 1 0 1 0 0 0 0 -500
    0 2 -4.67 0 0 1 0 0 0 -567
    1 0 0 -4 1 0 1 0 0 -100
    0 1 0 1 -4 1 0 1 0 0
    0 0 1 0 2 -4.67 0 0 1 -67
    0 0 0 2 0 0 -4.67 1 0 -167
    0 0 0 0 2 0 1 -4.67 1 -67
    0 0 0 0 0 1 0 1 -2.67 -67];

S = rref(R)

[r,c] = size(R);    %r = row & c = column

Rank_K = rank(R);           %Rank of Augmented Matrix
Rank_A = rank(R(:,1:c-1));  %Rank of Coefficient Matrix

if Rank_A~=Rank_K || Rank_A~=r 
    disp('Inconsistent System') 
    return
end

for i=1:r
    [m,idx] = max(abs(R(i:end,i))); %Row no. for maximum abs value 
    idx = i+idx-1;        %Rescale it for matrix 'R'
    t = R(i,:);     
    R(i,:) = R(idx,:);    %Swaping of row
    R(idx,:) = t;
        
    R(i,:) = R(i,:)/R(i,i); %r(i)=r(i)/r(i,i)
    for j=1:r           %iterate 1 to R(row)
        if i==j     
            continue    %if i & j is equal skip
        end
        R(j,:)=R(j,:)-R(i,:)*R(j,i); %r(j)=r(j)-r(i)*r(j,i) [i~=j]
    end
end

R

    