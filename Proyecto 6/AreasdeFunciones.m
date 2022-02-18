%ALUMNOS:
%    KENER JOAN HERNANDES FLORES     2019-0021U
%    SINDY SUYEN PAVON CASTRO        2018-0342U
%    BRYAN MIGUEL ROSALES GALEANO    2019-0012U
%    FREDDY MANUEL RUIZ RIOS         2019-0027U
%GRUPO:
%    2M3-CO
%
function varargout = AreasdeFunciones(varargin)
%Comienzo de la inicializaci�n del c�digo - NO EDITAR
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @AreasdeFunciones_OpeningFcn, ...
                   'gui_OutputFcn',  @AreasdeFunciones_OutputFcn, ...
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
function AreasdeFunciones_OpeningFcn(hObject, eventdata, handles, varargin)
%Ocultar los ejes mientras no se introduzca nada
cla(handles.axes5,'reset')
set(handles.axes5,'Visible','off')
%Definici�n de objeto
handles.output = hObject;

%Actualizaci�n del manejo de la estructura
guidata(hObject, handles);

% --- Las salidas de esta funci�n se devuelven a la l�nea de comando.
function varargout = AreasdeFunciones_OutputFcn(hObject, eventdata, handles) 
%matriz de celdas varargout para devolver argumentos de salida (ver VARARGOUT);
varargout{1} = handles.output;

%C�digo fuente de txtFuncion
function txtFuncion_Callback(hObject, eventdata, handles)

%Funci�n de txtFuncion
function txtFuncion_CreateFcn(hObject, eventdata, handles)
%Aplicar propiedades
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

%C�digo fuente de txtA
function txtA_Callback(hObject, eventdata, handles)
%

%Funci�n de txtA
function txtA_CreateFcn(hObject, eventdata, handles)
%Aplicar propiedades
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

%C�digo fuente de txtB
function txtB_Callback(hObject, eventdata, handles)
%

%Funci�n de txtB
function txtB_CreateFcn(hObject, eventdata, handles)
%Aplicar condiciones
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

%C�digo fuente de txtN
function txtN_Callback(hObject, eventdata, handles)
%

%Funci�n de txtN
function txtN_CreateFcn(hObject, eventdata, handles)
%Aplicar propiedades
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

%C�digo fuente del bot�n REGRESAR A LA PRESENTACI�N
function btnRegresar_Callback(hObject, eventdata, handles)
close(AreasdeFunciones) %Cerrar interfaz para realizar las gr�ficas solicitadas
Presentacion %Abrir interfaz de Presentaci�n

%C�digo fuente del bot�n INSCRITOS
function btnInscritos_Callback(hObject, eventdata, handles)
set(handles.txtNotificacion,'String',''); %Mantener casillas en blanco
set(handles.axes5,'Visible','off') %Ocultar el plano
cla(handles.axes5,'reset') %Ocultar la gr�fica 2d previa
syms x; %Establecer la variable simb�lica
f=eval(get(handles.txtFuncion,'String')); %Guardar la funci�n
%CONVERSI�N A VALORES NUM�RICOS
a = str2num(get(handles.txtA,'String')); %Convertir valor del intervalo inicial
b = str2num(get(handles.txtB,'String')); %Convertir valor del intervalo final
n = str2num(get(handles.txtN,'String')); %Convertir valor de N
%Validar la entrada de una funci�n
if isempty(f)==1 
   set(handles.txtNotificacion,'String','Se debe introducir la funci�n');
   %Ocultar los ejes mientras no se introduzca nada
   set(handles.axes5,'Visible','off')
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
    dx=(b-a)/n; %Calcular "delta x" o intervalo entre rect�ngulos
    x1=a; %Asignar a x1 el valor inicial del intervalo
    x2=a+dx; %Obtener la suma de la cantidad de rect�ngulos m�s el valor inicial del intervalo
    hold on; %Mantener la cuadr�cula - DEBE DE COMENTARSE, NO ES RECOMENDADO EN INTERFACES GR�FICAS
    i=1; %Inicializar la variable iteradora de los bucles
    r=a:0.01:b; %Establecer los valores de la escala
    y=subs(f,r); %Sustituir los valores de la abcisa (DOMINIO) en la funci�n introducida
    %figure,
    plot(r,y); %Graficar el plano
    xlabel('Eje x');      %Impresi�n de etiqueta x
    ylabel('Eje y');      %Impresi�n de etiqueta y 
    title('�REA MENOR') %Impresi�n del t�tulo en la gr�fica
    axes(handles.axes5) %Mostrar ejes

    while i<=n %INICIO DEL CICLO
         v1=subs(f,x1); %Sustituir el valor de x1 en la funci�n
         v2=subs(f,x2); %Sustituir el valor de x2 en la funci�n
         f1=abs(v1); %Obtener el valor absoluto de v1
         f2=abs(v2); %Obtener el valor absoluto de v2
         
         if f1<f2 %INICIO DE LA CONDICI�N DEL �REA MENOR
             if v1<0 %INICIO DE LA CONDICI�N SI V1 ES NEGATIVO
                 pause(1) %Pausa para animaci�n
                 rectangle('Position', [x1 double(v1) dx double(f1+0.001)],'FaceColor','Red'); %Impresi�n del rect�ngulo
             else %Sino
                 pause(1) %Pausa para animaci�n
                 rectangle('Position', [x1 0 dx double(f1+0.001)],'FaceColor','Red'); %Impresi�n del rect�ngulo
             end %FIN DE LA CONDICI�N
         else %Sino
             if v2<0 %INICIO DE LA CONDICI�N SI V2 ES NEGATIVO
                 pause(1) %Pausa para animaci�n
                 rectangle('Position', [x1, double(v2), dx,double(f2+0.001)],'FaceColor','Red'); %Impresi�n del rect�ngulo
             else
                 pause(1); %Pausa para animaci�n
                 rectangle('Position', [x1, 0, dx, double(f2+0.001)],'FaceColor','Red'); %Impresi�n del rect�ngulo
             end %FIN DE LA CONDICI�N
         end %FIN DE LA CONDICI�N DEL �REA MENOR
        x1=x1+dx; %Incrementar la variable x1
        x2=x2+dx; %Incrementar la variable x2
        i=i+1;%Incremento de la iteraci�n que contiene la animaci�n
    end %FIN DEL CICLO
