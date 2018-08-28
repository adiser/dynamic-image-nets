function save_from_folders(parent_dir)
tic
dirlist = dir(parent_dir);
len = length(dirlist);

m = 13320
fprintf('Progress:\n');
fprintf(['\n' repmat('.',1,m) '\n\n']);


%To handle . and ..
parfor i = 3:len
    if dirlist(i).isdir
        folder = dirlist(i).name;
        %dynamic_image_matrix = compute_dynamic_images(fullfile(parent_dir, folder))
        %imwrite(dynamic_image_matrix,  strcat(fullfile(parent_dir, folder, folder), '.png'))
        compute_windowed_dynamic_images(parent_dir, folder, 1, 10);
        fprintf('\b|\n');
    end
end
toc