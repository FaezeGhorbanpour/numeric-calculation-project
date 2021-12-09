function varargout = chapter1(varargin)

%CHAPTER1 M-file for chapter1.fig
%      CHAPTER1, by itself, creates a new CHAPTER1 or raises the existing
%      singleton*.
%
%      H = CHAPTER1 returns the handle to a new CHAPTER1 or the handle to
%      the existing singleton*.
%
%      CHAPTER1('Property','Value',...) creates a new CHAPTER1 using the
%      given property value pairs. Unrecognized properties are passed via
%      varargin to chapter1_OpeningFcn.  This calling syntax produces a
%      warning when there is an existing singleton*.
%
%      CHAPTER1('CALLBACK') and CHAPTER1('CALLBACK',hObject,...) call the
%      local function named CALLBACK in CHAPTER1.M with the given input
%      arguments.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help chapter1

% Last Modified by GUIDE v2.5 07-Dec-2016 22:12:10

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @chapter1_OpeningFcn, ...
                   'gui_OutputFcn',  @chapter1_OutputFcn, ...
                   'gui_LayoutFcn',  [], ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
   gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before chapter1 is made visible.
function chapter1_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   unrecognized PropertyName/PropertyValue pairs from the
%            command line (see VARARGIN)

% Choose default command line output for chapter1
handles.output = hObject;
ah = axes('unit', 'normalized', 'position', [0 0 1 1]);
% import the background image and show it on the axes
 

imagesc(imread('background.jpg'));
% prevent plotting over the background and turn the axis off
 
set(ah,'handlevisibility','off','visible','off')
% making sure the background is behind all the other uicontrols
 
uistack(ah, 'bottom');

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes chapter1 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = chapter1_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function expression_Callback(hObject, eventdata, handles)
% hObject    handle to expression (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of expression as text
%        str2double(get(hObject,'String')) returns contents of expression as a double


% --- Executes during object creation, after setting all properties.
function expression_CreateFcn(hObject, eventdata, handles)
% hObject    handle to expression (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Enter.
function Enter_Callback(hObject, eventdata, handles)
% hObject    handle to Enter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global variables count amounts errors l F
F = get(handles.expression,'String');
if  isempty(F)
    msgbox('Enter an expression !!','Error');
else
set(handles.ValuePanel,'Visible','on');
syms a b c d e f
variables = symvar(F);
count = 0;

set(handles.name,'String',variables);
l = size(variables);
amounts = zeros(1,l(1));
errors = zeros(1,l(1));


end


% --- Executes on button press in Solve.
function Solve_Callback(hObject, eventdata, handles)
% hObject    handle to Solve (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global count l

if l(1) == count
set(handles.ResultPanel,'Visible','on');
[s,command] = system('python tem.py');
set(handles.S,'String',command);
else
    warndlg('You must enter all variable values.');
end







% --- Executes on button press in Repeat.
function Repeat_Callback(hObject, eventdata, handles)
% hObject    handle to Repeat (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.result1,'Visible','off');
set(handles.E,'String','');
set(handles.A,'String','');
set(handles.ResultPanel,'Visible','off');
Enter_Callback(hObject, eventdata, handles);




function A_Callback(hObject, eventdata, handles)
% hObject    handle to A (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of A as text
%        str2double(get(hObject,'String')) returns contents of A as a double


% --- Executes during object creation, after setting all properties.
function A_CreateFcn(hObject, eventdata, handles)
% hObject    handle to A (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function E_Callback(hObject, eventdata, handles)
% hObject    handle to E (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of E as text
%        str2double(get(hObject,'String')) returns contents of E as a double


% --- Executes during object creation, after setting all properties.
function E_CreateFcn(hObject, eventdata, handles)
% hObject    handle to E (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


        
    
% --- Executes on button press in next.
function next_Callback(hObject, eventdata, handles)
    
% hObject    handle to next (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global variables count amounts l errors p F


  count = count + 1;
   str=get(handles.E,'String');
    if isempty(str)
        variables(count)=[];
        l(1) = l(1) - 1;
        count = count - 1;
    else
    if isempty(str2num(str))
        warndlg('Input must be numerical');
        amounts(count) = 0;
    else
        amounts(count) = str2num(str);
       
    end
    
    
    
    str2 = get(handles.A,'String');
if isempty(str2) 
    x = str2num(str);
    x = abs(x); %in case of negative numbers
    y = 0;
    while (floor(x)~=x)
        y = y+1;
        x = x*10;
    end
    
    switch get(get(handles.Round,'SelectedObject'),'Tag')
        case 'Symetric',
            errors(count) = double(10^(-y)/2);
        case 'Choping',
            errors(count) = double(10^(-y));
    end
else
if isempty(str2num(str2))
    set(handles.A,'string','0');
    warndlg('Input must be numerical');
    errors(count) = 0;
else
    errors(count) = str2num(str2);
end
end
    end
if count == l(1)
    set(handles.result1,'Visible','on');  
    s = '';
    for i = 1:l(1)
        s =[s,char(10),strcat('Variable : ',variables(i)) ,strcat(' Exact Value : ' ,num2str(amounts(i))),strcat('Absolute Error : ',num2str(errors(i)))];
    end
    set(handles.input,'String',s);
    fid = fopen('tem.txt','wt');
    fprintf(fid,'%s ',F);
    fprintf(fid,'\n');
    for i=1:size(variables,1)
       fprintf(fid, '%s  ', variables{i,:}); 
    end
    fprintf(fid,'\n');
    fprintf(fid,'%f ',amounts);
    fprintf(fid,'\n');
    fprintf(fid,'%f ',errors);
    fprintf(fid,'\n');
    fprintf(fid,'%d',p);
    fclose(fid);

else
    set(handles.name,'String',variables(count+1));
end

function sigma = PropError(f,varlist,vals,errs)
sym a b c e f g
n = numel(varlist);
sig = vpa(ones(1,n));
for i = 1:n
    sig(i) = diff(f,varlist(i),1);
end
error1 =sqrt((sum((subs(sig,varlist,vals).^2).*(errs.^2))));
error = double(error1);
sigma = [{vpa(subs(f,varlist,vals))} {'+/-'} {error};
         {'Percent Error'} {'+/-'} {abs(100*(error)/vpa(subs(f,varlist,vals)))}];
     
     function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton13.
function pushbutton13_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton14.
function pushbutton14_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton15.
function pushbutton15_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton16.
function pushbutton16_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton17.
function pushbutton17_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton17 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton18.
function pushbutton18_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton18 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close;
Chapter2;


% --- Executes on button press in pushbutton9.
function pushbutton9_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close;
Chapter3;

% --- Executes on button press in pushbutton12.
function pushbutton12_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close;
mahasebatProject;
