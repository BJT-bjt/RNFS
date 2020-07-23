function [para,out] = CELFS(X,Y,r,gamma,m,p,iters)
% [Y] = onehot(Y);
[n,d] = size(X);
c = size(Y,2);
costs = [];
W = [];
%% initialize
W1=2*rand(d,m)-1;
b1 =0.1*ones(1,m);
W2 =2*rand(m,c)-1;
b2 =0.1*ones(1,c);
for i = 1:iters
    A1 = X*W1;
    A1 = X*W1+b1;
    Z1 = relu_f(A1,0);
%     Z1 = sigmoid(A1,0);
%     A2 = Z1*W2;
    A2 = Z1*W2+b2;
    [predY0] = softmax(A2');
%     [predY0] = sigmoid(A2', 0);
    predY = predY0';
    %% cost
    W2p = L2p(W1,p);
    loss= log_likelihood_f(predY, Y, 0)/(2*n) + gamma*W2p;
    %loss = norm(predY-Yn,'fro')^2/(2*n)+gamma*W2p;
    costs = [costs,loss];
    W = [W,W2p];
    %% backward
    dcost=log_likelihood_f(A2, Y, 1);
%     dcost=-(Yn-predY)/n;
%     S2 = dcost.*sigmoid(predY,1);
    S2 = dcost;
    
    dW2 = Z1'*S2;
    db2 = sum(S2);
    
    S1 = (S2*W2').*relu_f(A1,1);
%     S1 = (S2*W2').*sigmoid(A1,1);
    
    dW1 = X'*S1;
    db1 = sum(S1);
    
    dW2p1 = dL2p(W1,p);
    dW2p = dW2p1;
    %% update
    W1 = W1-r*(dW1+gamma*dW2p);
    W2 = W2-r*dW2;
    b1 = b1-r*db1;
    b2 = b2-r*db2;
%     if mod(i,100)==0
%         fprintf(['Training Steps: ', num2str(i), '/', num2str(iters), ';\t', 'cost: ', num2str(loss), '\n']);
%     end
end
para.W1=W1;
para.b1 = b1;
para.W2 = W2;
para.b2 = b2;
out.predY = predY;
out.costs = costs;

end
