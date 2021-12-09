function varargout = Chapter2(varargin)

% CHAPTER2 MATLAB code for Chapter2.fig
%      CHAPTER2, by itself, creates a new CHAPTER2 or raises the existing
%      singleton*.
%
%      H = CHAPTER2 returns the handle to a new CHAPTER2 or the handle to
%      the existing singleton*.
%
%      CHAPTER2('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CHAPTER2.M with the given input arguments.
%
%      CHAPTER2('Property','Value',...) creates a new CHAPTER2 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Chapter2_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Chapter2_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Chapter2

% Last Modified by GUIDE v2.5 18-Dec-2016 18:34:57

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Chapter2_OpeningFcn, ...
                   'gui_OutputFcn',  @Chapter2_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
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


% --- Executes just before Chapter2 is made visible.
function Chapter2_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Chapter2 (see VARARGIN)
clear global steps
clc
global steps
global sIndex
sIndex =1;
steps = cell(100,1);

% Choose default command line output for Chapter2


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

% UIWAIT makes Chapter2 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Chapter2_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function funcEdit_Callback(hObject, eventdata, handles)
% hObject    handle to funcEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of funcEdit as text
%        str2double(get(hObject,'String')) returns contents of funcEdit as a double


% --- Executes during object creation, after setting all properties.
function funcEdit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to funcEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function intervalEdit_Callback(hObject, eventdata, handles)
% hObject    handle to intervalEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of intervalEdit as text
%        str2double(get(hObject,'String')) returns contents of intervalEdit as a double


% --- Executes during object creation, after setting all properties.
function intervalEdit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to intervalEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function stepEdit_Callback(hObject, eventdata, handles)
% hObject    handle to stepEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of stepEdit as text
%        str2double(get(hObject,'String')) returns contents of stepEdit as a double


% --- Executes during object creation, after setting all properties.
function stepEdit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to stepEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in calculateBtn.
function calculateBtn_Callback(hObject, eventdata, handles)
clear global steps
clc
global steps
global sIndex
sIndex = 1;
steps = cell(100,1);
% hObject    handle to calculateBtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
syms interval
set(handles.slider,'value',1);
m = get(handles.methodChoicePnl,'SelectedObject');
method = get(m,'string');
func = get(handles.funcEdit,'string');
interval = str2num(get(handles.intervalEdit,'string'));
step = str2num(get(handles.stepEdit,'string'));
if (((isempty(interval) || isempty(func))&& ~strcmp(method,'Generelized Newton Raphson')) || isempty(step))
        errordlg('Fill all inputs except for Generelized Newton Raphson just fill number of step');       
elseif (step<1)
        warndlg('Step must be greater than 0'); 
else
    if (~strcmp(method,'Generelized Newton Raphson'))
        ezplot(func,interval);
    end
    xlabel({'x'});
    ylabel({'f(y)'});
    global p ;
    dlg_title = 'input';
    num_lines = 1;
    def ={'',''};
    result='';
    switch method
        case 'Bisection'
            result = Bisection(func,interval,step,p);
        case 'False Position'
            result = FalsePosition(func,interval,step,p);
        case 'Secant'
            result = Secant(func,interval,step,p);
        case 'Newton Raphson'
            result = NewtonRaphson(func,interval,step,p);
        case 'Fixed Point'
            enterInitial = {'Enter initial point:'};
            x0 = str2num(char(inputdlg(enterInitial,dlg_title,num_lines,def)));
            while (isempty(x0))
                waitfor(warndlg('Please enter initial point'))
                x0 = str2num(char(inputdlg(enterInitial,dlg_title,num_lines,def)));
            end
                if (x0> interval(2) || x0<interval(1))
                    errordlg('Initial point must be in interval');
                else
                    j = {strcat('Enter your function')};
                    g = inputdlg(j,dlg_title,num_lines,def);
                    if (isempty(char(g)))
                        errordlg('Function hasn''t entered');
                    else
                        result = FixedPoint(func,g,interval,x0,step,p);
                    end
                end
        case 'Generelized Newton Raphson'
            functionNum  = {'Enter number of function:'};
            n = str2num(char(inputdlg(functionNum,dlg_title,num_lines,def)));
            if (isempty(n))
                errordlg('Number of functions hasn''t entered');
            else
                enterValue = {'Enter your first values like [x1 x2 ... xn]:'};
                value = str2num(char(inputdlg(enterValue,dlg_title,num_lines,def)));
                if (isempty(char(value)))
                    errordlg('Initial values hasn''t entered');
                else
                    enterFunc = {'Enter your function:'};
                    x = sym('x', [1,n]);
                    for i= 1:n
                        F(i) = inputdlg(enterFunc,dlg_title,num_lines,def);
                        while (isempty(char(F(i))))
                            waitfor(warndlg('Please enter function'))
                            F(i) = inputdlg(enterFunc,dlg_title,num_lines,def);
                        end
                    end
                    f = sym(F');
                    ans  = GenerelizedNewtonRaphson(value,f,step,p);
                    result ='';
                    for i = 1:n
                        result = strcat(result,'x',num2str(i),{' '}, '=',{' '}, char(ans(i)), {'   '});
                    end
                end
            end
    end
    if (~strcmp(result,''))
        set(handles.resultTxt,'string',char((result)));
        set(handles.hList,'String',steps(1:sIndex));
    end
end

%hList = uicontrol('Style','text','Position',[100 100 200 200]);
%set(handles.hList,'String',{'Line 1'; 'Line 2'});  % Displays 2 lines, one string each




% --- Executes on slider movement.
function slider_Callback(hObject, eventdata, handles)
global steps
global sIndex
% hObject    handle to slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
%vec = rand(200,1);  % Column array of 3 random values
%steps
%size(steps)
%sIndex
aa = get(handles.slider,'value');
if (sIndex>11)
set(handles.hList,'String',steps(1+(1-aa)*(sIndex-11):(1-aa)*(sIndex-11)+11));  % Displays 3 lines, one number per line
else
    set(handles.hList,'String',steps(1:sIndex));
end

% --- Executes during object creation, after setting all properties.
function slider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in BisectionRBox.
function BisectionRBox_Callback(hObject, eventdata, handles)
% hObject    handle to BisectionRBox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hint: get(hObject,'Value') returns toggle state of BisectionRBox


% --- Executes on button press in FalsePositionRBox.
function FalsePositionRBox_Callback(hObject, eventdata, handles)
% hObject    handle to FalsePositionRBox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of FalsePositionRBox


% --- Executes on button press in SecantRBox.
function SecantRBox_Callback(hObject, eventdata, handles)
% hObject    handle to SecantRBox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of SecantRBox


% --- Executes on button press in NewtonRaphsonRBox.
function NewtonRaphsonRBox_Callback(hObject, eventdata, handles)
% hObject    handle to NewtonRaphsonRBox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of NewtonRaphsonRBox


% --- Executes on button press in FixedPointRBox.
function FixedPointRBox_Callback(hObject, eventdata, handles)
% hObject    handle to FixedPointRBox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of FixedPointRBox



function resultEdit_Callback(hObject, eventdata, handles)
% hObject    handle to resultEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of resultEdit as text
%        str2double(get(hObject,'String')) returns contents of resultEdit as a double


% --- Executes during object creation, after setting all properties.
function resultEdit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to resultEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close;
chapter1;


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close;
mahasebatProject;

% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close;
Chapter3;


% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on slider movement.
function slider6_Callback(hObject, eventdata, handles)
% hObject    handle to slider6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
