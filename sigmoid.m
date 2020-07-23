function y = sigmoid(x,derive)
% function 'sigmoid'
y=zeros(size(x));
if derive == 0
    y = 1 ./ (1 + exp(-x));
else
    y=x.*(ones(size(x))-x);
end


