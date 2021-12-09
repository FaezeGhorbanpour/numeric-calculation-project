function varargout = Chapter4(varargin)
digitsOld = digits(4);
% CHAPTER4 MATLAB code for Chapter4.fig
%      CHAPTER4, by itself, creates a new CHAPTER4 or raises the existing
%      singleton*.
%
%      H = CHAPTER4 returns the handle to a new CHAPTER4 or the handle to
%      the existing singleton*.
%
%      CHAPTER4('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CHAPTER4.M with the given input arguments.
%
%      CHAPTER4('Property','Value',...) creates a new CHAPTER4 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Chapter4_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Chapter4_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Chapter4

% Last Modified by GUIDE v2.5 29-Dec-2016 20:50:42

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Chapter4_OpeningFcn, ...
                   'gui_OutputFcn',  @Chapter4_OutputFcn, ...
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


% --- Executes just before Chapter4 is made visible.
function Chapter4_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Chapter4 (see VARARGIN)
movegui('center') ;
clear global steps
clc
global steps
global sIndex
sIndex =1;
steps = cell(100,1);
% Choose default command line output for Chapter4
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

% UIWAIT makes Chapter4 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Chapter4_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close;
Chapter1;


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
close;
Chapter6;


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close;
Chapter5;

% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close;
Chapter4;

% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close;
Chapter3;

function pushbutton8_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close;
Chapter2;

% --- Executes on button press in okBtn.
function okBtn_Callback(hObject, eventdata, handles)
% hObject    handle to okBtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
clear global steps
clc
global steps
global sIndex
sIndex = 1;
steps = cell(100,1);
global p ;
m = get(handles.ChoicePnl,'SelectedObject');
method = get(m,'string');
func = get(handles.funcEdit,'string');
h = str2num(get(handles.hEdit,'string'));
dlg_title = 'input';
num_lines = 1;
def ={'',''};
if (strcmp(method,'Integration'))
    enterValue = {'Enter interval like [source dest]:'};
    value = str2num(char(inputdlg(enterValue,dlg_title,num_lines,def)));
    if (isempty(char(value)))
    errordlg('Initial values hasn''t entered');
    else
        choicei = menu('Choose the method:' ,'Trapezoidal','Simpson 1/3','Simpson 3/8','Romberg','Gauss Legendre');
        switch choicei
            case 1
                result = Trapezoidal(func,value,h);
                ezplot(func, value), hold on
                f = inline (func,'x');
                x2 = linspace(value(1),value(2));
                y2 = f(x2);
                plot(x2, y2, 'g','LineWidth',2);
                x = (value(1):h:value(2));
                y =f(x);
                hold on
                z = size(x);
                xverts = [x(1:end-1);x(1:end-1);x(2:end);x(2:end)];
                yverts = [zeros(1,z(2)-1);y(1:end-1);y(2:end);zeros(1,z(2)-1)];
                hold on
                z= patch(xverts,yverts,'c','LineWidth',0.5);
                hold off
            case 2
                result = Simpson13(func,value,h);
                x = (value(1):h:value(2));
                f = inline (func,'x')
                y=f(x);
                x1 = linspace(value(1),value(2));
                y1 = f(x1);
                plot (x1,y1,'r')
                z= size(x);
                %hold on
                for i=1:2:z(2)-2
                    hold on
                    g= vpa(polynomial2(x(i:i+2),y(i:i+2)))
                    w = [x(i) , x(i+2)];
                   ezplot(g, w); hold on
                    %plot(x,f)
                    %hold on
                end
                g= vpa(polynomial2(x(i:i+2),y(i:i+2)))
                    w = [x(i) , x(i+2)];
                   ezplot(g, w); hold on
                xlim([min(x),max(x)])

                ylim([min(y) max(y)])
                hold on
                area(x1, max(y1, 0), 0, 'EdgeColor', 'none', 'FaceColor', [0 0.8 0])
                area(x1, min(y1, 0),0, 'EdgeColor', 'none', 'FaceColor', [0 0.8 0])  
                hold off
                
            case 3
                result = Simpson38(func,value,h);
                x = (value(1):h:value(2));
                f = inline (func,'x');
                y=f(x);
                x1 = linspace(value(1),value(2));
                y1 = f(x1);
                plot (x1,y1,'r');
                z= size(x);
                %hold on
                for i=1:2:z(2)-3
                    hold on
                    g= vpa(polynomial3(x(i:i+3),y(i:i+3)));
                    w = [x(i) , x(i+3)];
                   ezplot(g, w); hold on
                    %plot(x,f)
                    %hold on
                end
                g= vpa(polynomial3(x(i:i+3),y(i:i+3)));
                    w = [x(i) , x(i+3)];
                   ezplot(g, w); hold on
                xlim([min(x),max(x)]);

                ylim([min(y) max(y)]);
                hold on
                area(x1, max(y1, 0), 0, 'EdgeColor', 'none', 'FaceColor', [0 0.8 0]);
                area(x1, min(y1, 0),0, 'EdgeColor', 'none', 'FaceColor', [0 0.8 0])  ;
                hold off
            case 4
                functionNum  = {'Enter number of iteration:'};
                n = str2num(char(inputdlg(functionNum,dlg_title,num_lines,def)));
                if (isempty(n))
                    errordlg('Number of iteration hasn''t entered');
                else
                result = Romberg(func,value,n);
                end
            case 5
                functionNum  = {'Enter number of iteration:'};
                n = str2num(char(inputdlg(functionNum,dlg_title,num_lines,def)));
                if (isempty(n))
                    errordlg('Number of iteration hasn''t entered');
                else
                result = GaussLegendre(func,value,n);
                end
        end
    end
elseif (strcmp(method,'Differentiation'))
    pointEnter  = {'Enter point:'};
    point = str2num(char(inputdlg(pointEnter,dlg_title,num_lines,def)));
    if (isempty(point))
        errordlg('point hasn''t entered');
    else
       degreeEnter  = {'Enter degree of differentiation:'};
        d = str2num(char(inputdlg(degreeEnter,dlg_title,num_lines,def)));
        if (isempty(d))
            errordlg('degree of differentiation hasn''t entered');
        else 
            orderEnter  = {'Enter order of error:'};
            o = str2num(char(inputdlg(orderEnter,dlg_title,num_lines,def)));
            if (isempty(o))
                 errordlg('order of error hasn''t entered');
            else 
            [i,u] = BestDerivative( func, point, d, o, h);
            result = strcat(num2str(i),{'     '},num2str(u));
            end
        end
    end
end
if (~strcmp(method,'Differentiation'))
    set(handles.ResultEdit,'string',num2str(R(result)));
else
    set(handles.ResultEdit,'string',(result));
end
set(handles.stepsEdit,'String',steps);


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


% --- Executes on button press in DifferentiationRBtn.
function DifferentiationRBtn_Callback(hObject, eventdata, handles)
% hObject    handle to DifferentiationRBtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.RichardsonRBtn,'Enable','on');
% Hint: get(hObject,'Value') returns toggle state of DifferentiationRBtn


% --- Executes on button press in IntegrationRBtn.
function IntegrationRBtn_Callback(hObject, eventdata, handles)
% hObject    handle to IntegrationRBtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.RichardsonRBtn,'Enable','off');
% Hint: get(hObject,'Value') returns toggle state of IntegrationRBtn



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
