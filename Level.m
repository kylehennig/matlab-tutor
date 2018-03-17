classdef Level
    properties (Access = public)
        % Instructions on how to beat the level.
        Instructions cell
        % Any template code the user should fill in.
        Code         cell
        % The expected output. Not displayed to the user.
        Output       cell
    end
    
    methods (Access = public)
        % Creates a new level object.
        function level = Level(instructions, code, output)
            level.Instructions = instructions;
            level.Code = code;
            level.Output = output;
        end
        
        % Compares the console output the user's code produces
        % to the expected output for this level.
        % Returns true if the user has succeeded.
        % Note that 'output' is a char array.
        function success = checkCode(level, output)
            userOutput = Level.removeWhitespace(output);
            expectedOutput = Level.removeWhitespace(strjoin(level.Output, ''));
            success = strcmp(userOutput, expectedOutput);
        end
    end
    
    methods (Static)
        % Removes all spaces from a string.
        function string = removeWhitespace(string)
             string = string(~isspace(string));
        end
    end
end
