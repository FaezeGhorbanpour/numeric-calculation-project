function varargout = chapter5(varargin)
% CHAPTER5 MATLAB code for chapter5.fig
%      CHAPTER5, by itself, creates a new CHAPTER5 or raises the existing
%      singleton*.
%
%      H = CHAPTER5 returns the handle to a new CHAPTER5 or the handle to
%      the existing singleton*.
%
%      CHAPTER5('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CHAPTER5.M with the given input arguments.
%
%      CHAPTER5('Property','Value',...) creates a new CHAPTER5 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before chapter5_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to chapter5_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help chapter5

% Last Modified by GUIDE v2.5 05-Jan-2017 21:13:39

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @chapter5_OpeningFcn, ...
                   'gui_OutputFcn',  @chapter5_OutputFcn, ...
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


% --- Executes just before chapter5 is made visible.
function chapter5_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to chapter5 (see VARARGIN)

% Choose default command line output for chapter5

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

% UIWAIT makes chapter5 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = chapter5_OutputFcn(hObject, eventdata, handles) 
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
close;
chapter1;


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close;
mahasebatProject;


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close;
Chapter6;


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close;
chapter5;


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close;
Chapter4;


% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close;
Chapter3;


% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close;
Chapter2;






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



function hEdit_Callback(hObject, eventdata, handles)
% hObject    handle to hEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of hEdit as text
%        str2double(get(hObject,'String')) returns contents of hEdit as a double


% --- Executes during object creation, after setting all properties.
function hEdit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to hEdit (see GCBO)
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



function x0Edit_Callback(hObject, eventdata, handles)
% hObject    handle to x0Edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of x0Edit as text
%        str2double(get(hObject,'String')) returns contents of x0Edit as a double


% --- Executes during object creation, after setting all properties.
function x0Edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to x0Edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function y0Edit_Callback(hObject, eventdata, handles)
% hObject    handle to y0Edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of y0Edit as text
%        str2double(get(hObject,'String')) returns contents of y0Edit as a double


% --- Executes during object creation, after setting all properties.
function y0Edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to y0Edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in calculatebutton.
function calculatebutton_Callback(hObject, eventdata, handles)
format long
% hObject    handle to calculatebutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
m = get(handles.methodChoicePnl,'SelectedObject');
method = get(m,'string');
z0=1;
step = str2num(get(handles.stepEdit,'string'));
x0= str2num(get(handles.x0Edit,'string'));
y0 = str2num(get(handles.y0Edit,'string'));
z0 = str2num(get(handles.z0Edit,'string'));
h = str2num(get(handles.hEdit,'string'));
func= get(handles.funcEdit,'string');
funcg=get(handles.funcgEdit,'string');
n=str2num(get(handles.nEdit,'string'));

x0=R(x0);
y0=R(y0);
%z0=R(z0);
h =R(h);

g = inline(funcg, 'x', 'y','z');
order=1;
switch method
    case 'Taylor'
        f = inline(func, 'x', 'y');
          syms x y
         s = sym(func);
    result = Taylor(s,x0,y0,h,step,n);
    case 'Euler'
        f = inline(func, 'x', 'y');
            syms x y
            s = sym(func);
            result = Euler(s,x0,y0,h,step)
    case 'Modied Euler'
        f = inline(func, 'x', 'y');
        result = Modified_Euler(f,x0, y0,h,step)
    case 'Mid-Point Runge-Kutta'
        f = inline(func, 'x', 'y');
        result = Mid_Point(f,x0, y0,h,step)
    case '3rd Order Runge-Kutta'
        f = inline(func, 'x', 'y');
        result =Runge_Kutta3(f,x0, y0,h,step)
        case '4th Order Runge-Kutta'
            f = inline(func, 'x', 'y');
        result = Runge_Kutta4(f,x0, y0,h,step)
        f = inline(func, 'x', 'y');
         case '3rd Order Adams-Moulton'
             f = inline(func, 'x', 'y');
        result = Adams3(f,x0, y0,h,step)
        f = inline(func, 'x', 'y');
         case '4th Order Adams-Moulton'
             f = inline(func, 'x', 'y');
          syms x y
            s = sym(func);
        result =  Adams4(s,f,x0, y0,h,step)
         case '2nd order D.E By Euler method'
             f = inline(func, 'x', 'y','z');
        [result1,result2] =secondEuler(f,g,x0, y0,z0,h,step)
        order=2;
         case '2nd order D.E By Runge-Kutta'
             f = inline(func, 'x', 'y','z');
        [result1,result2] = secondRung_Kutta(f,g,x0, y0,z0,h,step)
        order=2;
end
x=x0:h:x0+h*step;
for i=1:step+1
    if(order==1)
        x(i)=R(x(i));
        result(i)=R(result(i));
          steps(i) = cellstr(strcat('Step',num2str(i-1),'    :    ','y(',num2str(x(i)),')  =  ',num2str(result(i))));
    end  
  if(order==2)
              x(i)=R(x(i));
        result1(i)=R(result1(i));
        result2(i)=R(result2(i));
          steps(i) =  cellstr(strcat('Step',num2str(i-1),'    :    ','y(',num2str(x(i)),')  =  ',num2str(result1(i)),'     z(',num2str(x(i)),')  =  ',num2str(result2(i))));
    end  
    end
set(handles.stepsTxt,'String',steps(1:step+1));


function funcgEdit_Callback(hObject, eventdata, handles)
% hObject    handle to funcgEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of funcgEdit as text
%        str2double(get(hObject,'String')) returns contents of funcgEdit as a double


% --- Executes during object creation, after setting all properties.
function funcgEdit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to funcgEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


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


% --- Executes on button press in radiobutton1.
function radiobutton1_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.nEdit,'visible','on');
set(handles.ntext,'visible','on');
set(handles.funcgEdit,'visible','off');
set(handles.gtext,'visible','off');
set(handles.z0Edit,'visible','off');
set(handles.z0text,'visible','off');
% Hint: get(hObject,'Value') returns toggle state of radiobutton1


