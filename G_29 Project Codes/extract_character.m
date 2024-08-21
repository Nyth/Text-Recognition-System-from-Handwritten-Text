function [fl, re, space] = letter_crop(im_texto)
    % Crop the input image to remove empty margins
    im_texto = clip(im_texto);
    
    % Gets the numbers of columns in the image
    num_filas = size(im_texto, 2);
    
    % Iterates through each column to find the first column with no black pixels
    for s = 1:num_filas
        sum_col = sum(im_texto(:, s)); % Sum of pixel values in the current column
        if sum_col == 0
            % If the column sum is zero, it indicates space between letters
            nm = im_texto(:, 1:s-1); % Characters before the space
            rm = im_texto(:, s:end); % Remaining characters
            
            % Clip the character segment and the remaining image
            fl = clip(nm);
            re = clip(rm);
            
            % Calculate the width of the space between letters
            space = size(rm, 2) - size(re, 2);
            break
        else
            % If no space found, the whole image is the character
            fl = im_texto;
            re = [];
            space = 0;
        end
    end
end

function img_out = clip(img_in)
    % Clip the input image to remove empty rows and columns
    [f, c] = find(img_in); % Find indices of non-zero elements
    img_out = img_in(min(f):max(f), min(c):max(c)); % Crop the image to these bounds
end
