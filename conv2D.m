
function conv2D(image_path, stride, is_same, filter )    

input_image = imread(image_path);
filterName = inputname(4);      % extracting filtername.
n = length(input_image);        % size image
f = length(filter);             % size kernel (filter)
strideNumber = int2str(stride);  % converting stride number to ch.

%------------------- extracting file name --------------------------------
imageName = extractAfter(image_path, 'input_images\');
imageName = extractBefore(imageName, '.jpg');  % extracting file name.

if(is_same)
    
    type = 'same';
    padding = floor((f-1)/2);
%--------- padding the input-matrix(input image)-------------------
    input_image = padarray(input_image, [padding, padding], 0, 'both'); % padding zero to corners of input image(matrix)
    output_size = floor((n + 2 * padding - f) / stride + 1);
    
else
    type = 'valid';
    output_size = floor((n - f - 1) / stride );
    
end

output_image = uint8(zeros(output_size));

% whos n;
% whos f;
% whos outSize;
 sizeChannel = size(input_image, 3);
 
for chanel = 1 : sizeChannel
    
    i = zeros(1); 
    for row = 1 : output_size    % this is for output image
        
        j = zeros(1);
        for col = 1 : output_size
            
            window = input_image(row + ((stride - 1) * i) : row + ((stride - 1) * i) + f - 1 , col + ((stride - 1) * j) : col + ((stride - 1) * j) + f - 1 , chanel);   % selecting working matrix.
            sumCell = uint8(sum((double(window) .* double(filter)), 'all'));
            output_image(row, col, chanel) = sumCell;
            j = j + 1;
        end
        i = i + 1;
    end
end

    imshow(output_image);
    writeName = append(imageName, '_', filterName, '_', type, '_', strideNumber, '.jpg');
    
    filePath = 'output_images';
    FILENAME = fullfile(filePath, writeName);
    imwrite(output_image, FILENAME);
    
end

