clear variables; close all; clc;
%%
img = mat2gray(imread('fundus.png'));
%
options = struct(...
    'FrangiScaleRange', [1 2],...
    'FrangiScaleRatio', 1,...
    'FrangiBetaOne', 1,...
    'FrangiBetaTwo', 15,...
    'verbose',true,...
    'BlackWhite',true);
%
[img_out,whatScale,Direction] = FrangiFilter2D(img, options);
%
img_out = mat2gray(img_out);
img_out = imadjust(img_out, [0 0.05]);
%
figure;
subplot(121); imshow(img); title('Input');
subplot(122); imshow(img_out); title('Output');
%
imwrite(img_out,'fundus_output.png');