end %Fin de la condici�n

% C�digo fuente del bot�n LIMPIAR PANTALLA
function btnLimpiarPantalla_Callback(hObject, eventdata, handles)
set(handles.txtFuncion,'String',''); %Limpiar casilla  
set(handles.txtNotificacion,'String',''); %Limpiar casilla
set(handles.txtA,'String',''); %Limpiar casilla
set(handles.txtB,'String','') %Limpiar casilla
set(handles.txtN,'String','') %Limpiar casilla
%Ocultar gr�ficas 2d
cla(handles.axes5,'reset')
%Ocultar los ejes mientras no se introduzca nada
set(handles.axes5,'Visible','off')

%C�digo fuente del bot�n Circunscritos
function btnCircunscritos_Callback(hObject, eventdata, handles)
set(handles.axes5,'Visible','off') %Ocultar el plano
cla(handles.axes5,'reset') %Ocultar la gr�fica 2d previa
set(handles.txtNotificacion,'String',''); %Mantener casillas en blanco
syms x; %Establecer la variable simb�lica
f=eval(get(handles.txtFuncion,'String')); %Guardar la funci�n
%CONVERSI�N A VALORES NUM�RICOS
a = str2num(get(handles.txtA,'String')); %Convertir valor del intervalo inicial
b = str2num(get(handles.txtB,'String')); %Convertir valor del intervalo final
n = str2num(get(handles.txtN,'String')); %Convertir valor de N
%Validar la entrada de una funci�n
if isempty(f)==1 
   set(handles.txtNotificacion,'String','Se debe introducir la funci�n')
   %Ocultar los ejes mientras no se introduzca nada
   set(handles.axes5,'Visible','off')
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
    dx=(b-a)/n; %Calcular "delta x" o intervalo entre rect�ngulos
    x1=a; %Asignar a x1 el valor inicial del intervalo
    x2=a+dx; %Obtener la suma de la cantidad de rect�ngulos m�s el valor inicial del intervalo
    hold on; %Mantener la cuadr�cula - DEBE DE COMENTARSE, NO ES RECOMENDADO EN INTERFACES GR�FICAS
    i=1; %Inicializar la variable iteradora de los bucles
    r=a:0.01:b; %Establecer los valores de la escala
    y=subs(f,r); %Sustituir los valores de la abcisa (DOMINIO) en la funci�n introducida
    plot(r,y,'b'); %Graficar el plano 
    axes(handles.axes5) %Mostrar ejes
    xlabel('Eje x');      %Impresi�n de etiqueta x
    ylabel('Eje y');      %Impresi�n de etiqueta y 
    title('�REA MAYOR') %Impresi�n del t�tulo en la gr�fica
    while i<=n %INICIO DEL CICLO
        v1=subs(f,x1); %Sustituir el valor de x1 en la funci�n
        v2=subs(f,x2);  %Sustituir el valor de x2 en la funci�n
        f1=abs(v1); %Obtener el valor absoluto de v1
        f2=abs(v2); %Obtener el valor absoluto de v2

        if f1>f2 %INICIO DE LA CONDICI�N DEL �REA MAYOR
            if v1<0 %INICIO DE LA CONDICI�N SI V1 ES NEGATIVO
                pause(1)  %Pausa para animaci�n
                rectangle('Position', [x1 double(v1) dx double(f1+0.001)],'FaceColor','Red'); %Impresi�n del rect�ngulo
                plot(r,y,'b') %Gr�fica
            else %Sino
                pause(1) %Pausa para animaci�n
                rectangle('Position', [x1 0 dx double(f1+0.001)],'FaceColor','Red'); %Impresi�n del rect�ngulo
                plot(r,y,'b') %Gr�fica
            end %Fin de la condici�n
        else %Sino
            if v2<0 %Inicio de la condici�n si V2 ES NEGATIVO
                pause(1); %Pausa para animaci�n
                rectangle('Position', [x1, double(v2), dx,double(f2+0.001)],'FaceColor','Red'); %Impresi�n del rect�ngulo
                plot(r,y,'b') %Gr�fica
            else %Sino
                pause(1); %Pausa para animaci�n
                rectangle('Position', [x1, 0, dx, double(f2+0.001)],'FaceColor','Red'); %Impresi�n del rect�ngulo
                plot(r,y,'b') %Gr�fica
            end   %Fin de la condici�n
        end%Fin de la condici�n
        x1=x1+dx;
        x2=x2+dx;
        i=i+1;
    end %FIN DEL CICLO 
