function [y] = log_likelihood_f(x, label, flag)
%   log��Ȼ���ۺ���
%   flag == 0 �������        ��ʱx��softmax������
%   flag == 1 ������        ��ʱx��softmax�������
[n,d] = size(x);
% y = zeros(n,d);
if flag == 0
    y =  -sum(sum(label.*log(x+eps)));
    y = y;
else
    y = (x - label);
end
end

