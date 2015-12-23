function hsi = rgb2hsi(rgb)
% function hsi = rgb2hsi(rgb)
% Convert rgb image to hsi image.
% i = (r + g + b)/3
% s = 1 - min(r, g, b)/i
% h = 90 - arctan((2r - g - b)/(sqrt(3)(g - b))) + {0, g >= b; 180, g < b}
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
h_plus = (b > g)*180;
h = 90 - atan((2*r - g - b)./(sqrt(3)*(g - b))) + h_plus;

% concatenate h, s, i
hsi = cat(3, h, s, i);

