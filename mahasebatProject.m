function varargout = mahasebatProject(varargin)
% MAHASEBATPROJECT MATLAB code for mahasebatProject.fig
%      MAHASEBATPROJECT, by itself, creates a new MAHASEBATPROJECT or raises the existing
%      singleton*.
%
%      H = MAHASEBATPROJECT returns the handle to a new MAHASEBATPROJECT or the handle to
%      the existing singleton*.
%
%      MAHASEBATPROJECT('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MAHASEBATPROJECT.M with the given input arguments.
%
%      MAHASEBATPROJECT('Property','Value',...) creates a new MAHASEBATPROJECT or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before mahasebatProject_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to mahasebatProject_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help mahasebatProject

% Last Modified by GUIDE v2.5 07-Dec-2016 23:11:18

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @mahasebatProject_OpeningFcn, ...
                   'gui_OutputFcn',  @mahasebatProject_OutputFcn, ...
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


% --- Executes just before mahasebatProject is made visible.
function mahasebatProject_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to mahasebatProject (see VARARGIN)

% Choose default command line output for mahasebatProject
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

imshow('chapter0.png');
% UIWAIT makes mahasebatProject wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = mahasebatProject_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on button press in pushbutton15.
function pushbutton15_Callback(hObject, eventdata, handles)
global p;
% hObject    handle to pushbutton15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global chapter;
 x = str2num(get(handles.edit1,'String')); %edit1 being Tag of ur edit box
 if isempty(x)
     msgbox('Enter valid n','Error','error');
 else
  p=x;
switch chapter
    case 1
       close;
    chapter1;
    case 2
        close;
        Chapter2;
    case 3
        close;
        Chapter3;
    case 4
        close;
        Chapter4;
    case 5
        close;
        chapter5;
    case 6
        close;
        Chapter6;
end
 end
% --- Executes on button press in chapter2button.
function chapter2button_Callback(hObject, eventdata, handles)
% hObject    handle to chapter2button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
imshow('chapter2.png');
global chapter;
chapter = 2;
setcolor(handles);
set(handles.chapter2button,'backgroundColor',[1 0 0.6]);


% --- Executes on button press in chapter1button.
function chapter1button_Callback(hObject, eventdata, handles)
% hObject    handle to chapter1button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
imshow('chapter1.png');
global chapter;
chapter=1;
setcolor(handles);
set(handles.chapter1button,'backgroundColor',[1 0 0.6]);


function setcolor(handles)
set(handles.chapter1button,'backgroundColor',[1 0.4 1]);
set(handles.chapter2button,'backgroundColor',[1 0.4 1]);
set(handles.chapter3button,'backgroundColor',[1 0.4 1]);
set(handles.chapter4button,'backgroundColor',[1 0.4 1]);
set(handles.chapter5button,'backgroundColor',[1 0.4 1]);
set(handles.chapter6button,'backgroundColor',[1 0.4 1]);


% --- Executes on button press in chapter6button.
function chapter6button_Callback(hObject, eventdata, handles)
% hObject    handle to chapter6button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
imshow('chapter6.png');
global chapter;
chapter = 6;
setcolor(handles);
set(handles.chapter6button,'backgroundColor',[1 0 0.6]);



% --- Executes on button press in chapter5button.
function chapter5button_Callback(hObject, eventdata, handles)
% hObject    handle to chapter5button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
imshow('chapter5.png');
global chapter;
chapter = 5;
setcolor(handles);
set(handles.chapter5button,'backgroundColor',[1 0 0.6]);


% --- Executes on button press in chapter3button.
function chapter3button_Callback(hObject, eventdata, handles)
% hObject    handle to chapter3button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
imshow('chapter3.png');
global chapter;
chapter = 3;
setcolor(handles);
set(handles.chapter3button,'backgroundColor',[1 0 0.6]');


% --- Executes on button press in chapter4button.
function chapter4button_Callback(hObject, eventdata, handles)
% hObject    handle to chapter4button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
imshow('chapter4.png');
global chapter;
chapter = 4;
setcolor(handles);
set(handles.chapter4button,'backgroundColor',[1 0 0.6]);


% --- Executes on button press in pushbutton16.
function pushbutton16_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close all;


% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over chapter6button.
function chapter6button_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to chapter6button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
