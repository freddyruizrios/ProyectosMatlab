%ALUMNOS:
%    KENER JOAN HERNANDES FLORES     2019-0021U
%    SINDY SUYEN PAVON CASTRO        2018-0342U
%    BRYAN MIGUEL ROSALES GALEANO    2019-0012U
%    FREDDY MANUEL RUIZ RIOS         2019-0027U
%GRUPO:
%    2M3-CO
%
function varargout = AreaCircunscritos(varargin)
%Comienzo de la inicialización del código - NO EDITAR
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @AreaCircunscritos_OpeningFcn, ...
                   'gui_OutputFcn',  @AreaCircunscritos_OutputFcn, ...
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
function AreaCircunscritos_OpeningFcn(hObject, eventdata, handles, varargin)
%Definición de objeto
handles.output = hObject;

%Actualización del manejo de la estructura
guidata(hObject, handles);

% --- Las salidas de esta función se devuelven a la línea de comando.
function varargout = AreaCircunscritos_OutputFcn(hObject, eventdata, handles) 
%matriz de celdas varargout para devolver argumentos de salida (ver VARARGOUT);
varargout{1} = handles.output;

%Código fuente del cuadro de texto
function txtFuncion_Callback(hObject, eventdata, handles)

%Código fuente del cuadro de texto
function txtFuncion_CreateFcn(hObject, eventdata, handles)
%Asignar propiedades
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

%Código fuente del cuadro de texto
function txtA_Callback(hObject, eventdata, handles)

%Código fuente del cuadro de texto
function txtA_CreateFcn(hObject, eventdata, handles)
%Asignar propiedades
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

%Código fuente del cuadro de texto
function txtB_Callback(hObject, eventdata, handles)

%Código fuente del cuadro de texto
function txtB_CreateFcn(hObject, eventdata, handles)
%Asignar propiedades
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

%Código fuente del cuadro de texto
function txtN_Callback(hObject, eventdata, handles)

%Código fuente del cuadro de texto
function txtN_CreateFcn(hObject, eventdata, handles)
%Asignar propiedades
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

%Código fuente del botón Regresar
function btnRegresar_Callback(hObject, eventdata, handles)
close(AreaCircunscritos);

% Código fuente del botón calcular
function btnCalcular_Callback(hObject, eventdata, handles)
set(handles.txtNotificacion,'String',''); %Mantener casillas en blanco
set(handles.txtunidades,'String',''); %Mantener casillas en blanco
funcion_introducida=get(handles.txtFuncion,'String'); %Guardar la función
syms x; %Establecer la variable simbólica
a = str2num(get(handles.txtA,'String')); %Convertir valor del intervalo inicial
b = str2num(get(handles.txtB,'String')); %Convertir valor del intervalo final
n = str2num(get(handles.txtN,'String')); %Convertir valor de N
%Validar la entrada de una función
if isempty(funcion_introducida)==1 
   set(handles.txtNotificacion,'String','Se debe introducir la función')
   return;
end
%Validar entrada de intervalos
if isempty(a)==1||isempty(b)==1
   set(handles.txtNotificacion,'String','Se deben introducir los intervalos')
   return;
end
%Validar entrada de n
if isempty(n)==1
   set(handles.txtNotificacion,'String','Se deben introducir la cantidad de rectángulos')
   return;
end
%Validar que n sea mayor que cero
if n==0
   set(handles.txtNotificacion,'String','La cantidad de rectángulos debe ser mayor que cero')
   return;
end
%Validar el valor de los intervalos
if a >= b
   set(handles.txtNotificacion,'String','El valor inicial debe de ser menor que el final');
   return;
end
%Validar el valor de los intervalos
if a < b %Inicio de la condición
    area = 0; %Inicializar el valor del área
    dx = (b-a)/n; %Obtener valor de dx
    x1 = a; %Obtener valor de x1
    x2 = a + dx; %Obtener valor de x2
    while x1 < b %Inicio del bucle while
        f1 = subs(funcion_introducida, x1); %Obtener valor de f1
        f2 = subs(funcion_introducida, x2); %Obtener valor de f2
         if f1>f2 %Inicio de la condición
            area = area + f1*dx; %Cálculo del área
         else %Cambio de la condición
             area = area + f2*dx; %Cálculo del área
         end %Fin de la condición
        x1 = x1 + dx; %Obtención de x1
        x2 = x2 + dx; %Obtención de x2
    end %Fin del bucle while
set(handles.txtRespuesta,'String',char(area)); %Imprimir resultado    
set(handles.txtunidades,'String','unidades cuadradas'); %Escribir las unidades cuadradas
end %Fin de la condición

% Código fuente del botón Limpiar Pantalla
function BtnLimpiarPantalla_Callback(hObject, eventdata, handles)
set(handles.txtFuncion,'String',''); %Limpiar casilla  
set(handles.txtNotificacion,'String',''); %Limpiar casilla
set(handles.txtA,'String',''); %Limpiar casilla
set(handles.txtB,'String','') %Limpiar casilla
set(handles.txtN,'String','') %Limpiar casilla
set(handles.txtRespuesta,'String','') %Limpiar casilla
set(handles.txtunidades,'String',''); %Imprimir resultado    
