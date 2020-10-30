function compressImage(f, p)
%################################################################
%f-filename of the image used
%p-rank approximation
%img-output compressed matrix of the image which is 
%    rank approximation of original image
%################################################################
    imat=imread(f);
    [m,n,d]=size(imat);
    A=double(imat);

    outmat=zeros(m,n,d);

    for i=1:d
      outmat(:,:,i)=lowRankApprox(A(:,:,i),p);  
    end
     
    imwrite(uint8(outmat),strcat('Lowrankresult_',f));
       
end

