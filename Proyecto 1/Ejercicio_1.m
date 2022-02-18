%ALUMNOS:
%    KENER JOAN HERNANDES FLORES     2019-0021U
%    BRYAN MIGUEL ROSALES GALEANO    2019-0012U
%    FREDDY MANUEL RUIZ RIOS         2019-0027U
%GRUPO:
%    2M3-CO
%
function varargout = Ejercicio_1(varargin)
%Comienzo de la inicializaci�n del c�digo - NO EDITAR
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Ejercicio_1_OpeningFcn, ...
                   'gui_OutputFcn',  @Ejercicio_1_OutputFcn, ...
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

%Ejecuci�n de la visibilidad del ejercicio 1
function Ejercicio_1_OpeningFcn(hObject, eventdata, handles, varargin)
%Definici�n de objeto
handles.output = hObject;

%Actualizaci�n del manejo de la estructura
guidata(hObject, handles);

% --- Las salidas de esta funci�n se devuelven a la l�nea de comando.
function varargout = Ejercicio_1_OutputFcn(hObject, eventdata, handles) 
%matriz de celdas varargout para devolver argumentos de salida (ver VARARGOUT);
varargout{1} = handles.output;

%Llamado de la cadena introducidad en el texto de la funci�n
function txtFuncion_Callback(hObject, eventdata, handles)
% hObject    handle to txtFuncion (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Ejecuci�n de la cadena introducida en la lectura del texto
function txtFuncion_CreateFcn(hObject, eventdata, handles)
%Asignaci�n de propiedades correspondientes
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

%Llamado al valor del cuadro de texto del intervalo inicial
function txtA_Callback(hObject, eventdata, handles)
% hObject    handle to txtA (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%Lectura del intervalo inicial
function txtA_CreateFcn(hObject, eventdata, handles)
%Definir propiedades del cuadro de texto del intervalo inicial
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

%Llamado al valor del cuadro de texto del intervalo final
function txtB_Callback(hObject, eventdata, handles)
% hObject    handle to txtB (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%Lectura del intervalo final
function txtB_CreateFcn(hObject, eventdata, handles)
%Definir propiedades del cuadro de texto del intervalo final
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end %Fin de la condici�n

%C�digo fuente del bot�n calcular
function btnGraficar_Callback(hObject, eventdata, handles)
set(handles.text5,'String','')
syms x; %Crear variable simb�lica
funcion_introducida=get(handles.txtFuncion,'String'); %Guardar la funci�n
Intervalo_A=str2num(get(handles.txtA,'String')); %Convertir valor del intervalo inicial
Intervalo_B=str2num(get(handles.txtB,'String')); %Convertir valor del intervalo final
%Validar la entrada de una funci�n
if isempty(funcion_introducida)==1 
   set(handles.text5,'String','Se debe introducir la funci�n')
   return;
end
%Validar entrada de intervalos
if isempty(Intervalo_A)==1||isempty(Intervalo_B)==1
   set(handles.text5,'String','Se deben introducir los intervalos')
   return;
end
%Validar el valor de los intervalos
if Intervalo_A >= Intervalo_B
   set(handles.text5,'String','El valor inicial debe de ser menor que el final');
   return;
end
%Validar el valor de los intervalos
if Intervalo_A < Intervalo_B
    figure, ezplot(funcion_introducida,[Intervalo_A Intervalo_B]); %Graficar la funci�n
    xlabel('Eje x');      %Impresion de etiqueta x
    ylabel('Eje y');      %Impresion de etiqueta y 
    %Proceso de tabulaci�n
    set(handles.txtA,'String',Intervalo_A) %Definir el valor inicial del intervalo
    set(handles.txtB,'String',Intervalo_B) %Definir el valor final del intervalo
    x=Intervalo_A:1:Intervalo_B; %Asignaci�n del intervalo a la variable x (Reutilizaci�n de variables)
    secuencia=inline(funcion_introducida); %Asignar a la variable secuencia la funci�n introducida
    n=length(x); %Variable longitudinal
    y=[]; %Arreglo inicializado en cero
    for i=1:n %Inicio del bucle
        y=[y secuencia(x(i))]; %Iteraci�n
    end %Fin del bucle
    tabla(:,1) = x; %Impresi�n de resultado x
    tabla(:,2) = y; %Impresi�n de resultado x
    set(handles.TV,'Data',tabla); %Asignaci�n de datos a la tabla
    %Convertir valores
    %Intervalo_A=eval(get(handles.txtA,'String')); %Convertir valor del intervalo inicial
    %Intervalo_B=eval(get(handles.txtB,'String')); %Convertir valor del intervalo final
    %x=Intervalo_A:0.1:Intervalo_B; %Establecer el dominio de la funci�n 
    %y=eval(get(handles.txtFuncion,'String'));%Convertir la cadena de la funci�n
    %plot(x,y); %Graficar la funci�n
end
%Proceso realizado por el bot�n derivar
function BtnDerivar_Callback(hObject, eventdata, handles)
set(handles.text5,'String','')
funcion_introducida=get(handles.txtFuncion,'String'); %Guardar la funci�n
syms x; %Establecer la variable simb�lica
%Validar la entrada de una funci�n
if isempty(funcion_introducida)==1 
   set(handles.text5,'String','Se debe introducir la funci�n')
   return;
end    
try %Inicio de caso de captura de errores
    %Proceso para obtener la primera derivada
    funcion_a_derivar_1=eval(get(handles.txtFuncion,'String'));%Lectura de la funci�n
    diferenciacion_1=diff(funcion_a_derivar_1); %Derivar por primera vez
    derivada_1=char(diferenciacion_1); %Convertir el resultado a cadena de caracteres
    set(handles.txtRD1,'String',derivada_1) %Impresi�n del resultado
    %Proceso para obtener la segunda derivada
    diferenciacion_2=diff(diferenciacion_1); %Derivar por segunda vez
    derivada_2=char(diferenciacion_2); %Convertir el resultado a cadena de caracteres
    set(handles.txtRD2,'String',derivada_2) %Impresi�n del resultado
catch %Caso de captura de un error
    set(handles.txtFuncion,'String',''); %Mantener casillas en blanco    
end %Fin de la captura de errores

% C�dgigo fuente de limpiar pantalla
function pushbutton3_Callback(hObject, eventdata, handles)
set(handles.txtFuncion,'String',''); %Mantener casillas en blanco  
set(handles.txtA,'String',''); %Mantener casillas en blanco
set(handles.txtB,'String',''); %Mantener casillas en blanco
set(handles.text5,'String',''); %Mantener casillas en blanco
set(handles.txtRD1,'String',''); %Mantener casillas en blanco
set(handles.txtRD2,'String',''); %Mantener casillas en blanco
set(handles.TV,'data','');