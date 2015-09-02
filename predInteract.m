clear;
P = 5;
A = 0.1*randn(P,P);
for i = 1:P
    A(i,i) = -0.5-rand(1,1)*1;
end
mu = 0.2*rand(P,1);
% mu = [0.1;0.1];
% A = diag(-0.5*ones(P,1));
% A(1,2) = -0.5;
% A(2,1) = -0.4;
% B = [mu A];
y = A\-mu;
lst = y<0;
y(lst) = 0;
if sum(lst)>0
    y(~lst) = A(lst,lst)\-mu(lst);
end


dt = 0.1;
tlst = 1:dt:80;
T = length(tlst);
% x0 = [0.0001;2];
x0 = 0.1*ones(P,1);
x(:,1) = x0;
sigma = 0.02;
for t = 2:T
    xold = x(:,t-1);
    xnew = xold.*exp(dt*(mu+A*xold)+sigma*randn(P,1));
    x(:,t) = xnew;
end
figure(293);clf;
hold on;
plot(tlst,x);
% xs = -inv(A)*mu;
plot([min(tlst) max(tlst)],(y*[1 1])','--');
hold off;
xend = x(:,end);