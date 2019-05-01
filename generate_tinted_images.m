%% Load data
fID = fopen('Source_Image/file.lst');
list = textscan(fID,'%s','delimiter','\n'); 
list = [list{1,1}];
fclose(fID);

response = load('Source_Image/real_illum_11346_Normalized.mat');
response = response.real_rgb;

%% Train-Test partition
rng('default')
CVparts = cvpartition(11346,'KFold',15);
idx = test(CVparts,1);

%% Main loop
for i = 1:size(list,1)
    img = imread(list{i,1});
    img = img(1:224,1:224,:);

    % color correction acording to gt illumination 
    e = reshape(response(i,:),1,1,3);
    img = uint8(double(img)./e);
    
    img = imresize(img,[256,256]); 
    [img_, map] = tint_image(img);
    img = cat(2,img_,img);
    filename = strcat('train\',sprintf('%05d.jpg', i));
    if idx(i)
       filename = strcat('test\',sprintf('%05d.jpg', i)); 
    end
    imwrite(img,filename);
    filename = strcat('tint_maps\',sprintf('%05d.jpg', i));
    imwrite(map,filename);
end

%% Tint function
function [img_, map] = tint_image(Im)
map = zeros(256,256,3);
[X,Y] = meshgrid(1:256,1:256);
colors = [0, 0, 255; 0, 255, 0; 255, 0, 0];
    for i = 1:3
        mu = rand(1,2)*256;
        sigma = [rand(1)*25600 0; 0 rand(1)*25600];
        tint = mvnpdf([X(:) Y(:)], mu, sigma);
        tint = reshape(tint, 256, 256);
        tint = tint / max(tint(:));
        tint = repmat(tint,[1 1 3]);
        tint = tint .* reshape(colors(i,:)/norm(colors(i,:)), 1,1,3);
        tint = 1 - tint;
        map = map + tint ./ 3;
    end
map = imresize(map, [size(Im,1) size(Im,2)]);

img_ = uint8(map .* double(Im));
map = uint8(res * 255);
end
