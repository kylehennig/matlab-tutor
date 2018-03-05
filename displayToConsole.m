function displayToConsole(x)
persistent app
if isempty(app)
   app = matlabTutor;
end
app.ConsoleTextArea.Value = {x};
end
