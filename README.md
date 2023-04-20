# Frangi Filter

**Disclaimer**: This repository was created to help future students utilize the FrangiFilter for image processing. I take no credit for the development of the original algorithm.

This MATLAB function was written by [Dirk-Jan Kroon](https://www.mathworks.com/matlabcentral/fileexchange/24409-hessian-based-frangi-vesselness-filter).

----
The FrangiFilter2D is a filter that enhances the visibility of vessels in medical images by computing the likelihood of an image region being a vessel. This is achieved by analyzing the eigenvectors of the Hessian matrix at each pixel in the image. The function outputs an enhanced vessel image, as well as matrices containing the scales and directions of pixels.

| Example | Image | Output |
| ---------- | --------- | --------- |
| X-ray angiography | <img src="https://github.com/dleninja/frangi_filter/blob/main/images/vessel.png" width="300" height="300"> | <img src="https://github.com/dleninja/frangi_filter/blob/main/images/vessel_output.png" width="300" height="300"> |
| Fundus | <img src="https://github.com/dleninja/frangi_filter/blob/main/images/fundus.png" width="300" height="300"> | <img src="https://github.com/dleninja/frangi_filter/blob/main/images/fundus_output.png" width="300" height="300"> |

---
The function in MATLAB is the following:

``function [outIm,whatScale,Direction] = FrangiFilter2D(I, options)``

The important ``input`` and ``options`` parameters for the FrangiFilter2D function are:
| Parameter | Definition | Default Value |
| ---------- | ---------| --------|
| I | The input image (vessel image) | Requires image to be double precision |
| FrangiScaleRange |The range of sigmas used in the filter. The sigma value determines the size of the features that the filter can detect. | The default range is [1 8]. |
|FrangiScaleRatio| The ratio between consecutive sigmas used in the filter. | The default value is 2, which means that the sigmas are doubled at each step. |
| FrangiBetaOne | Controls the suppression of blob-like structures in the filtered image. It is a value between 0 and 1, with higher values leading to stronger suppression of blobs. A value of 0 means no suppression, while a value of 1 means maximum suppression | Default value of 0.5 |
| FrangiBetaTwo | controls the sensitivity of the filter to vessel-like structures. It is a positive value, with higher values leading to stronger enhancement of vessels. However, too high values can lead to over-enhancement and false positives. The optimal value depends on the image characteristics and can be determined empirically. | The default value of 15 |
| BlackWhite | A boolean value that determines whether the filter should detect black ridges (set to true) or white ridges (set to false). | The default is true. |
| verbose | A boolean value that determines whether debug information should be displayed during the filter processing. | The default is true. |


The function ``outputs`` are:

| Parameter | Definition |
| ---------- | ---------|
|outIm | The vessel enhanced image, where the pixel value is the maximum found in all scales. |
| whatScale| A matrix with the scales on which the maximum intensity of every pixel is found. |
| Direction |A matrix with directions (angles) of pixels, computed from the minor eigenvector of the Hessian matrix. |

----
*Reference*:  Dirk-Jan Kroon (2023). Hessian based Frangi Vesselness filter (https://www.mathworks.com/matlabcentral/fileexchange/24409-hessian-based-frangi-vesselness-filter), MATLAB Central File Exchange. Retrieved April 20, 2023. 
