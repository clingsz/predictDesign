function coveringset
% genCombine;
nlst = 50;
N = length(nlst);
for i = 1:N
    n = nlst(i);
    W{i} = buildRandMatrix(n);
    r(i) = minihamming(W{i});
    disp([n r(i)]);
end
plot(nlst,r);
end

function W = buildRandMatrix(N)
P = 29;
W = zeros(P,N);
for i = 1:N
   lst = randperm(P);
   W(lst(1:4),i) = 1;
end
end

function r = minihamming(W)
[P,N] = size(W);
load('X');
[~,L] = size(X);
dis = zeros(L,1);
for l = 1:L
   XX = repmat(X(:,l),[1 N]);
   dis(l) = min(sum(XX~=W));
   disp([l L max(dis)]);
end
r = max(dis);
end

function genCombine
n = 29;
r = 4;
x = zeros(n,1);
global X;
global cnt;
X = zeros(n,nchoosek(n,r));
cnt = 0;
fitres(n,r,x);
save('X','X');
end

function fitres(n,r,x)
% disp([n r]);
if n==0 && r==0
   global X;
   global cnt;
   cnt = cnt + 1;
   X(:,cnt) = x;
   disp(cnt);
   return
end
if r==0
    fitres(0,0,x);
elseif n==r
    x(n) = 1;
    fitres(n-1,r-1,x);
elseif n<r
    return
elseif n>r
    x(n) = 1;
    fitres(n-1,r-1,x);
    x(n) = 0;
    fitres(n-1,r,x);
end
end

