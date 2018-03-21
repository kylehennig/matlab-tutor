classdef Launcher < matlab.apps.AppBase
    % Properties that correspond to app components.
    properties (Access = public)
        UIFigure           matlab.ui.Figure
        Button             matlab.ui.control.Button
        Button2            matlab.ui.control.Button
        Button3            matlab.ui.control.Button
        Button4            matlab.ui.control.Button
        Button5            matlab.ui.control.Button
        Button6            matlab.ui.control.Button
        Button7            matlab.ui.control.Button
        Button8            matlab.ui.control.Button
        Button9            matlab.ui.control.Button
        Button10           matlab.ui.control.Button
        Button11           matlab.ui.control.Button
        Button12           matlab.ui.control.Button
        Button13           matlab.ui.control.Button
        Button14           matlab.ui.control.Button
        Button15           matlab.ui.control.Button
        Button16           matlab.ui.control.Button
        Button17           matlab.ui.control.Button
        Button18           matlab.ui.control.Button
        Button19           matlab.ui.control.Button
        Button20           matlab.ui.control.Button
        Button21           matlab.ui.control.Button
        CHOOSEALEVELLabel  matlab.ui.control.Label
    end
    
    methods (Access = private)
        % Button pushed function: Button.
        function level1(app, event)
            clear all;
            level = loadLevel('level1.txt');
            MatlabTutor(level);
        end
        
        % Button pushed function: Button.
        function level2(app, event)
            clear all;
            level = loadLevel('level2.txt');
            MatlabTutor(level);
        end
        
        % Button pushed function: Button.
        function level3(app, event)
            clear all;
            level = loadLevel('level3.txt');
            MatlabTutor(level);
        end
        
        % Button pushed function: Button.
        function level4(app, event)
            clear all;
            level = loadLevel('level4.txt');
            MatlabTutor(level);
        end
        
        % Button pushed function: Button.
        function level5(app, event)
            clear all;
            level = loadLevel('level5.txt');
            MatlabTutor(level);
        end
    end
    
    % App initialization and construction.
    methods (Access = private)
        % Create UIFigure and components.
        function createComponents(app)
            % Create UIFigure.
            app.UIFigure = uifigure;
            app.UIFigure.Position = [100 100 640 480];
            app.UIFigure.Name = 'UI Figure';
            
            % Create Button.
            app.Button = uibutton(app.UIFigure, 'push');
            app.Button.ButtonPushedFcn = createCallbackFcn(app, @level1, true);
            app.Button.Position = [92 389 100 22];
            app.Button.Text = 'Level 1';
            
            % Create Button2.
            app.Button2 = uibutton(app.UIFigure, 'push');
            app.Button2.ButtonPushedFcn = createCallbackFcn(app, @level2, true);
            app.Button2.Position = [92 337 100 22];
            app.Button2.Text = 'Level 2';
            
            % Create Button3.
            app.Button3 = uibutton(app.UIFigure, 'push');
            app.Button3.ButtonPushedFcn = createCallbackFcn(app, @level3, true);
            app.Button3.Position = [92 287 100 22];
            app.Button3.Text = 'Level 3';
            
            % Create Button4.
            app.Button4 = uibutton(app.UIFigure, 'push');
            app.Button4.ButtonPushedFcn = createCallbackFcn(app, @level4, true);
            app.Button4.Position = [92 230 100 22];
            app.Button4.Text = 'Level 4';
            
            % Create Button5.
            app.Button5 = uibutton(app.UIFigure, 'push');
            app.Button5.ButtonPushedFcn = createCallbackFcn(app, @level5, true);
            app.Button5.Position = [92 172 100 22];
            app.Button5.Text = 'Level 5';
            
            % Create Button6.
            app.Button6 = uibutton(app.UIFigure, 'push');
            app.Button6.Position = [92 112 100 22];
            app.Button6.Text = 'Button6';
            
            % Create Button7.
            app.Button7 = uibutton(app.UIFigure, 'push');
            app.Button7.Position = [92 53 100 22];
            app.Button7.Text = 'Button7';
            
            % Create Button8.
            app.Button8 = uibutton(app.UIFigure, 'push');
            app.Button8.Position = [271 389 100 22];
            app.Button8.Text = 'Button8';
            
            % Create Button9.
            app.Button9 = uibutton(app.UIFigure, 'push');
            app.Button9.Position = [271 337 100 22];
            app.Button9.Text = 'Button9';
            
            % Create Button10.
            app.Button10 = uibutton(app.UIFigure, 'push');
            app.Button10.Position = [271 287 100 22];
            app.Button10.Text = 'Button10';
            
            % Create Button11.
            app.Button11 = uibutton(app.UIFigure, 'push');
            app.Button11.Position = [271 230 100 22];
            app.Button11.Text = 'Button11';
            
            % Create Button12.
            app.Button12 = uibutton(app.UIFigure, 'push');
            app.Button12.Position = [271 172 100 22];
            app.Button12.Text = 'Button12';
            
            % Create Button13.
            app.Button13 = uibutton(app.UIFigure, 'push');
            app.Button13.Position = [271 112 100 22];
            app.Button13.Text = 'Button13';
            
            % Create Button14.
            app.Button14 = uibutton(app.UIFigure, 'push');
            app.Button14.Position = [271 53 100 22];
            app.Button14.Text = 'Button14';
            
            % Create Button15.
            app.Button15 = uibutton(app.UIFigure, 'push');
            app.Button15.Position = [451 389 100 22];
            app.Button15.Text = 'Button15';
            
            % Create Button16.
            app.Button16 = uibutton(app.UIFigure, 'push');
            app.Button16.Position = [451 337 100 22];
            app.Button16.Text = 'Button16';
            
            % Create Button17.
            app.Button17 = uibutton(app.UIFigure, 'push');
            app.Button17.Position = [451 287 100 22];
            app.Button17.Text = 'Button17';
            
            % Create Button18.
            app.Button18 = uibutton(app.UIFigure, 'push');
            app.Button18.Position = [451 230 100 22];
            app.Button18.Text = 'Button18';
            
            % Create Button19.
            app.Button19 = uibutton(app.UIFigure, 'push');
            app.Button19.Position = [451 172 100 22];
            app.Button19.Text = 'Button19';
            
            % Create Button20.
            app.Button20 = uibutton(app.UIFigure, 'push');
            app.Button20.Position = [451 112 100 22];
            app.Button20.Text = 'Button20';
            
            % Create Button21.
            app.Button21 = uibutton(app.UIFigure, 'push');
            app.Button21.Position = [451 53 100 22];
            app.Button21.Text = 'Button21';
            
            % Create CHOOSEALEVELLabel.
            app.CHOOSEALEVELLabel = uilabel(app.UIFigure);
            app.CHOOSEALEVELLabel.Position = [24 444 110 15];
            app.CHOOSEALEVELLabel.Text = 'CHOOSE A LEVEL';
        end
    end
    
    methods (Access = public)
        % Construct app.
        function app = Launcher
            % Create and configure components.
            createComponents(app)
            
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
