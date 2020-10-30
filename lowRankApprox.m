function B = lowRankApprox(A, p)
%#######################################################################
% A is any m,n matrix
% p is required rank approximation of A
% B is the low rank approximation of A based on p
%#######################################################################
% Low rank approximation is reducing the matrix to its nearest low rank
% By reducing singular values till to the rank we need to approximate
% even it applies to unitary vectors U and V.
% This program returns lower approximation of matrix A
%#######################################################################
    if(p>rank(A))
        B=A;
    else
       [m,n]=size(A);
       [U,S,V] = svd(A);     
       B=zeros(m,n); 
       V=V';
       for i=1:p
               sval=S(i,i);

               if(sval<(10^-14))
                   sval=0;
               end

               for j=1:m
                   for k=1:n
                       B(j,k)=B(j,k)+(sval*U(j,i)*V(i,k));
                   end      
               end
        end
    end
end
