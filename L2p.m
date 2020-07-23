function [W2p] = L2p(W,p)
    Wi = sum(W.*W,2).^(p/2);
    W2p = sum(Wi).^(1/(p+eps));
end