% Function for LZW decompression
function [B, decompressed_values] = lzw_decompress(compressed_data, dictionary, image_height, image_width)
    dict_size = length(dictionary);
    next_code = dict_size + 1;
    dictionary{next_code} = [];  % Placeholder for clear code
    
    % Initialize variables
    B = zeros(image_height, image_width); % Initialize B matrix with zeros
    decompressed_values = [];
    
    % Handle the first code separately
    code = compressed_data(1);
    string = dictionary{code + 1};
    decompressed_values = [decompressed_values, code]; % Store numeric value
    
    % Initialize indices to fill B matrix
    row_index = 1;
    col_index = 1;
    
    % Store the separated pixels from the first code
    for j = 1:length(string)
        if col_index > image_width
            col_index = 1;
            row_index = row_index + 1;
        end
        
        if row_index <= image_height
            B(row_index, col_index) = str2double(string{j}); % Fill B matrix
            col_index = col_index + 1;
        end
    end
    
    % Main loop for the rest of the compressed data
    for i = 2:length(compressed_data)
        prev_code = code;
        code = compressed_data(i);
        decompressed_values = [decompressed_values, code]; % Store numeric value
        
        if code + 1 <= length(dictionary)
            entry = dictionary{code + 1};
        elseif code + 1 == next_code
            entry = [string; string(1)]; % Adjust for sequence of values
        else
            error('Invalid code encountered during decompression.');
        end
        
        % Store the decoded values into decompressed_values
        decoded_value = str2double(entry{1});
        decompressed_values = [decompressed_values, decoded_value];
        
        for j = 1:length(entry)
            if col_index > image_width
                col_index = 1;
                row_index = row_index + 1;
            end
            
            if row_index <= image_height
                B(row_index, col_index) = decoded_value; % Fill B matrix
                col_index = col_index + 1;
            end
        end
        
        dictionary{next_code + 1} = [string; entry{1}];
        next_code = next_code + 1;
        string = entry;
    end
end