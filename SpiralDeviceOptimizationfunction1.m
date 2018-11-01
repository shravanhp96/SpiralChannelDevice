function varargout = SpiralDeviceOptimizationfunction1(varargin)
% SPIRALDEVICEOPTIMIZATIONFUNCTION1 MATLAB code for SpiralDeviceOptimizationfunction1.fig
%      SPIRALDEVICEOPTIMIZATIONFUNCTION1, by itself, creates a new SPIRALDEVICEOPTIMIZATIONFUNCTION1 or raises the existing
%      singleton*.
%
%      H = SPIRALDEVICEOPTIMIZATIONFUNCTION1 returns the handle to a new SPIRALDEVICEOPTIMIZATIONFUNCTION1 or the handle to
%      the existing singleton*.
%
%      SPIRALDEVICEOPTIMIZATIONFUNCTION1('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SPIRALDEVICEOPTIMIZATIONFUNCTION1.M with the given input arguments.
%
%      SPIRALDEVICEOPTIMIZATIONFUNCTION1('Property','Value',...) creates a new SPIRALDEVICEOPTIMIZATIONFUNCTION1 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before SpiralDeviceOptimizationfunction1_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to SpiralDeviceOptimizationfunction1_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help SpiralDeviceOptimizationfunction1

% Last Modified by GUIDE v2.5 19-Apr-2016 13:42:29

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @SpiralDeviceOptimizationfunction1_OpeningFcn, ...
                   'gui_OutputFcn',  @SpiralDeviceOptimizationfunction1_OutputFcn, ...
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


% --- Executes just before SpiralDeviceOptimizationfunction1 is made visible.
function SpiralDeviceOptimizationfunction1_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to SpiralDeviceOptimizationfunction1 (see VARARGIN)

% Choose default command line output for SpiralDeviceOptimizationfunction1
handles.output = hObject;

% UIWAIT makes SpiralDeviceOptimizationfunction1 wait for user response (see UIRESUME)
% uiwait(handles.figure1);

% Pre-defining switch case options
handles.switchfunc = 0;
handles.threeto4 = [3:4];
handles.fourto5 = [4:5];
handles.fiveto6 = [5:6];
handles.sixto7 = [6:7];
handles.sevento8 = [7:8];
handles.eightto9 = [8:9];
handles.nineto10 = [9:10];

% Update handles structure
guidata(hObject, handles);


% --- Outputs from this function are returned to the command line.
function varargout = SpiralDeviceOptimizationfunction1_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on selection change in particle_diam.
function particle_diam_Callback(hObject, eventdata, handles)
% hObject    handle to particle_diam (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns particle_diam contents as cell array
%        contents{get(hObject,'Value')} returns selected item from particle_diam

% Switch case menu for pop up menu that lets user select particle diameters
str = get(hObject, 'String');
val = get(hObject,'Value');
switch str{val};
    case 'Select a range of particle diameter values'
        handles.switchfunc = 0;
    case '3-4 �m'
        handles.switchfunc = handles.threeto4;
    case '4-5 �m'
        handles.switchfunc = handles.fourto5;
    case '5-6 �m'
        handles.switchfunc = handles.fiveto6;
    case '6-7 �m'
        handles.switchfunc = handles.sixto7;
    case '7-8 �m'
        handles.switchfunc = handles.sevento8;
    case '8-9 �m'
        handles.switchfunc = handles.eightto9;
    case '9-10 �m'
        handles.switchfunc = handles.nineto10;
end
% Save the handles structure.
guidata(hObject,handles)


% --- Executes during object creation, after setting all properties.
function particle_diam_CreateFcn(hObject, eventdata, handles)
% hObject    handle to particle_diam (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function density_Callback(hObject, eventdata, handles)
% hObject    handle to density (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of density as text
%        str2double(get(hObject,'String')) returns contents of density as a double
handles.density = str2double(get(hObject,'String'));

guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function density_CreateFcn(hObject, eventdata, handles)
% hObject    handle to density (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function viscosity_Callback(hObject, eventdata, handles)
% hObject    handle to viscosity (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of viscosity as text
%        str2double(get(hObject,'String')) returns contents of viscosity as a double
handles.viscosity = str2double(get(hObject,'String'));

guidata(hObject, handles);


% --- Executes during object creation, after setting all properties.
function viscosity_CreateFcn(hObject, eventdata, handles)
% hObject    handle to viscosity (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function flowrate_Callback(hObject, eventdata, handles)
% hObject    handle to flowrate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of flowrate as text
%        str2double(get(hObject,'String')) returns contents of flowrate as a double
handles.flowrate = str2double(get(hObject,'String'));

guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function flowrate_CreateFcn(hObject, eventdata, handles)
% hObject    handle to flowrate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function channelwidth_Callback(hObject, eventdata, handles)
% hObject    handle to channelwidth (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of channelwidth as text
%        str2double(get(hObject,'String')) returns contents of channelwidth as a double
handles.channelwidth = str2double(get(hObject,'String'));

guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function channelwidth_CreateFcn(hObject, eventdata, handles)
% hObject    handle to channelwidth (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function channelheight_Callback(hObject, eventdata, handles)
% hObject    handle to channelheight (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of channelheight as text
%        str2double(get(hObject,'String')) returns contents of channelheight as a double
handles.channelheight = str2double(get(hObject,'String'));

guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function channelheight_CreateFcn(hObject, eventdata, handles)
% hObject    handle to channelheight (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in calculate.
function calculate_Callback(hObject, eventdata, handles)
% hObject    handle to calculate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

if handles.switchfunc == 0
    msgbox('Please choose a range!')
else
    [handles.channelwidth, handles.channelheight, handles.R_f] = channel_spiral3(handles.density, ...
    handles.viscosity, handles.switchfunc, handles.flowrate); % User-defined function to calculate outputs

    % Displays outputs into tables
    set(handles.uitable1, 'Data', handles.channelwidth);
    set(handles.uitable2, 'Data', handles.channelheight);
    set(handles.uitable3, 'Data', handles.R_f);

    axes(findobj('Tag', 'axes1'));
    scatter(handles.channelwidth,handles.channelheight);
    xlabel('Channel Width (um)')
    ylabel('Channel Height (um)')
    title('Channel Width vs. Channel Height')
end

% Sample values that work:
% density = 1e-12
% viscosity = 1e-6
% flow rate = 8.33e9

guidata(hObject, handles);
