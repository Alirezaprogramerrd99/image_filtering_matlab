
clc;
clear;

% image names in the project folder:
%   kitty, lecun, mask, milad, yoshua

%-------------------- filters ------------------------------------------
edgeDetector = [-1 -1 -1; 0  0  0; 1 1 1];
sharpness = [0 -1 0 ; -1  5 -1; 0 -1 0];
embossing2 = [-2 -1 0; -1 1 1; 0 1 2];
embossing = [2 -0 0; 0 -1 0; 0 0 -1];
gaussian = [1 4 7 4 1; 4 16 26 16 4; 7 26 41 26 7; 4 16 26 16 4; 1 4 7 4 1];
gaussian = (1/273) .* gaussian;
%-----------------------------------------------------------------------

% in the third argument of conv2D false means (valid) and true means (same)
conv2D('input_images\yoshua.jpg', 1, true, sharpness );
