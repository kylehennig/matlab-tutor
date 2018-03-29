classdef Launcher < matlab.apps.AppBase
    % Properties that correspond to app components.
    properties (Access = public)
        UIFigure matlab.ui.Figure
        Label    matlab.ui.control.Label
    end
    
    methods (Access = private)
        % Opens the specified level in a new window.
        function openLevel(~, ~, level)
            clear global;
            level = loadLevel(['level' num2str(level) '.txt']);
            MatlabTutor(level);
        end
        
        % Creates a callback functions the opens the specified level.
        function callback = levelCallback(~, level)
            % Anonymous function wrapper for openLevel.
            callback = @(app, event) openLevel(app, event, level);
        end
        
        % Creates UIFigure and components.
        function createComponents(app)
            % Creates UIFigure.
            app.UIFigure = uifigure;
            app.UIFigure.Position = [100 100 640 380];
            app.UIFigure.Name = 'UI Figure';
            
            % Creates the level selection buttons.
            levelCount = 15;
            for level = 1:levelCount
                app.createButton(level);
            end
            
            % Creates the label.
            app.Label = uilabel(app.UIFigure);
            app.Label.Position = [25 345 110 15];
            app.Label.Text = 'CHOOSE A LEVEL';
        end
        
        function createButton(app, level)
            % Calculates the location to place the button from the level
            % number. Desgined to be 5 rows by 3 columns (15 levels).
            rows = 5;
            row = mod(level - 1, rows);
            col = floor((level - 1) / rows);
            x = 90 + 180 * col;
            y = 290 - 60 * row;
            
            % Creates the button.
            button = uibutton(app.UIFigure, 'push');
            button.ButtonPushedFcn = createCallbackFcn(app, app.levelCallback(level), true);
            button.Position = [x y 100 25];
            button.Text = ['Level ' num2str(level)];
        end
    end
    
    methods (Access = public)
        % Constructs app.
        function app = Launcher
            % Creates and configure components.
            createComponents(app)
            
            % Registers the app with App Designer.
            registerApp(app, app.UIFigure)
            
            if nargout == 0
                clear app
            end
        end
        
        % Code that executes before app deletion.
        function delete(app)
            
            % Deletes UIFigure when app is deleted.
            delete(app.UIFigure)
        end
    end
end
