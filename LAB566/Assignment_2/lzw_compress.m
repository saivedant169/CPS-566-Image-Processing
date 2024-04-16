% LZW compression function
function [compressed_data, dictionary] = lzw_compress(data)
    dictionary = cell(16777216, 1);  % Create a dictionary with 256 initial values
    
    % Initialize dictionary with all possible values (0 to 255)
    for i = 0:16777215
        dictionary{i + 1} = num2str(i);
    end
    
    % Initialize variables
    current_code = '';
    compressed_data = [];
    
    % Iterate over each element in data
    [rows, cols] = size(data);
    for r = 1:rows
        for c = 1:cols
            next_char = num2str(data(r, c));
            % Modify here: Add a small hyphen between the codes
            if ~isempty(current_code)
                temp_code = strcat(current_code, '-', next_char); % Include hyphen
            else
                temp_code = next_char; % No hyphen for the first character
            end
            
            % If the next code is in the dictionary, update current_code
            if ismember(temp_code, dictionary)
                current_code = temp_code;
            else
                % Write the code for the current_code to compressed_data
                compressed_data = [compressed_data getCode(dictionary, current_code)];
                
                % Add the new code to the dictionary
                dictionary{end + 1} = temp_code;
                
                % Reset current_code   
                current_code = next_char;
            end
        end
    end
    
    % Write the last code to compressed_data
    if ~isempty(current_code)
        compressed_data = [compressed_data getCode(dictionary, current_code)];
    end
end

% Helper function to get code from dictionary
function code = getCode(dictionary, key)
    code = find(ismember(dictionary, key)) - 1;
end