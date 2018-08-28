function compute_windowed_dynamic_images(parent_dir, folder, stride, window_size)


%YOUR CODE HERE
dirname = fullfile(parent_dir, folder);
image_list = dir(fullfile(dirname, 'img*'));
len = length(image_list);

for i = 1 : (len + 1 - window_size)
    
    imagesA = cell(1, window_size);
    start_window = stride * i;
    
    for j = 1 : window_size
        abs_index = start_window + j - 1;
        path = fullfile(dirname, image_list(abs_index).name);
        imagesA{j} = imread(path);
    end
    
    images = cat(4, imagesA{:});
    N = size(images, 4) ;
    di = vl_nnarpooltemporal(single(images), ones(1, N)) ;
    ymax = 255;

    xmax = max(max(max(di)));
    xmin = min(min(min(di)));
    D = round(ymax * (di - xmin) / (xmax - xmin));

    D = uint8(D);
    imwrite(D, fullfile(parent_dir, folder, sprintf('rprgb_%05d.jpg', i)));
end
