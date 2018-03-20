% Loads a file describing a level of the program.
function level = loadLevel(filename)
% Opens the file and initializes the instructions and code to empty cell
% arrays.
fileId = fopen(filename, 'rt');
instructions = {};
code = {};
output = {};

% Reads in every line of the file.
while ~feof(fileId)
    line = fgets(fileId);
    % If the instructions block is found, read in all instructions.
    if strcmp(line, ['start instructions {' newline])
        instructions = loadBlock(fileId, ['} end instructions' newline]);
    end
    % If the code block is found, read in all code.
    if strcmp(line, ['start code {' newline])
        code = loadBlock(fileId, ['} end code' newline]);
    end
    % If the output block is found, read in all output.
    if strcmp(line, ['start output {' newline])
        output = loadBlock(fileId, ['} end output' newline]);
    end
end

% If nothing was loaded, default to a cell containing a blank string.
if isempty(instructions)
    instructions = {''};
end
if isempty(code)
    code = {''};
end
if isempty(output)
    output = {''};
end

% Creates a new level object.
level = Level(instructions, code, output);
disp(level)

% Closes the file.
fclose(fileId);
end

% Loads in a segment of the file.
% Segments start and end with a unique tags to identify them.
% Returns a cell array of the strings in the segment.
function block = loadBlock(fileId, endString)
block = {};
line = fgets(fileId);
% Continues reading in lines until the endString is found.
while ~strcmp(line, endString) && ~feof(fileId)
    block = [block line];
    line = fgets(fileId);
end
end
