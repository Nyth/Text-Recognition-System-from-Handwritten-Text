% Clear workspace and close all figures
clc;
close all;
clear all;

% Declare global variables
global templates; 

% Load templates for character recognition
load templates;

% Read the input image
imagen = imread('SampleImages\a.jpg');

% Display the input image with noise
figure, imshow(imagen);
title('INPUT IMAGE WITH NOISE');

% Convert the image to grayscale if it's in RGB format
if size(imagen, 3) == 3
    imagen = rgb2gray(imagen);
end
figure, imshow(imagen);
title('INPUT IMAGE WITHOUT NOISE');

% Apply histogram equalization to enhance contrast
imagen = adapthisteq(imagen);
figure, imshow(imagen);
title('Histogram Equalization');

% Adjust the image contrast
imagen = imadjust(imagen);
figure, imshow(imagen);
title('Contrast Stretching');

% Convert the image to binary using Otsu's method
threshold = graythresh(imagen);
imagen = ~im2bw(imagen, threshold);
imagen2 = imagen;

% Display the binary image
figure, imshow(imagen2);
title('Binary Image');

% Remove small objects from the binary image
imagen = bwareaopen(imagen, 15);
imagen3 = imagen;
figure, imshow(imagen3);
title('Cleaned Binary Image');

% Initialize variables for storing recognized text
word = [];
re = imagen;

% Open a text file to write the recognized text
fid = fopen('text.txt', 'wt');

% Ensure global templates is accessible and used properly
global templates;
num_letras = size(templates, 2);

% Loop to segment and recognize each line of text
while 1
    [fl, re] = extract_lines(re); % Crop each line
    imgn = fl;
    n = 0;
    
    % Initialize space vectors to store space width
    spacevector = [];
    rc = fl;
    
    % Loop to segment and recognize each character
    while 1
        [fc, rc, space] = extract_character(rc); % Crop each character
        
        % Resize the character image
        img_r = imresize(fc, [42 24]);
        n = n + 1;
        spacevector(n) = space;
        
        % Recognize the character
        letter = character_recognition(img_r, num_letras);
        word = [word letter];
        
        if isempty(rc)
            break;
        end
    end
    
    % Adjust spacing in recognized words
    max_space = max(spacevector);
    no_spaces = 0;
    
    for x = 1:n
        if spacevector(x + no_spaces) > (0.75 * max_space)
            no_spaces = no_spaces + 1;
            for m = x:n
                word(n + x - m + no_spaces) = word(n + x - m + no_spaces - 1);
            end
            word(x + no_spaces) = ' ';
            spacevector = [0 spacevector];
        end
    end
    
    % Write the recognized word to the text file
    fprintf(fid, '%s\n', word);
    word = [];
    
    if isempty(re)
        break;
    end
end
fclose(fid);

% Open the text file to display the recognized text
winopen('text.txt');
