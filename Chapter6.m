function varargout = Chapter6(varargin)
% CHAPTER6 MATLAB code for Chapter6.fig
%      CHAPTER6, by itself, creates a new CHAPTER6 or raises the existing
%      singleton*.
%
%      H = CHAPTER6 returns the handle to a new CHAPTER6 or the handle to
%      the existing singleton*.
%
%      CHAPTER6('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CHAPTER6.M with the given input arguments.
%
%      CHAPTER6('Property','Value',...) creates a new CHAPTER6 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Chapter6_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Chapter6_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Chapter6

% Last Modified by GUIDE v2.5 05-Jan-2017 16:40:12

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Chapter6_OpeningFcn, ...
                   'gui_OutputFcn',  @Chapter6_OutputFcn, ...
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


% --- Executes just before Chapter6 is made visible.
function Chapter6_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Chapter6 (see VARARGIN)

% Choose default command line output for Chapter6
format long g
handles.output = hObject;
ah = axes('unit', 'normalized', 'position', [0 0 1 1]);
% import the background image and show it on the axes
 global count
 count = 0;

imagesc(imread('background.jpg'));
% prevent plotting over the background and turn the axis off
 
set(ah,'handlevisibility','off','visible','off')
% making sure the background is behind all the other uicontrols
 
uistack(ah, 'bottom');
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Chapter6 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Chapter6_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function N_Callback(hObject, eventdata, handles)
% hObject    handle to N (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of N as text
%        str2double(get(hObject,'String')) returns contents of N as a double


% --- Executes during object creation, after setting all properties.
function N_CreateFcn(hObject, eventdata, handles)
% hObject    handle to N (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function equ_Callback(hObject, eventdata, handles)
% hObject    handle to equ (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of equ as text
%        str2double(get(hObject,'String')) returns contents of equ as a double


% --- Executes during object creation, after setting all properties.
function equ_CreateFcn(hObject, eventdata, handles)
% hObject    handle to equ (see GCBO)
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
global n count va equtext B A
ns = get(handles.N,'String');
flag = 1;
if count == 0
if isempty(ns)
    warndlg('You Must Enter Number of Equtions. ');
    flag = 0;
elseif isempty(str2num(ns))
    warndlg('Number of Equtions is not Valid . ');
    flag = 0;
elseif str2num(ns) < 1
    warndlg('Equation number must be greater than 0.');
    flag = 0;
end
n=str2num(ns);
va = sym('a', [1 n]);
equtext = cell(n+1,1);
equtext=cellstr('Equations Are:');
A = zeros(n,n);
B = zeros(n,1);
end
if flag
    if count ~= n
        str = get(handles.equ,'string');
        if isempty(str)
            warndlg('Enter Equation!!');
        else
            count = count + 1;
            equtext(count+1)={str};
            [A(count,:),B(count)]=equationsToMatrix(sym(str),va);
            
        end
        set(handles.equ,'string','');
    end
    if count == n
        set(handles.f,'String',equtext);
        set(handles.f,'visible','on');
    end
        
end
    

    
function [flag, step, X0] = inputPermission( answer)
global B
flag = 0;
step = 0;
X0 = [];
temp=answer(2);
s = answer{1};
if isempty(s) || isempty(temp)
    warndlg('We need step and initial guess.');
elseif isempty(str2num(s)) || isempty(str2num(temp{:}))
    warndlg('Input values must be NUMBER !!.');
else
step = str2num(s);
X0 = str2num(temp{:})';
[o1,i1]=size(X0);
[o2,i2]=size(B);
if o1 ~= o2 || i1 ~= i2 || step < 1
         warndlg('Input values are not correct.');
else 
    flag = 1;
end
end


% --- Executes on button press in calculate.
function calculate_Callback(hObject, eventdata, handles)
% hObject    handle to calculate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global count n A B steps p
p = 4;
show = 0;
method = get(get(handles.method,'SelectedObject'),'Tag');
if count ~=  n && ~strcmp(method,'eigen') && ~strcmp(method,'power')
    warndlg('Enter Enough Equtions!!!');
elseif  ~strcmp(method,'eigen') && ~strcmp(method,'power') && det(A) == 0 
    warndlg('Determinant of this matrix is zero.');
else
    switch method
        case 'cramer',
            X=Cramer(A,B);
            show = 1;
        case 'elimination', 
            X = GausseElimination( A,B );
            show = 1;
        case 'doolittle',
            X = LU_Doolittle( A,B );
            show =1;
        case 'cholesky'
            if ~isSymetric(A)
                warndlg('This Matrix is not symmetric or definite positive, so is not appropriate for this method!!!.');
            else    
                show = 1;
                X = LU_Doolittle( A,B );
            end
        case 'crout',
            X = LU_Crout( A,B );
            show =1 ;
        case 'jacobi',
            answer=inputdlg({'Number of steps:','Initial guess:(Enter space-separated numbers'},'Jocobi',1);
            [flag,step,X0]= inputPermission(answer);
            if flag
            if Check(A)
                X = IndirectMethods(1,A,B,X0,step);
            else
                [a,b]=Diagnol(A,B);
                X = IndirectMethods(1,a,b,X0,step);
            end
            show = 1;
            end
        case 'seidel',
            answer=inputdlg({'Number of steps:','Initial guess:(Enter space-separated numbers'},'Guass Seidel',1); 
            
            [flag,step,X0]= inputPermission(answer);
            if flag
            if Check(A)
                X = IndirectMethods(2,A,B,X0,step);
            else
                [a,b]=Diagnol(A,B);
                X = IndirectMethods(2,a,b,X0,step);
            end
            show = 1;
            end
        case 'eigen',
            answer = char(inputdlg('Enter Matrix like [1,2;2,1]','Matrix',1));
            A = str2num(answer(:,:));
            
            [o,u]=size(A);
            B=zeros(o,1);
            if det(A) == 0
                warndlg('Determinant of this matrix is zero.');
            elseif o ~= u
                warndlg('This is not a square matrix..');
            else
                show = 1;
                [L,V] = Eigen( A );
            end
        case 'power',
            answer = char(inputdlg('Enter Matrix like [1,2;2,1]','Matrix',1));
            A = str2num(answer(:,:));
            [o,u]=size(A);
            B=zeros(o,1);
            if det(A) == 0
                warndlg('Determinant of this matrix is zero..');
            elseif o ~= u
                warndlg('This is not a square matrix..');
            else
            answer=inputdlg({'Number of steps:','Initial guess:(Enter space-separated numbers'},'Power Method',1);
            [flag,step,X0]= inputPermission(answer);
            if flag
            L = Power( A,X0,step );
            show = 1;
            end
            end
            
    end
    if show
    set(handles.result,'string',steps);
    if strcmp(method,'cramer') || strcmp(method,'elimination') || strcmp(method, 'doolittle')  || strcmp(method, 'crout') || strcmp(method,'cholesky') || strcmp(method,'crout') || strcmp(method,'seidel')
            set(handles.xtext,'visible','on');
            set(handles.x,'visible','on');
            set(handles.x,'string',num2str(X,p));
            set(handles.panel,'visible','on');
    end
    if strcmp(method,'eigen') 
            set(handles.ytext,'visible','on');
            set(handles.x,'visible','on');
            set(handles.xtext,'visible','off');
            set(handles.x,'string',num2str(L,p));
            set(handles.vtext,'visible','on');
            set(handles.v,'visible','on');
            set(handles.v,'string',num2str(V,p));
            set(handles.panel,'visible','on');
    end
    if strcmp(method,'power')
            set(handles.xtext,'visible','off');
            set(handles.x,'visible','off');
            set(handles.vtext,'visible','off');
            set(handles.v,'visible','off');
            set(handles.ytext,'visible','on');
            set(handles.x,'visible','on');
            set(handles.x,'string',num2str(L,p));
            set(handles.panel,'visible','on');
    end
    end
    
end





% --- Executes on button press in reset.
function reset_Callback(hObject, eventdata, handles)
% hObject    handle to reset (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global count
count = 0;

set(handles.N,'string','');
set(handles.equ,'string','');
set(handles.f,'visible','off');
set(handles.panel,'visible','off');


function result_Callback(hObject, eventdata, handles)
% hObject    handle to result (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of result as text
%        str2double(get(hObject,'String')) returns contents of result as a double


% --- Executes during object creation, after setting all properties.
function result_CreateFcn(hObject, eventdata, handles)
% hObject    handle to result (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function x_Callback(hObject, eventdata, handles)
% hObject    handle to x (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of x as text
%        str2double(get(hObject,'String')) returns contents of x as a double


% --- Executes during object creation, after setting all properties.
function x_CreateFcn(hObject, eventdata, handles)
% hObject    handle to x (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function y_Callback(hObject, eventdata, handles)
% hObject    handle to y (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of y as text
%        str2double(get(hObject,'String')) returns contents of y as a double


% --- Executes during object creation, after setting all properties.
function y_CreateFcn(hObject, eventdata, handles)
% hObject    handle to y (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function v_Callback(hObject, eventdata, handles)
% hObject    handle to v (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of v as text
%        str2double(get(hObject,'String')) returns contents of v as a double


% --- Executes during object creation, after setting all properties.
function v_CreateFcn(hObject, eventdata, handles)
% hObject    handle to v (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function f_Callback(hObject, eventdata, handles)
% hObject    handle to f (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of f as text
%        str2double(get(hObject,'String')) returns contents of f as a double


% --- Executes during object creation, after setting all properties.
function f_CreateFcn(hObject, eventdata, handles)
% hObject    handle to f (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton12.
function pushbutton12_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close;
Chapter1;


% --- Executes on button press in pushbutton13.
function pushbutton13_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close;
mahasebatProject;


% --- Executes on button press in pushbutton14.
function pushbutton14_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close;
Chapter6;


% --- Executes on button press in pushbutton15.
function pushbutton15_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close;
Chapter5;


% --- Executes on button press in pushbutton16.
function pushbutton16_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close;
Chapter4;


% --- Executes on button press in pushbutton17.
function pushbutton17_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton17 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close;
Chapter3;


% --- Executes on button press in pushbutton18.
function pushbutton18_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton18 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close;
Chapter2;
