%ALUMNOS:
%    KENER JOAN HERNANDES FLORES     2019-0021U
%    BRYAN MIGUEL ROSALES GALEANO    2019-0012U
%    FREDDY MANUEL RUIZ RIOS         2019-0027U
%GRUPO:
%    2M3-CO
%
function varargout = Derivada_lab2(varargin)
%Comienzo de la inicialización del código - NO EDITAR
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Derivada_lab2_OpeningFcn, ...
                   'gui_OutputFcn',  @Derivada_lab2_OutputFcn, ...
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

%Ejecución de la visibilidad de las funciones lineales
function Derivada_lab2_OpeningFcn(hObject, eventdata, handles, varargin)
%Definición de objeto
handles.output = hObject;

%Actualización del manejo de la estructura
guidata(hObject, handles);

% --- Las salidas de esta función se devuelven a la línea de comando.
function varargout = Derivada_lab2_OutputFcn(hObject, eventdata, handles) 
%matriz de celdas varargout para devolver argumentos de salida (ver VARARGOUT);
varargout{1} = handles.output;

%Evento del llamado de la función
function txtFuncion_Callback(hObject, eventdata, handles)
% hObject    handle to txtFuncion (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%Llamado de la introducción del texto de la función
function txtFuncion_CreateFcn(hObject, eventdata, handles)
%Asignación de propiedades correspondientes
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

%Código fuente del botón derivar
function btnDerivar_Callback(hObject, eventdata, handles)
set(handles.txtNotificacion,'String','')
funcion_introducida=get(handles.txtFuncion,'String'); %Guardar la función
syms x; %Establecer la variable simbólica
%Validar la entrada de una función
if isempty(funcion_introducida)==1 
   set(handles.txtNotificacion,'String','Se debe introducir la función')
   return;
end
try %Inicio de caso de captura de errores
    %Proceso para obtener la primera derivada
    funcion_a_derivar_1=eval(get(handles.txtFuncion,'String'));%Lectura de la función
    diferenciacion_1=diff(funcion_a_derivar_1); %Derivar por primera vez
    derivada_1=char(diferenciacion_1); %Convertir el resultado a cadena de caracteres
    set(handles.txtRD1,'String',derivada_1) %Impresión del resultado
catch %Caso de captura de un error
    set(handles.txtFuncion,'String',''); %Mantener casillas en blanco    
end %Fin de la captura de errores

% Código fuente del botón Limpiar Pantalla
function btnLimpiarPantalla_Callback(hObject, eventdata, handles)
set(handles.txtFuncion,'String',''); %Mantener casillas en blanco  
set(handles.txtNotificacion,'String',''); %Mantener casillas en blanco
set(handles.txtRD1,'String',''); %Mantener casillas en blanco

% Llamado al cuadro de texto de la introducción de la derivada
function txtRD1_Callback(hObject, eventdata, handles)
% hObject    handle to txtRD1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes during object creation, after setting all properties.
function txtRD1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtRD1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
