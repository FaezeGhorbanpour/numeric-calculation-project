function varargout = Chapter3(varargin)
% CHAPTER3 MATLAB code for Chapter3.fig
%      CHAPTER3, by itself, creates a new CHAPTER3 or raises the existing
%      singleton*.
%
%      H = CHAPTER3 returns the handle to a new CHAPTER3 or the handle to
%      the existing singleton*.
%
%      CHAPTER3('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CHAPTER3.M with the given input arguments.
%
%      CHAPTER3('Property','Value',...) creates a new CHAPTER3 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Chapter3_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Chapter3_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Chapter3

% Last Modified by GUIDE v2.5 07-Dec-2016 22:06:38

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Chapter3_OpeningFcn, ...
                   'gui_OutputFcn',  @Chapter3_OutputFcn, ...
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


% --- Executes just before Chapter3 is made visible.
function Chapter3_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Chapter3 (see VARARGIN)
clear global found
clear global result
clc
global found
global result
found = 0;
% Choose default command line output for Chapter3
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

% UIWAIT makes Chapter3 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Chapter3_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in InterpolationRBox.
function InterpolationRBox_Callback(hObject, eventdata, handles)
% hObject    handle to InterpolationRBox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of InterpolationRBox


% --- Executes on button press in CurveFittingRBox.
function CurveFittingRBox_Callback(hObject, eventdata, handles)
% hObject    handle to CurveFittingRBox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of CurveFittingRBox


function nEdit_Callback(hObject, eventdata, handles)
% hObject    handle to nEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of nEdit as text
%        str2double(get(hObject,'String')) returns contents of nEdit as a double


% --- Executes during object creation, after setting all properties.
function nEdit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to nEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in OkBtn.
function OkBtn_Callback(hObject, eventdata, handles)
% hObject    handle to OkBtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global found
global result
syms x
choice =0;
choicei = 0;
m = get(handles.choicePnl,'SelectedObject');
method = get(m,'string');
n = str2num(get(handles.nEdit, 'string'));
if isempty(n)
  warndlg('Specify n');
else
X=zeros(n,1);
Y=zeros(n,1);
dlg_title = 'input';
num_lines = 1;
def ={'',''};
if (method == 'Curve fitting')
    choice = menu('Do you want to enter a function?' , 'Yes','No','Choose function');
    if (choice == 1)
    p = {strcat('Enter your function')};
    a = inputdlg(p,dlg_title,num_lines,def);
    elseif (choice == 3)
        choicef = menu('Choose your function?' , 'a0 + a1x','a0 + a1x + a2x^2','a0 + a1x + a2x^2 + a3x^3', 'a/x','a*ln(x) + b','1/(ax+b)','a*(e^b*x)');
    end
else
    choicei = menu('Choose the method:' , 'Lagrange','Newton Divided Differences','Newton Forward Differences','Newton Backward Differences','Newton Forward Centeral Differences', 'Newton Backward Centeral Differences');
end
if (choicei~=0 || strcmp(method,'Curve fitting'))
for i=1:n
    switch method
    case 'Interpolation'
    prompt  = {strcat('Enter X(',num2str(i),') : '),strcat('Enter Y(',num2str(i),') : ')};
    case 'Curve fitting'
        if (choice==1)
        prompt  = {strcat('Enter X(',num2str(i),') : ')};
        else
        prompt  = {strcat('Enter X(',num2str(i),') : '),strcat('Enter Y(',num2str(i),') : ')};
        end
    end
    answer = inputdlg(prompt,dlg_title,num_lines,def);
   % str2num(char(answer(1)))
    X(i) = str2num(char(answer(1)));
    if (strcmp(method, 'Interpolation') || choice == 2 || choice ==3)
    Y(i) = str2num(char(answer(2)));
    end
end
switch choicei
    case 1
        result = LG(n,X,Y);
        found=1;
    case 2
        result = ND(n,X,Y);
        found=1;
    case 3
        result = NB(n,X,Y);
        found=1;
    case 4
        result = NF(n,X,Y);
        found=1;
    case 5
        result = NFC(n,X,Y);
        found=1;
    case 6
        result = NBC(n,X,Y);
        found=1;
end
switch choice
    case 1
        f = sym(a);
        Y = subs(f,x,X);
        result = curveFitting(X,Y);
        found=1;
    case 2
        result = curveFitting(X,Y);
        found=1;
    case 3
        
        switch choicef
            case 1
                result = curve1(X,Y);
                found=1;
            case 2
                result = curve2(X,Y);
                found=1;
            case 3
                result = curve3(X,Y);
                found=1;
            case 4
                result = curve4(X,Y);
                found=1;
            case 5
                result = curve5(X,Y);
                found=1;
            case 6
                result = curve6(X,Y);
                found=1;
            case 7
                result = curve7(X,Y);
                found=1;
        end
end
set(handles.ResultEdit,'string',char(vpa(result)));
w = min(X):max(X);
ezplot(vpa(result),w);
hold on
plot (X,Y,'rd');
hold off
end
end
%result mzsxj

function ResultEdit_Callback(hObject, eventdata, handles)
% hObject    handle to ResultEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ResultEdit as text
%        str2double(get(hObject,'String')) returns contents of ResultEdit as a double


% --- Executes during object creation, after setting all properties.
function ResultEdit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ResultEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function SpointEdit_Callback(hObject, eventdata, handles)
% hObject    handle to SpointEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of SpointEdit as text
%        str2double(get(hObject,'String')) returns contents of SpointEdit as a double


% --- Executes during object creation, after setting all properties.
function SpointEdit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to SpointEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in CalculateBtn.
function CalculateBtn_Callback(hObject, eventdata, handles)
% hObject    handle to CalculateBtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global found
global result
if (found == 0)
        warndlg('You have to find the curve');
else
    syms x
    d = str2num(get(handles.SpointEdit,'string'));
     c  =   subs(result,x,d);
     set (handles.ResultTxt,'string',strcat('f(',num2str(d),')= ',char(vpa(c))));
       
end


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close;
chapter1;


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close;
Chapter2;


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
close;
mahasebatProject;

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


% --- Executes on button press in pushbutton9.
function pushbutton9_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
