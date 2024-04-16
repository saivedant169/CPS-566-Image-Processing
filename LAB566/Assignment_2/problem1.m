% Clear workspace, figures, and command window
clear all; close all; clc;

% Read and convert the image to grayscale
image = imread('udayton.jpg');

% Compress the image using LZW algorithm
[compressed_data, dictionary] = lzw_compress(image);

% Save compressed data and dictionary to files
write_compressed_data(compressed_data, 'udayton1.lzw');
write_dictionary(dictionary, 'dictionary_values.txt');

% Display compressed data and completion message
disp('Compressed data:');
disp(compressed_data);
disp('Compression completed.');

function write_compressed_data(data, filename)
    % Save compressed data to a file
    fid = fopen(filename, 'wb');
    fwrite(fid, data, 'ubit32'); % Write data in 32-bit format
    fclose(fid);
end

function write_dictionary(dictionary, filename)
    % Save dictionary keys and values to a text file
    fid_dict = fopen(filename, 'wt');
    for i = 1:numel(dictionary)
        fprintf(fid_dict, 'Key: %d, Value: %s\n', i - 1, dictionary{i});
    end
    fclose(fid_dict);
end
