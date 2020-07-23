function [y] = log_likelihood_f(x, label, flag)
%   log似然代价函数
%   flag == 0 正向输出        此时x是softmax层的输出
%   flag == 1 反向求导        此时x是softmax层的输入
[n,d] = size(x);
% y = zeros(n,d);
if flag == 0
    y =  -sum(sum(label.*log(x+eps)));
    y = y;
else
    y = (x - label);
end
end

