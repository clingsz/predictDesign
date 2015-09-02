% nMC=grMinVerCover(E,d);
clear;
N = 100;
A = zeros(N,N);
c = 0;
% for i = 1:N
%     for j = i:N
%         A(i,j) = rand>0.8;
%         A(j,i) = A(i,j);
%     end
% end
% 
% for i = 1:N
%     for j = 1:N
%         if A(i,j)>0
%             c = c + 1;
%             E(c,1) = i;
%             E(c,2) = j;
%         end
%     end
% end
E = [1 2;2 1;2 3;3 2];
[f,nMC]=grMinVerCover(E);
