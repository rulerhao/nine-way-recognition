function [cp] = FindLocation(im)
%% Load Image
I = im;
im = imresize(I, 0.25); % resize the image to reduce computation

%% Find Pupillary Component
BW = imbinarize(im(:, :, 1), 'adaptive', 'ForegroundPolarity', 'dark', 'Sensitivity', 0.3);
BW = imcomplement(BW);
CC = bwconncomp(BW);
numPixels = cellfun(@numel, CC.PixelIdxList);
[~, idx] = max(numPixels);
BW(:) = 0;
BW(CC.PixelIdxList{idx}) = 1;

%% Find Boundary Points
s = regionprops(BW, 'centroid');
Xc = round(s.Centroid(1));
Yc = round(s.Centroid(2));

x(1) = find(BW(Yc, 1:Xc), 1);
x(2) = find(BW(Yc, Xc:end), 1, 'last') + Xc - 1;
y(1) = Yc;
y(2) = y(1);
x(3) = Xc;
y(3) = find(BW(Yc:end, Xc), 1, 'last') + Yc - 1;
y(4) = find(BW(1:Yc, Xc), 1);
y(4) = round((y(4) + Yc) / 2);
x(4) = find(BW(y(4), 1:Xc), 1);
x(5) = find(BW(y(4), Xc:end), 1, 'last') + Xc - 1;
y(4) = y(4);
y(5) = y(4);

%[cx, cy] = Get_Circle_Point_Through_Boundary_Points(x,y);
%r = Get_Circle_Radius_Through_Circle_Points_And_Center_Point(x,y,cx,cy);
[cx,cy,r] = fittingCircle(x, y);
pp = [cx, cy, r];
%figure;
%imshow(BW);
%hold on;
%plot(x, y, 'gx');
ang = 0:0.01:(2 * pi);
xp = r .* cos(ang);
yp = r .* sin(ang);
%plot(cx + xp, cy + yp, 'LineWidth', 2, 'Color', 'r');

%% Find Iris
im = double(im(:, :, 1));
sz = size(im);

scanrange = [70, 110];

thetas = [210:-3:130, 50:-3:0, 357:-3:300];
thetas = thetas / 360 * -2 * pi;
delta = [cos(thetas); sin(thetas)];
N = length(thetas);

C = [pp(1); pp(2)];
L = scanrange(1):scanrange(2);
lines = cell(1, N);
sp = zeros(N, 2); % the start points in lines
ep = zeros(N, 2); % the end points in lines
[X, Y] = meshgrid(1:sz(2), 1:sz(1));
idCand = zeros(N, length(L) - 1);

for i = 1:N
    lines{i} = repmat(C, [1, length(L)]) + delta(:, i) * L;
    Z = interp2(X, Y, im, lines{i}(1, :), lines{i}(2, :));
    Zm = medfilt1(Z, 10, 'truncate');
    D = diff(Zm);
    [~, idCand(i, :)] = sort(D, 'descend');
    sp(i, :) = [lines{i}(1, 1), lines{i}(2, 1)];
    ep(i, :) = [lines{i}(1, end), lines{i}(2, end)];
end

idxL = idCand(1:27, 1);
m = mean(idxL);
s = std(idxL);
idx = find(idxL < m+s & idxL > m-s);

idxR = idCand(28:end, 1);
m = mean(idxR);
s = std(idxR);
idx = [idx; find(idxR < m+s & idxR > m-s) + 27];

% idx of coordinates of boundary points
ipx = [];
ipy = [];

for i = 1:numel(idx)
    ipx = [ipx, lines{idx(i)}(1, idCand(idx(i), 1))];
    ipy = [ipy, lines{idx(i)}(2, idCand(idx(i), 1))];
    if ipx(i) > sz(2) - 1 
        ipx(i) = sz(2) - 1; 
    end
    if ipy(i) > sz(1) - 1 
        ipy(i) = sz(1) - 1; 
    end
end

[cx,cy,r] = fittingCircle(ipx, ipy);
cp = [pp, cx, cy, r];
%figure;
%imshow(im, []);
%hold on;
%plot(ipx, ipy, 'gx');
ang = 0:0.01:(2 * pi);
xp = r .* cos(ang);
yp = r .* sin(ang);
%plot(cx + xp, cy + yp, 'LineWidth', 2, 'Color', 'b');

%% Resize to Original Size
cp = cp * 4;

%figure;
I = insertShape(I, 'Circle', cp(1:3), 'LineWidth', 2, 'Color', 'red');
I = insertShape(I, 'Circle', cp(4:6), 'LineWidth', 2, 'Color', 'blue');
imshow(I);

end