function [norm] = normalize(im, cp, ang_res, rad_res)
%NORMALIZE Generate normalized image by Cartesian to polar transformation.
%
% Input:
%   im        -  the eye image
%   cp        -  a 1x6 array, the circle parameters of pupil and iris
%   ang_res   -  the angle range of normalized image
%   rad_res   -  the radian range of normalized image
%
% Output:
%   norm      -  the normalized iris image
%

% Code written by Po-Jen, Huang
% shasoul13@gmail.com
% February 2018

xp = cp(1); yp = cp(2); rp = cp(3);
xi = cp(4); yi = cp(5); ri = cp(6);

for i = 1:ang_res
    theta(i) = (i - 1) * (360 / ang_res) / 360 * -2 * pi; %這一段我有做修改 以便再做ang_res縮放的時候更有彈性
end
N = length(theta);

for i = 1:N
    d(i) = sqrt(((xi + ri * cos(theta(i))) - (xp + rp * cos(theta(i))))^2 ...
        + ((yi + ri * sin(theta(i))) - (yp + rp * sin(theta(i))))^2);
    L(:, i) = [d(i):-(d(i) / rad_res):(d(i) / rad_res)]';
end

im = double(im(:, :, 1));
[h, w] = size(im);
[X, Y] = meshgrid(1:w, 1:h);

C = [xp + rp * cos(theta); yp + rp * sin(theta)];
Tx = cos(theta); Ty = sin(theta);
Xnew = repmat(C(1, :), [rad_res 1]) + repmat(Tx, [rad_res 1]) .* L;
Ynew = repmat(C(2, :), [rad_res 1]) + repmat(Ty, [rad_res 1]) .* L;

norm = interp2(X, Y, im, Xnew, Ynew);

% figure;
% imshow(norm, [0, 255]);
% tmp = get(gcf, 'position');
% set(gcf, 'position', [tmp(1), tmp(2), ang_res, rad_res]);
% set(gca, 'position', [0, 0, 1, 1], 'units', 'normalized');

end

