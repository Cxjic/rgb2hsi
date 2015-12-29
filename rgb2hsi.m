function hsi = rgb2hsi(rgb)
% function hsi = rgb2hsi(rgb)
% Convert rgb image to hsi image.
% i = (r + g + b)/3
% s = 1 - min(r, g, b)/i
% h = arccos(0.5*(2r - g - b)/sqrt((r - g)^2 + (r - b)(g - b)))
% Inputs:
%   rgb   - rgb image
%
% Outputs:
%   hsi   - hsi image

% seperate r, g, b
rgb = im2double(rgb);
r = rgb(:, :, 1);
g = rgb(:, :, 2);
b = rgb(:, :, 3);

% implement the conversion
i = (r + g + b)/3;
s = 1 - (min(min(r, g), b)./i);
h = acos(0.5*(2*r - g - b)./sqrt((r - g).^2 + (r - b).*(g - b)));

% concatenate h, s, i
hsi = cat(3, h, s, i);

