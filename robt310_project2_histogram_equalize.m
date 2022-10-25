
% task 1.2
% histogram equalization
% test with robt310_project2_histogram_equalize(input_file_name)

function robt310_project2_histogram_equalize(input_file_name)

    input = imread(input_file_name);
    
    % enhance image details with histogram equalization  
    h_equalized = histeq(input);
    figure, imshow(h_equalized); 
    title("histogram equalization");
    
    % local histogram equalization using blockproc
    fun = @(block_struct) histeq(block_struct.data);
    local_he = blockproc(input,[40 40],fun);
    figure, imshow(local_he,[]); 
    title("local histogram equalization");

end
