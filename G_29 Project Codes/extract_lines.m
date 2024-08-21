function [fl, re] = extract_lines(im_texto)
    % Crop the input image to remove empty margins
    im_texto = clip(im_texto);
    
    % Get the number of rows in the image
    num_filas = size(im_texto, 1);
    
    % Iterate through each row to find the first row with no white pixels
    for s = 1:num_filas
        if sum(im_texto(s, :)) == 0
            % Split the image into the current line (nm) and the rest (rm)
            nm = im_texto(1:s-1, :); 
            rm = im_texto(s:end, :);
            
            % Clip the line to remove empty columns and assign to output
            fl = clip(nm);
            pause(1); % Pause for visual inspection (can be removed in production)
            
            % Clip the remaining part and assign to output
            re = clip(rm);
            break
        else
            % If no empty row is found, assign the whole image to 'fl'
            fl = im_texto;
            re = [];
        end
    end
end

function img_out = clip(img_in)
    % Clip the input image to remove empty rows and columns
    [f, c] = find(img_in); % Find indices of non-zero elements
    img_out = img_in(min(f):max(f), min(c):max(c)); % Crop the image to these bounds
end
