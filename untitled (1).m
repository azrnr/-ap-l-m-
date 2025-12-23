img = imread('resim.jpg'); 
if size(img, 3) == 3
    grayImg = 0.299*double(img(:,:,1)) + 0.587*double(img(:,:,2)) + 0.114*double(img(:,:,3));
else
    grayImg = double(img);
end
threshold = 128; 
binaryImg = grayImg < threshold; 
[rows, cols] = find(binaryImg);
if isempty(rows)
    disp('Nesne bulunamadı!');
else
    minR = min(rows);
    maxR = max(rows);
    minC = min(cols);
    maxC = max(cols);
    diameterPiksel = ((maxR - minR) + (maxC - minC)) / 2;
    referansPiksel = 100; 
    referansCm = 2; 
    oran = referansCm / referansPiksel;
    diameterCm = diameterPiksel * oran;
    fprintf('Piksel Çapı: %.2f\n', diameterPiksel);
    fprintf('Gerçek Çap (cm): %.2f\n', diameterCm);
    imshow(uint8(grayImg)); hold on;
    rectangle('Position', [minC, minR, (maxC-minC), (maxR-minR)], 'EdgeColor', 'r', 'LineWidth', 2);
end