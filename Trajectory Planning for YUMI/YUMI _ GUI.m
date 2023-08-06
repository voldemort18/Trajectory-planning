function varargout = YUMI(varargin)


gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Six_R_Robot_OpeningFcn, ...
                   'gui_OutputFcn',  @Six_R_Robot_OutputFcn, ...
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

function Six_R_Robot_OpeningFcn(hObject, eventdata, handles, varargin)

handles.output = hObject;


guidata(hObject, handles);

function varargout = Six_R_Robot_OutputFcn(hObject, eventdata, handles) 

varargout{1} = handles.output;



function Theta_1_Callback(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Theta_2_Callback(hObject, eventdata, handles)
function Theta_2_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Theta_3_Callback(hObject, eventdata, handles)

function Theta_3_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Theta_4_Callback(hObject, eventdata, handles)

function Theta_4_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Theta_5_Callback(hObject, eventdata, handles)

function Theta_5_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Theta_6_Callback(hObject, eventdata, handles)

function Theta_6_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Pos_X_Callback(hObject, eventdata, handles)



function Pos_X_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Pos_Z_Callback(hObject, eventdata, handles)

function Pos_Z_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function btn_Forward_Callback(hObject, eventdata, handles)

Th_1 = str2double(handles.Theta_1.String)*pi/180;
Th_2 = str2double(handles.Theta_2.String)*pi/180;
Th_3 = str2double(handles.Theta_3.String)*pi/180;
Th_4 = str2double(handles.Theta_4.String)*pi/180;
Th_5 = str2double(handles.Theta_5.String)*pi/180;
Th_6 = str2double(handles.Theta_6.String)*pi/180;

L_1 = 0;
L_2 = 80;
L_3 = 70;
L_4 = 50;
L_5 = 0;
L_6 = 0;

L(1) = Link([0 L_1 0 pi/2]);
L(2) = Link([0 0 L_2 0]);
L(3) = Link([0 0 L_3 0]);
L(4) = Link([0 0 L_4 -pi/2]);
L(5) = Link([0 0 L_5 pi/2]);
L(6) = Link([0 L_6 0 0]);



Robot = SerialLink(L);
Robot.name = 'YUMI';
Robot.plot([Th_1 Th_2 Th_3 Th_4 Th_5 Th_6]);

T = Robot.fkine([Th_1 Th_2 Th_3 Th_4 Th_5 Th_6]);
handles.Pos_X.String = num2str(floor(T.t(1)));
handles.Pos_Y.String = num2str(floor(T.t(2)));
handles.Pos_Z.String = num2str(floor(T.t(3)));



function btn_Inverse_Callback(hObject, eventdata, handles)
PX = str2double(handles.Pos_X.String);
PY = str2double(handles.Pos_Y.String);
PZ = str2double(handles.Pos_Z.String);

L_1 = 0;
L_2 = 80;
L_3 = 70;
L_4 = 50;
L_5 = 0;
L_6 = 0;

L(1) = Link([0 L_1 0 pi/2]);
L(2) = Link([0 0 L_2 0]);
L(3) = Link([0 0 L_3 0]);
L(4) = Link([0 0 L_4 -pi/2]);
L(5) = Link([0 0 L_5 pi/2]);
L(6) = Link([0 L_6 0 0]);


Robot = SerialLink(L);
Robot.name = 'YUMI';

T = [ 1 0 0 PX;
      0 1 0 PY;
      0 0 1 PZ;
      0 0 0 1];
  
J = Robot.ikine(T,[0 0 0],'mask',[1 1 1 0 0 0])*180/pi;
handles.Theta_1.String = num2str(floor(J(1)));
handles.Theta_2.String = num2str(floor(J(2)));
handles.Theta_3.String = num2str(floor(J(3)));
handles.Theta_4.String = num2str(floor(J(3)));
handles.Theta_5.String = num2str(floor(J(3)));
handles.Theta_6.String = num2str(floor(J(3)));

Robot.plot(J*pi/180);



function Pos_Y_Callback(hObject, eventdata, handles)

function Pos_Y_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
