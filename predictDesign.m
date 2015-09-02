function predictDesign
[theta_true,paras,Dspace] = getInitialSetting;
D = getOptimalDesign(Dspace,paras);
paras = updateParas(D,theta_true,paras);
end

function paras_new = updateParas(D,theta_true,paras)

end

function Dopt = getOptimalDesign(Dspace,paras)
S = 100;
L = length(Dspace);
V = zeros(L,S);
for s = 1:S
    theta = simTheta(paras);
    for d = 1:L
        D = Dspace(d,:);
        V(d,s) = estimateError(D,theta);
    end
end
Vsum = sum(V,2);
[~,Dopt] = min(Vsum);
end

function [theta_true,paras_prior,Dspace] = getInitialSetting

end
function theta = simTheta(paras)

end

function e = estimateError(D,theta)
    e = sum((estimateTheta(D,theta) - theta).^2);
end