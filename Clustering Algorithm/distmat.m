function [ dist ] = distmat( A,B )
[rowA,colA]=size(A);
[rowB,colB]=size(B);
    if rowA==1 && rowB==1
        dist=sqrt(dot((A-B),(A-B)));
    else
        C=[ones(colA-1,rowA);zeros(1,rowA)];
        D=flipud(C);
        E=[ones(colA-1,rowB);zeros(1,rowB)];
        F=flipud(E);
        G=A*E;
        H=A*F;
        I=(B*C)';
        J=(B*D)';
        dist=sqrt((G-I).^2+(H-J).^2);
    end
end

