clear;
x = dataset('File','distanceCOG.csv','Delimiter',',');

D = double(x(1:end,2:end));
load X;

X =X';
D = 1-D;
C = X*D*X';

% P = size(X,2);
% for i = 1:P
%     for j = i+1:P
%         disp([i j]);
%         lst1 = find(X(:,i));
%         lst2 = find(X(:,j));
%         dis = 0;
%         for t = 1:length(lst1)
%             for k = 1:length(lst2)
%                 dis = dis + 1-A(lst1(t),lst2(k));
%             end
%         end
%         D(i,j) = dis;
%     end
% end