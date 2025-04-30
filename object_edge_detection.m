
% Load an image
image = imread('fig.jpg'); % AA1.jpg image path

% Convert to grayscale if the image is in RGB
grayImage = rgb2gray(image);

% Display the original grayscale image
figure;
imshow(grayImage);
title('Original Grayscale Image');

% Apply Sobel edge detection
sobelEdges = edge(grayImage, 'Sobel');
% Display the Sobel edge-detected image
figure;
imshow(sobelEdges);
title('Sobel Edge Detection');

% Apply Prewitt edge detection
prewittEdges = edge(grayImage, 'Prewitt');
% Display the Prewitt edge-detected image
figure;
imshow(prewittEdges);
title('Prewitt Edge Detection');

% Apply Canny edge detection
cannyEdges = edge(grayImage, 'Canny');
% Display the Canny edge-detected image
figure;
imshow(cannyEdges);
title('Canny Edge Detection');

% Label connected components in the binary edge image (Canny edges)
labeledImage = logical(cannyEdges);

% Measure properties of the labeled regions
stats = regionprops(labeledImage, 'BoundingBox','Centroid', 'Area');

% Display the labeled image with object identification
figure;
imshow(grayImage);
hold on;
for k = 1:length(stats)
    centroid = stats(k).Centroid;
    % Plot centroid
    plot(centroid(1), centroid(2), 'g*', 'Markersize', 10);
end
title('Identified Objects');
hold off;

% Display all edge-detected images
figure;
subplot(1, 3, 1);
imshow(sobelEdges);
title('Sobel Edges');

subplot(1, 3, 2);
imshow(prewittEdges);
title('Prewitt Edges');

subplot(1, 3, 3);
imshow(cannyEdges);
title('Canny Edges');

% Display the identified objects with bounding boxes and centroids
figure;
imshow(grayImage);
hold on;
for k = 1:length(stats)
    bbox = stats(k).BoundingBox;
    centroid = stats(k).Centroid;
    % Draw bounding box
    rectangle('Position', bbox, 'EdgeColor', 'r','Linewidth', 2);
    % Plot centroid
    plot(centroid(1), centroid(2), 'g*', 'Markersize', 10);
end
title('Object Identification');
hold off;
