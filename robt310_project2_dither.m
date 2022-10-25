
% task 2 
% visual illusion
% test with robt310_project2_dither(‘input00.png’, ‘output00.png’, 0);

function robt310_project2_dither(input_file_name, output_file_name, part)
    
    if (part == 1) 
        disp("Not implemented")

    else 
        
        input = double(imread(input_file_name))./ 256;
        
        % col, row = 418, 512
        [a,b] = size(input);
        output = input;
        
        % implementing pseudocode
        for y = 1:b
            for x = 1:a
                
                oldpixel = output(x, y);
                newpixel = round(oldpixel);
        
                output(x, y) = newpixel;
        
                error = oldpixel - newpixel;
                
                if x<a
                output(x + 1, y) = output(x + 1, y) + error * (7 / 16);
                end

                if (x>1) && (y<b)
                output(x - 1, y + 1) = output(x - 1, y + 1) + error * (3 / 16); 
                end 

                if y<b
                output(x,     y + 1) = output(x,     y + 1) + error * (5 / 16);
                end 

                if (x<a) && (y<b)
                output(x + 1, y + 1) = output(x + 1, y + 1) + error * (1 / 16);
                end

            end
        end
    
        % display images    
        imshow(input); 
        title("original");
        figure, imshow(output);
        title("applyed FLoyed-Steinberg dithering");

%          % check
%          disp(output);
        
        % save the output image
        imwrite(output, output_file_name)

    end 
end 