% --- Executes on button press in radiobutton2.
function radiobutton2_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton2
set(handles.nEdit,'visible','off');
set(handles.ntext,'visible','off');
set(handles.funcgEdit,'visible','off');
set(handles.gtext,'visible','off');
set(handles.z0Edit,'visible','off');
set(handles.z0text,'visible','off');


% --- Executes on button press in radiobutton3.
function radiobutton3_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.nEdit,'visible','off');
set(handles.ntext,'visible','off');
set(handles.funcgEdit,'visible','off');
set(handles.gtext,'visible','off');
set(handles.z0Edit,'visible','off');
set(handles.z0text,'visible','off');
% Hint: get(hObject,'Value') returns toggle state of radiobutton3


% --- Executes on button press in radiobutton5.
function radiobutton5_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.nEdit,'visible','off');
set(handles.ntext,'visible','off');
set(handles.funcgEdit,'visible','off');
set(handles.gtext,'visible','off');
set(handles.z0Edit,'visible','off');
set(handles.z0text,'visible','off');
% Hint: get(hObject,'Value') returns toggle state of radiobutton5


% --- Executes on button press in radiobutton4.
function radiobutton4_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.nEdit,'visible','off');
set(handles.ntext,'visible','off');
set(handles.funcgEdit,'visible','off');
set(handles.gtext,'visible','off');
set(handles.z0Edit,'visible','off');
set(handles.z0text,'visible','off');
% Hint: get(hObject,'Value') returns toggle state of radiobutton4


% --- Executes on button press in radiobutton6.
function radiobutton6_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.nEdit,'visible','off');
set(handles.ntext,'visible','off');
set(handles.funcgEdit,'visible','off');
set(handles.gtext,'visible','off');
set(handles.z0Edit,'visible','off');
set(handles.z0text,'visible','off');
% Hint: get(hObject,'Value') returns toggle state of radiobutton6


% --- Executes on button press in radiobutton8.
function radiobutton8_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.nEdit,'visible','off');
set(handles.ntext,'visible','off');
set(handles.funcgEdit,'visible','off');
set(handles.gtext,'visible','off');
set(handles.z0Edit,'visible','off');
set(handles.z0text,'visible','off');
% Hint: get(hObject,'Value') returns toggle state of radiobutton8


% --- Executes on button press in radiobutton7.
function radiobutton7_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.nEdit,'visible','off');
set(handles.ntext,'visible','off');
set(handles.funcgEdit,'visible','off');
set(handles.gtext,'visible','off');
set(handles.z0Edit,'visible','off');
set(handles.z0text,'visible','off');
% Hint: get(hObject,'Value') returns toggle state of radiobutton7


% --- Executes on button press in radiobutton9.
function radiobutton9_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.nEdit,'visible','off');
set(handles.ntext,'visible','off');
set(handles.funcgEdit,'visible','on');
set(handles.gtext,'visible','on');
set(handles.z0Edit,'visible','on');
set(handles.z0text,'visible','on');
% Hint: get(hObject,'Value') returns toggle state of radiobutton9


% --- Executes on button press in radiobutton10.
function radiobutton10_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.nEdit,'visible','off');
set(handles.ntext,'visible','off');
set(handles.funcgEdit,'visible','on');
set(handles.gtext,'visible','on');
set(handles.z0Edit,'visible','on');
set(handles.z0text,'visible','on');
% Hint: get(hObject,'Value') returns toggle state of radiobutton10



function funcEdit_Callback(hObject, eventdata, handles)
% hObject    handle to funcEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of funcEdit as text
%        str2double(get(hObject,'String')) returns contents of funcEdit as a double



function edit14_Callback(hObject, eventdata, handles)
% hObject    handle to edit14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit14 as text
%        str2double(get(hObject,'String')) returns contents of edit14 as a double


% --- Executes during object creation, after setting all properties.
function edit14_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit15_Callback(hObject, eventdata, handles)
% hObject    handle to edit15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit15 as text
%        str2double(get(hObject,'String')) returns contents of edit15 as a double


% --- Executes during object creation, after setting all properties.
function edit15_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function z0Edit_Callback(hObject, eventdata, handles)
% hObject    handle to z0Edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of z0Edit as text
%        str2double(get(hObject,'String')) returns contents of z0Edit as a double


% --- Executes during object creation, after setting all properties.
function z0Edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to z0Edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
