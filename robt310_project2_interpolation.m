
% task 1.1
% nearest-Neighbor interpolation
% test with robt310_project2_interpolation('input02.png', 'output02.png', 5);

function robt310_project2_interpolation(input_file_name,  output_file_name, scale_factor)

    input = imread(input_file_name);
    
    % col, row = 418, 512
    [a,b] = size(input); 
    
    % scale output rows and columns
    col = scale_factor*a;
    row = scale_factor*b; 
    
    % interpolate position and round it to greater or equal value using ceil
    i_col = ceil((1:col)./(scale_factor)); 
    i_row = ceil((1:row)./(scale_factor)); 
    
    % row and column wise interpolation
    output = input(:,i_row); 
    output = output(i_col,:);
    
    % display images 
    imshow(input); 
    title("original image"); 
    figure, imshow(output); 
    title("nearest-neighbour interpolation");
    
    % save the output image
    imwrite(output, output_file_name)

end