end %Fin de la condici�n

% C�digo fuente del bot�n RIEMANN
function btnRiemann_Callback(hObject, eventdata, handles)
set(handles.axes5,'Visible','off') %Ocultar el plano
cla(handles.axes5,'reset') %Ocultar las gr�ficas 2d previas
set(handles.txtNotificacion,'String',''); %Mantener casillas en blanco
syms x; %Establecer la variable simb�lica
f=eval(get(handles.txtFuncion,'String')); %Guardar la funci�n
%CONVERSI�N A VALORES NUM�RICOS
a = str2num(get(handles.txtA,'String')); %Convertir valor del intervalo inicial
b = str2num(get(handles.txtB,'String')); %Convertir valor del intervalo final
n = str2num(get(handles.txtN,'String')); %Convertir valor de N

%Validar la entrada de una funci�n
if isempty(f)==1 
   set(handles.txtNotificacion,'String','Se debe introducir la funci�n')
   %Ocultar los ejes mientras no se introduzca nada
   set(handles.axes5,'Visible','off')
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
    dx=(b-a)/n;         %Calcular "delta x" o intervalo entre rect�ngulos
    x1=a;               %Asignar a x1 el primer valor del intervalo
    x2=a+dx;            %Calcular la suma del primer valor del intervalo m�s el intervalo de separaci�n
    hold on             %Mantener la cuadr�cula
    i=1;                %Inicializar variable iteradora
    r=a:0.01:b;          %Establecer el DOMINIO
    y=subs(f,r);           %Sustituir los valores de la abscisa en la funci�n
    plot(r,y,'b')          %Impresi�n del plano xy
    xlabel('Eje x');      %Impresi�n de etiqueta x
    ylabel('Eje y');      %Impresi�n de etiqueta y 
    title('�REA RIEMANN') %Impresi�n del t�tulo en la gr�fica
    axes(handles.axes5) %Mostrar ejes

    while i<=n %INICIO DEL CICLO DE ANIMACI�N
         pm=x1+(dx/2) %DETERMINAR LA SUMA DEL COMIENZO DEL INTERVALO M�S LA MITAD DEL INTERVALO DE DISTANCIA ENTRE RECT�NGULOS
         v=subs(f,pm) %DETERMINAR EL VALOR DE PM EVALUDADO EN LA FUNCI�N
         f1=abs(v) %DETERMINAR EL VALOR ABSOLUTO DE V

         if(v<0) %CONDICI�N EN CASO DE QUE V SEA NEGATIVO
             pause(1); %PAUSA DE ANIMACI�N
             rectangle('Position', [x1 double(v) dx double(f1+0.001)],'FaceColor','Red'); %CREACI�N DEL RECT�NGULO
         else %SINO
             pause(1); %PAUSA DE ANIMACI�N
             rectangle('Position', [x1 0 dx double(f1+0.001)],'FaceColor','Red'); %CREACI�N DEL RECT�NGULO
         end %FIN DE LA CONDICI�N
         x1=x1+dx; %INCREMENTO EN X1
         x2=x2+dx; %INCREMENTO EN X2
         i=i+1; %ACUMULACI�N C�CLICA
    end %FIN DEL CICLO
end %FIN DE LA CONDICI�N   