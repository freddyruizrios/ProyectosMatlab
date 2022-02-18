%ALUMNOS:
%    KENER JOAN HERNANDES FLORES     2019-0021U
%    BRYAN MIGUEL ROSALES GALEANO    2019-0012U
%    FREDDY MANUEL RUIZ RIOS         2019-0027U
%GRUPO:
%    2M3-CO
%
function varargout = Cuadraticas_lab2(varargin)
%Comienzo de la inicialización del código - NO EDITAR
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Cuadraticas_lab2_OpeningFcn, ...
                   'gui_OutputFcn',  @Cuadraticas_lab2_OutputFcn, ...
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
% Fin de la inicialización del código - NO EDITAR

%Ejecución de la visibilidad del ejercicio 1
function Cuadraticas_lab2_OpeningFcn(hObject, eventdata, handles, varargin)
%Ocultar los ejes mientras no se introduzca nada
set(handles.axes5,'Visible','off')
set(handles.axes6,'Visible','off')
set(handles.axes7,'Visible','off')
set(handles.axes8,'Visible','off')
set(handles.axes9,'Visible','off')

%Definición de objeto
handles.output = hObject;

%Actualización del manejo de la estructura
guidata(hObject, handles);

% --- Las salidas de esta función se devuelven a la línea de comando.
function varargout = Cuadraticas_lab2_OutputFcn(hObject, eventdata, handles) 
%matriz de celdas varargout para devolver argumentos de salida (ver VARARGOUT);
varargout{1} = handles.output;

%Llamado de la cadena introducidad en el texto de la función
function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Ejecución de la cadena introducida en la lectura del texto
function edit1_CreateFcn(hObject, eventdata, handles)
%Asignación de propiedades correspondientes
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

%Llamado al botón Calcular
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%Llamado de la cadena introducidad en el texto de la función
function txtFuncion_Callback(hObject, eventdata, handles)
% hObject    handle to txtFuncion (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Ejecución de la cadena introducida en la lectura del texto
function txtFuncion_CreateFcn(hObject, eventdata, handles)
%Asignación de propiedades correspondientes
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

%Código fuente del botón calcular
function btnCalcular_Callback(hObject, eventdata, handles)
set(handles.txtnotificacion,'String','') %Mantener casilla en blanco  
[x,y]=meshgrid(-4:0.1:4, -4:0.1:4); %Devolver valores de las coordenadas en la cuadrícula 2D
funcion_introducida=get(handles.txtFuncion, 'String'); %Guardar la función introducida
%Validar en caso de que el usuario si ingrese la función
if isempty(funcion_introducida)==0
    funcion_introducida=eval(get(handles.txtFuncion, 'String')); %Redefinir el valor de la función introducida
    rotate3d on; %Rotar la función en un plano 3D
    set(handles.text4,'String','Rotación 3D'); %Etiqueta  
    axes(handles.axes5) %Mostrar rotación 3D
    contour(funcion_introducida) %Crear un diagrama de contorno
    set(handles.text5,'String','Diagrama de contorno'); %Etiqueta      
    axes(handles.axes6) %Mostrar el diagrama de contorno
    contour3(funcion_introducida) %Crear un diagrama de contorno tridimensional
    set(handles.text6,'String','Diagrama de contorno 3D'); %Etiqueta  
    axes(handles.axes7) %Mostrar le diagrama de contorno tridimensional
    meshc(funcion_introducida) %Diagrama de malla con un diagrama de contorno debajo
    set(handles.text7,'String','Diagrama de contorno 3D'); %Etiqueta  
    axes(handles.axes8) %Mostrar el diagrama de malla
    mesh(funcion_introducida)%Crear un diagrama de malla (Superficie tridimensional que tiene colores de borde sólidos y sin colores de cara)
    set(handles.text8,'String','Gráfica en 2D'); %Etiqueta
end
%Validar la entrada de una función
if isempty(funcion_introducida)==1 
   set(handles.txtnotificacion,'String','Se debe introducir la función')
   %Ocultar los ejes mientras no se introduzca nada
    set(handles.axes5,'Visible','off')
    set(handles.axes6,'Visible','off')
    set(handles.axes7,'Visible','off')
    set(handles.axes8,'Visible','off')
    set(handles.axes9,'Visible','off')    
   return;
end
x=-4:0.1:4; %Establecer el dominio de la función 
y=eval(get(handles.txtFuncion,'String'));%Convertir la cadena de la función
axes(handles.axes9) %Mostrar el diagrama de malla
plot(x,y); %Graficar la función 2d

%Código fuente del botón limpiar pantalla
function btnLimpiarPantalla_Callback(hObject, eventdata, handles)
cla %Ocultar gráfica 2d
%Ocultar las rotaciones 3d
cla(handles.axes5,'reset')
cla(handles.axes6,'reset')
cla(handles.axes7,'reset')
cla(handles.axes8,'reset')
cla(handles.axes9,'reset')
%Limpiar casillas
set(handles.txtFuncion,'String',''); %Mantener casillas en blanco 
set(handles.txtnotificacion,'String','') %Mantener casilla en blanco
set(handles.text4,'String',''); %Mantener casilla en blanco
set(handles.text5,'String',''); %Mantener casilla en blanco
set(handles.text6,'String',''); %Mantener casilla en blanco
set(handles.text7,'String',''); %Mantener casilla en blanco
set(handles.text8,'String',''); %Mantener casilla en blanco
%Ocultar los ejes mientras no se introduzca nada
set(handles.axes5,'Visible','off')
set(handles.axes6,'Visible','off')
set(handles.axes7,'Visible','off')
set(handles.axes8,'Visible','off')
set(handles.axes9,'Visible','off')
