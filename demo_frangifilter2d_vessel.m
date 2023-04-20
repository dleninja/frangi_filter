clear variables; close all; clc;
%%
img = mat2gray(imread('vessel.png'));
%
options = struct(...
    'FrangiScaleRange', [1 8],...
    'FrangiScaleRatio', 1,...
    'FrangiBetaOne', 0.5,...
    'FrangiBetaTwo', 15,...
    'verbose',true,...
    'BlackWhite',true);
%
[img_out,whatScale,Direction] = FrangiFilter2D(img, options);
%
img_out = mat2gray(img_out);
img_out = imadjust(img_out, [0 0.25]);
%
figure;
subplot(121); imshow(img); title('Input');
subplot(122); imshow(img_out); title('Output');
%
imwrite(img_out,'vessel_output.png');