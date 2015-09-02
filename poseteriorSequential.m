P = 10;

group = zeros(P,1); group(1:P/2) = 1; group(P/2+1:end) = 2;
tau = 1; omega = 1; invSigma = diag(ones(P,1)*tau);
for i = 1:P
    for j = 1:P
        if group(i)==group(j) && i~=j
            invSigma(i,j) = -omega;
            invSigma(i,i) = invSigma(i,i)+omega;
        end
    end
end
% imagesc(invSigma);
mu = zeros(P,1);

Sigma = inv(invSigma);
w = [0.5*ones(P/2,1);-0.5*ones(P/2,1)];
N = 2;

invSigmaOld = invSigma;
muold = mu;
mulst = [];
for n = 1:100
X = randn(N,P);
X(:,2) = 0;
y = X*w + randn(N,1);
invSigmaNew = (X'*X+invSigmaOld);
munew = inv(invSigmaNew)*invSigmaOld*muold + inv(invSigmaNew)*X'*y;
muold = munew;
invSigmaOld = invSigmaNew;
mulst = [mulst munew];
end
imagesc([w mulst]);colorbar;
% subplot(2,1,2),imagesc([invSigma invSigmaNew]);colorbar;
