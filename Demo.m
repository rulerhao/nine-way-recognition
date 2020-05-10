
function varargout = Demo(varargin)
% DEMO MATLAB code for Demo.fig
%      DEMO, by itself, creates a new DEMO or raises the existing
%      singleton*.
%
%      H = DEMO returns the handle to a new DEMO or the handle to
%      the existing singleton*.
%
%      DEMO('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in DEMO.M with the given input arguments.
%
%      DEMO('Property','Value',...) creates a new DEMO or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Demo_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Demo_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Demo

% Last Modified by GUIDE v2.5 25-Jun-2018 22:25:50

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Demo_OpeningFcn, ...
                   'gui_OutputFcn',  @Demo_OutputFcn, ...
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


% --- Executes just before Demo is made visible.
function Demo_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Demo (see VARARGIN)

% Choose default command line output for Demo
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Demo wait for user response (see UIRESUME)
% uiwait(handles.figure1);

% 讀取 netTransfer
global netTransfer;
load netTransfer.mat;
global FileDir;
FileDir = 'iris';
%global cam;
%cam = webcam(1);

% --- Outputs from this function are returned to the command line.
function varargout = Demo_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

% --- Executes on button press in OpenCamera.
function OpenCamera_Callback(hObject, eventdata, handles)
% hObject    handle to OpenCamera (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global cam;
preview(cam);

% --- Executes on button press in CutImage.
function CutImage_Callback(hObject, eventdata, handles)
% hObject    handle to CutImage (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global cam;
global img;
img = snapshot(cam);

% --- Executes on button press in ShowImage.
function ShowImage_Callback(hObject, eventdata, handles)
% hObject    handle to ShowImage (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global ListBoxCheck;
global FileDir;
im = [FileDir,'\',ListBoxCheck];
axes(handles.ImagePlace);
imshow(im);

% --- Executes on button press in PredictStart.
function PredictStart_Callback(hObject, eventdata, handles)
% hObject    handle to PredictStart (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global netTransfer;
global ImageDS;
global PredLabel;
global probs;
[PredLabel,probs] = classify(netTransfer,ImageDS);

PredLabelStr = cellstr(PredLabel);
set(handles.PredictLabel, 'String', ['結果:',PredLabelStr{1,1}]);

Name{1} = ['土木'];
Name{2} = ['土水'];
Name{3} = ['土金'];
Name{4} = ['木金'];
Name{5} = ['水木'];
Name{6} = ['火木'];
Name{7} = ['火水'];
Name{8} = ['火金'];
Name{9} = ['金水'];
c = categorical({'土木','土水','土金','木金','水木','火木','火水','火金','金水'});
bar(handles.BarGraph,c,probs);


% --- Executes on button press in NormaliztionImage.
function NormaliztionImage_Callback(hObject, eventdata, handles)
% hObject    handle to NormaliztionImage (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global img;
global ImageDS;
global ListBoxCheck;
global FileDir;
img = imread([FileDir,'\',ListBoxCheck]);
cp = FindLocation(img);
After_im = PAExample(img,cp);
After_im = uint8(After_im);
After_im = imresize(After_im,[227 227]);
NewIm(:,:,1) = After_im;
NewIm(:,:,2) = After_im;
NewIm(:,:,3) = After_im;
axes(handles.ImagePlace);
imshow(NewIm);
ImageDS = NewIm;

% --- Executes on button press in CloseCamera.
function CloseCamera_Callback(hObject, eventdata, handles)
% hObject    handle to CloseCamera (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global cam;
closePreview(cam);
clear('cam');

% --- Executes on button press in LoadCamera.
function LoadCamera_Callback(hObject, eventdata, handles)
% hObject    handle to LoadCamera (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% 讀取相機


% --- Executes on selection change in ListAllFile.
function ListAllFile_Callback(hObject, eventdata, handles)
% hObject    handle to ListAllFile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns ListAllFile contents as cell array
%        contents{get(hObject,'Value')} returns selected item from ListAllFile
global ListBoxCheck;
ListBoxString = get(handles.ListAllFile,'String');
ListBoxValue = get(handles.ListAllFile,'Value');
ListBoxCheck = ListBoxString{ListBoxValue};

% --- Executes during object creation, after setting all properties.
function ListAllFile_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ListAllFile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on button press in RefreshFile.
function RefreshFile_Callback(hObject, eventdata, handles)
% hObject    handle to RefreshFile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global AllImage;
global FileDir;
AllImage = dir([FileDir,'\*.jpg']); %get files
set(handles.ListAllFile,'String',{AllImage.name}); %set string
