classdef MatlabTutor < matlab.apps.AppBase
    % Properties specified to MatlabTutor instances.
    properties (Access = private)
        Level Level
    end
    
    % Properties that correspond to app components.
    properties (Access = private)
        UIFigure                   matlab.ui.Figure
        CodeTextAreaLabel          matlab.ui.control.Label
        CodeTextArea               matlab.ui.control.TextArea
        ConsoleTextAreaLabel       matlab.ui.control.Label
        ConsoleTextArea            matlab.ui.control.TextArea
        InstructionsTextAreaLabel  matlab.ui.control.Label
        InstructionsTextArea       matlab.ui.control.TextArea
        RunButton                  matlab.ui.control.Button
    end
    
    methods (Access = private)
        % Button pushed function: RunButton.
        function buttonPushed(app, event)
            % A cell containing the lines of code entered by the user.
            linesOfCode = app.CodeTextArea.Value;
            code = strjoin(linesOfCode, ',');
            output = {};
            try
                % Runs the users code and displays the console output.
                output = evalc(code);
                app.ConsoleTextArea.Value = output;
            catch error
                % Shows the user any errors that have occured.
                app.ConsoleTextArea.Value = error.message;
            end
            
            % Checks the users output.
            success = app.Level.checkCode(output);
            if success
                app.ConsoleTextArea.Value{end + 1} = '--------------------------------------';
                app.ConsoleTextArea.Value{end + 1} = 'Nice job!! Your code worked perfectly.';
            else
                app.ConsoleTextArea.Value{end + 1} = '-----------------------------------';
                app.ConsoleTextArea.Value{end + 1} = 'Incorrect output. Please try again.';
            end
        end
    end
    
    % App initialization and construction.
    methods (Access = private)
        % Create UIFigure and components.
        function createComponents(app)
            % Create UIFigure.
            app.UIFigure = uifigure;
            app.UIFigure.Position = [100 100 707 404];
            app.UIFigure.Name = 'UI Figure';
            
            % Create CodeTextAreaLabel.
            app.CodeTextAreaLabel = uilabel(app.UIFigure);
            app.CodeTextAreaLabel.HorizontalAlignment = 'right';
            app.CodeTextAreaLabel.Position = [248 370 34 15];
            app.CodeTextAreaLabel.Text = 'Code';
            
            % Create CodeTextArea.
            app.CodeTextArea = uitextarea(app.UIFigure);
            app.CodeTextArea.FontColor = [1 1 1];
            app.CodeTextArea.BackgroundColor = [0 0.451 0.7412];
            app.CodeTextArea.Position = [248 17 219 337];
            app.CodeTextArea.Value = {'Code goes here.'};
            
            % Create ConsoleTextAreaLabel.
            app.ConsoleTextAreaLabel = uilabel(app.UIFigure);
            app.ConsoleTextAreaLabel.HorizontalAlignment = 'right';
            app.ConsoleTextAreaLabel.Position = [477 370 50 15];
            app.ConsoleTextAreaLabel.Text = 'Console';
            
            % Create ConsoleTextArea.
            app.ConsoleTextArea = uitextarea(app.UIFigure);
            app.ConsoleTextArea.Editable = 'off';
            app.ConsoleTextArea.FontColor = [0 1 0];
            app.ConsoleTextArea.BackgroundColor = [0.149 0.149 0.149];
            app.ConsoleTextArea.Position = [477 17 219 337];
            app.ConsoleTextArea.Value = {'Here is some console output.'};
            
            % Create InstructionsTextAreaLabel.
            app.InstructionsTextAreaLabel = uilabel(app.UIFigure);
            app.InstructionsTextAreaLabel.HorizontalAlignment = 'right';
            app.InstructionsTextAreaLabel.Position = [16 370 67 15];
            app.InstructionsTextAreaLabel.Text = 'Instructions';
            
            % Create InstructionsTextArea.
            app.InstructionsTextArea = uitextarea(app.UIFigure);
            app.InstructionsTextArea.Editable = 'off';
            app.InstructionsTextArea.Position = [16 17 219 337];
            app.InstructionsTextArea.Value = {'This is what you should make.'};
            
            % Create RunButton.
            app.RunButton = uibutton(app.UIFigure, 'push');
            app.RunButton.ButtonPushedFcn = createCallbackFcn(app, @buttonPushed, true);
            app.RunButton.Position = [367 366 100 22];
            app.RunButton.Text = 'Run';
        end
    end
    
    methods (Access = public)
        % Construct app.
        function app = MatlabTutor(level)
            % Create and configure components.
            createComponents(app)
            
            app.Level = level;
            % Shows the content of the specified level.
            app.InstructionsTextArea.Value = level.Instructions;
            app.CodeTextArea.Value = level.Code;
            
            % Register the app with App Designer.
            registerApp(app, app.UIFigure)
            
            if nargout == 0
                clear app
            end
        end
        
        % Code that executes before app deletion.
        function delete(app)
            
            % Delete UIFigure when app is deleted.
            delete(app.UIFigure)
        end
    end
end
