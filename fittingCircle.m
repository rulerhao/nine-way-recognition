function [cx, cy, r] = fittingCircle(x, y)
%FITTINGCIRCLE Fitting contour points to a circle.
%
% Input:
%   x, y      -  the coordinates of the points on the contour
%
% Output:
%   cx, cy, r -  the circle parameters
%

% February 2018

diffy = 480;
N = length(x);
A = [];
B = [];

for i = 1:N
    for j = (i + 1):N
        x1 = x(i); y1 = y(i);
        x2 = x(j); y2 = y(j);
        
        if abs(y2 - y1) < 1, continue; end
        if abs(y1 - y2) < diffy, diffy = abs(y1 - y2); end
        
        m = -(x2 - x1) / (y2 - y1);
        c = (x1 + x2) * m / 2 - (y1 + y2) / 2;
        A = [A; m, -1];
        B = [B; c];
    end
end

p = A \ B;
cx = p(1); cy = p(2);

if 1 == size(x, 1)
    P = [x; y];
else
    P = [x, y]';
end

[a, b] = size(p);
[a2, c] = size(P);

if a ~= a2, error('size of p and P does not match'); end

t = sum(p.^2, 1);
p2 = repmat(t', [1, c]);
t = sum(P.^2, 1);
P2 = repmat(t, [b, 1]);
r = mean(sqrt(p2 + P2 - 2 * p' * P));

end