function [dW2p] = dL2p(W,p)
%     Wi = sum(W.*W,2).^(p/2);
%     W2p1 = sum(Wi).^((1/p)-1);
%     Wim = repmat(Wi,1,m).^((p/2)-1);
%     dW2p = W2p1*Wim.*W;
%      for i = 1:length(Wi)
% %            dW2(i,:) = W2p1*Wi(i).*W(i,:);
%            dW2p(i,:) = (p/2)*W(i,:)*(norm(W(i,:))^(p-2));
%      end
%     err = dW2-dW2p;
dWd = (sum(W.*W,2)+eps).^(p-2);
D = diag(dWd);
dW2p = p*D*W;

end