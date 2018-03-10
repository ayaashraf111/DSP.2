function varargout = g(varargin)
% G MATLAB code for g.fig
%      G, by itself, creates a new G or raises the existing
%      singleton*.
%
%      H = G returns the handle to a new G or the handle to
%      the existing singleton*.
%
%      G('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in G.M with the given input arguments.
%
%      G('Property','Value',...) creates a new G or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before g_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to g_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help g

% Last Modified by GUIDE v2.5 10-Mar-2018 20:05:04

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @g_OpeningFcn, ...
                   'gui_OutputFcn',  @g_OutputFcn, ...
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


% --- Executes just before g is made visible.
function g_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to g (see VARARGIN)

% Choose default command line output for g
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes g wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = g_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in clear1.
function clear1_Callback(hObject, eventdata, handles)
% hObject    handle to clear1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
cla(handles.axes1,'reset');


% --- Executes on button press in image1.
function image1_Callback(hObject, eventdata, handles)
% hObject    handle to image1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
axes(handles.axes1)
cla(handles.axes1);
Im1=handles.x1 ;
inputsize=str2num(get(handles.size,'String'));
Ima1=imresize(Im1,[inputsize]);
Imag1=rgb2gray(Ima1);
handles.y1=Imag1;
imshow(handles.y1);
guidata(hObject,handles) ;




function size_Callback(hObject, eventdata, handles)
% hObject    handle to size (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'String') returns contents of size as text
%        str2double(get(hObject,'String')) returns contents of size as a double
inputsize=str2num(get(handles.size,'String'));
 assignin('base','inputsize',inputsize) ;



% --- Executes during object creation, after setting all properties.
function size_CreateFcn(hObject, eventdata, handles)
% hObject    handle to size (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in browse1.
function browse1_Callback(hObject, eventdata, handles)
% hObject    handle to browse1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename pathname] = uigetfile({'*.jpg';'*.bmp'},'File Selector');
image1 = strcat(pathname, filename);
axes(handles.axes1);
imshow(image1);
handles.x1=im2double(imread(image1));
guidata(hObject,handles) ;




function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in restruct.
function restruct_Callback(hObject, eventdata, handles)
% hObject    handle to restruct (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Recompute frequency responses by swapping the phases
out1 = handles.m1 .* exp(1i*handles.pha2);
out2 = handles.m2 .* exp(1i*handles.pha1);

% Find the inverse images
inve1 = real(ifft2(out1));
inve2 = real(ifft2(out2));

% Show the images
axes(handles.axes3)
cla(handles.axes3);
imshow(inve1);
axes(handles.axes4)
cla(handles.axes4);
imshow(inve2);
guidata(hObject,handles) ;


% --- Executes on button press in clear3.
function clear3_Callback(hObject, eventdata, handles)
% hObject    handle to clear3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
cla(handles.axes3,'reset');


% --- Executes on button press in clear4.
function clear4_Callback(hObject, eventdata, handles)
% hObject    handle to clear4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
cla(handles.axes4,'reset');


% --- Executes on button press in image2.
function image2_Callback(hObject, eventdata, handles)
% hObject    handle to image2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
axes(handles.axes2)
cla(handles.axes2);
Im2=handles.x2 ;
inputsize=str2num(get(handles.size,'String'));
Ima1=imresize(Im2,[inputsize]);
Imag2=rgb2gray(Ima1);
handles.y2=Imag2;
imshow(handles.y2);
guidata(hObject,handles) ;



% --- Executes on button press in showph1.
function showph1_Callback(hObject, eventdata, handles)
% hObject    handle to showph1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
axes(handles.axes4)
cla(handles.axes4);
imshow(handles.pha1);

% --- Executes on button press in showph2.
function showph2_Callback(hObject, eventdata, handles)
% hObject    handle to showph2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
axes(handles.axes4)
cla(handles.axes4);
imshow(handles.pha2);



% --- Executes on button press in browse2.
function browse2_Callback(hObject, eventdata, handles)
% hObject    handle to browse2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename pathname] = uigetfile({'*.jpg';'*.bmp'},'File Selector');
image2 = strcat(pathname, filename);
axes(handles.axes2);
imshow(image2);
handles.x2=im2double(imread(image2)); ;
guidata(hObject,handles) ;


% --- Executes on button press in clear2.
function clear2_Callback(hObject, eventdata, handles)
% hObject    handle to clear2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
cla(handles.axes2,'reset');


% --- Executes on button press in show1.
function show1_Callback(hObject, eventdata, handles)
% hObject    handle to show1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
inputsize=str2num(get(handles.size,'String'));
% Take the FFT
Image1_FFT=fft2(handles.y1 );
% NEW - Find the magnitudes and phase responses
handles.m1 = abs(Image1_FFT);
handles.pha1 = angle(Image1_FFT);
%LOG 
Mag1=log(fftshift(handles.m1));
axes(handles.axes3)
cla(handles.axes3);
 imagesc(Mag1);
 guidata(hObject,handles) ;



% --- Executes on button press in show2.
function show2_Callback(hObject, eventdata, handles)
% hObject    handle to show2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
inputsize=str2num(get(handles.size,'String'));
% Take the FFT
Image2_FFT=fft2(handles.y2);
% NEW - Find the magnitudes and phase responses
handles.m2 = abs(Image2_FFT);
handles.pha2 = angle(Image2_FFT);
%LOG 
Mag2=log(fftshift(handles.m2));
axes(handles.axes3)
cla(handles.axes3);
 imagesc(Mag2);
 guidata(hObject,handles) ;
