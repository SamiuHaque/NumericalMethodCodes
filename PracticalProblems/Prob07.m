clc, clear, close all

F = ["F1" "F2" "F3" "H2" "V2" "V3"];
R = [-cosd(30) 0 cosd(60) 0 0 0 0;
    -sind(30) 0 -sind(60) 0 0 0 2000;
    cosd(30) 1 0 1 0 0 0;
    sind(30) 0 0 0 1 0 0;
    0 -1 -cosd(60) 0 0 0 0;
    0 0 sind(60) 0 0 1 0];

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

disp('Solution of the System:')

for i=1:r
   fprintf('\n%s = %0.4f N\n', F(i), R(i,end))
end

