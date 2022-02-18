%ALUMNOS:
%    KENER JOAN HERNANDES FLORES     2019-0021U
%    SINDY SUYEN PAVON CASTRO        2018-0342U
%    BRYAN MIGUEL ROSALES GALEANO    2019-0012U
%    FREDDY MANUEL RUIZ RIOS         2019-0027U
%GRUPO:
%    2M3-CO
%
function varargout = AreaRiemann(varargin)
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @AreaRiemann_OpeningFcn, ...
                   'gui_OutputFcn',  @AreaRiemann_OutputFcn, ...
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
% Fin de la inicializaci�n del c�digo - NO EDITAR

%Ejecuci�n de la visibilidad de las funciones lineales
function AreaRiemann_OpeningFcn(hObject, eventdata, handles, varargin)
%Definici�n de objeto
handles.output = hObject;

%Actualizaci�n del manejo de la estructura
guidata(hObject, handles);

% --- Las salidas de esta funci�n se devuelven a la l�nea de comando.
function varargout = AreaRiemann_OutputFcn(hObject, eventdata, handles) 
%matriz de celdas varargout para devolver argumentos de salida (ver VARARGOUT);
varargout{1} = handles.output;

%C�digo fuente del cuadro de texto
function txtFuncion_Callback(hObject, eventdata, handles)

%C�digo fuente del cuadro de texto
function txtFuncion_CreateFcn(hObject, eventdata, handles)
%Aplicar propiedades
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

%C�digo fuente del cuadro de texto
function txtA_Callback(hObject, eventdata, handles)

%C�digo fuente del cuadro de texto
function txtA_CreateFcn(hObject, eventdata, handles)
%Aplicar propiedades
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

%C�digo fuente del cuadro de texto
function txtB_Callback(hObject, eventdata, handles)

%C�digo fuente del cuadro de texto
function txtB_CreateFcn(hObject, eventdata, handles)
%Aplicar propiedades
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

%C�digo fuente del cuadro de texto
function txtN_Callback(hObject, eventdata, handles)

%C�digo fuente del cuadro de texto
function txtN_CreateFcn(hObject, eventdata, handles)
%Aplicar propiedades
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

%C�digo fuente para el bot�n regresar
function btnRegresar_Callback(hObject, eventdata, handles)
close(AreaRiemann);

% C�digo fuente del bot�n calcular
function btnCalcular_Callback(hObject, eventdata, handles)
set(handles.txtNotificacion,'String',''); %Mantener casillas en blanco
set(handles.txtunidades,'String',''); %Mantener casillas en blanco
funcion_introducida=get(handles.txtFuncion,'String'); %Guardar la funci�n
syms x; %Establecer la variable simb�lica
a = str2num(get(handles.txtA,'String')); %Convertir valor del intervalo inicial
b = str2num(get(handles.txtB,'String')); %Convertir valor del intervalo final
n = str2num(get(handles.txtN,'String')); %Convertir valor de N
%Validar la entrada de una funci�n
if isempty(funcion_introducida)==1 
   set(handles.txtNotificacion,'String','Se debe introducir la funci�n')
   return;
end
%Validar entrada de intervalos
if isempty(a)==1||isempty(b)==1
   set(handles.txtNotificacion,'String','Se deben introducir los intervalos')
   return;
end
%Validar entrada de n
if isempty(n)==1
   set(handles.txtNotificacion,'String','Se deben introducir la cantidad de rect�ngulos')
   return;
end
%Validar que n sea mayor que cero
if n==0
   set(handles.txtNotificacion,'String','La cantidad de rect�ngulos debe ser mayor que cero')
   return;
end
%Validar el valor de los intervalos
if a >= b
   set(handles.txtNotificacion,'String','El valor inicial debe de ser menor que el final');
   return;
end
%Validar el valor de los intervalos
if a < b %Inicio de la condici�n
    area = 0; %Inicializar el valor del �rea
    dx = (b-a)/n; %Obtener valor de dx
    x1 = a; %Obtener valor de x1
    while x1 < b %Inicio del bucle while
        f1 = subs(funcion_introducida, (x1+dx/2)); %Obtener valor de f1
        area = area + f1*dx; %C�lculo del �rea
        x1 = x1 + dx; %Obtenci�n de x1
    end %Fin del bucle while
set(handles.txtRespuesta,'String',char(area)); %Imprimir resultado    
set(handles.txtunidades,'String','unidades cuadradas'); %Escribir las unidades cuadradas
end %Fin de la condici�n

%C�digo fuente para limpiar Pantalla
function btnLimpiarPantalla_Callback(hObject, eventdata, handles)
set(handles.txtFuncion,'String',''); %Limpiar casilla  
set(handles.txtNotificacion,'String',''); %Limpiar casilla
set(handles.txtA,'String',''); %Limpiar casilla
set(handles.txtB,'String','') %Limpiar casilla
set(handles.txtN,'String','') %Limpiar casilla
set(handles.txtRespuesta,'String','') %Limpiar casilla
set(handles.txtunidades,'String',''); %Imprimir resultado    
