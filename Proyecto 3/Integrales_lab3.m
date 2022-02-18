%ALUMNOS:
%    KENER JOAN HERNANDES FLORES     2019-0021U
%    SINDY SUYEN PAVON CASTRO        2018-0342U
%    BRYAN MIGUEL ROSALES GALEANO    2019-0012U
%    FREDDY MANUEL RUIZ RIOS         2019-0027U
%GRUPO:
%    2M3-CO
%
function varargout = Integrales_lab3(varargin)
%Comienzo de la inicialización del código - NO EDITAR
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Integrales_lab3_OpeningFcn, ...
                   'gui_OutputFcn',  @Integrales_lab3_OutputFcn, ...
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
function Integrales_lab3_OpeningFcn(hObject, eventdata, handles, varargin)
%Definición de objeto
handles.output = hObject;

%Actualización del manejo de la estructura
guidata(hObject, handles);

% --- Las salidas de esta función se devuelven a la línea de comando.
function varargout = Integrales_lab3_OutputFcn(hObject, eventdata, handles) 
%matriz de celdas varargout para devolver argumentos de salida (ver VARARGOUT);
varargout{1} = handles.output;

%Creación del text txtFuncion
function txtFuncion_Callback(hObject, eventdata, handles)
% hObject    handle to btnIntegrar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%Creación de la función txtFuncion
function txtFuncion_CreateFcn(hObject, eventdata, handles)
%Asignación de las propiedades
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

%Llamado del btnIntegrar
function btnIntegrar_Callback(hObject, eventdata, handles)
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
    funcion_a_integrar_1=funcion_introducida;%Igualar variable a la introducción de la función
    integracion_1=int(funcion_a_integrar_1,x); %Derivar por primera vez
    integral_1=char(integracion_1); %Convertir el resultado a cadena de caracteres
    set(handles.txtIntegral,'String',integral_1) %Impresión del resultado
    set(handles.txtConstante,'String','+ c') %Agregar la constante de Integracion
catch %Caso de captura de un error
    set(handles.txtFuncion,'String',''); %Mantener casillas en blanco    
end %Fin de la captura de errores

%Llamado del txtIntegral
function txtIntegral_Callback(hObject, eventdata, handles)
% hObject    handle to txtIntegral (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%Llamado del btnLimpiarPantalla
function btnLimpiarPantalla_Callback(hObject, eventdata, handles)
set(handles.txtFuncion,'String',''); %Mantener casillas en blanco  
set(handles.txtNotificacion,'String',''); %Mantener casillas en blanco
set(handles.txtIntegral,'String',''); %Mantener casillas en blanco
set(handles.txtConstante,'String','') %Agregar la constante de Integracion

%Llamado de la constante de integración
function txtConstante_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtConstante (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% --- Executes on button press in btnRegresar.
function btnRegresar_Callback(hObject, eventdata, handles)
close(Integrales_lab3) %Cerrar interfaz gráfica del cálculo integral
Presentacion_lab3 %Devolverse a la presentación