%ALUMNOS:
%    KENER JOAN HERNANDES FLORES     2019-0021U
%    SINDY SUYEN PAVON CASTRO        2018-0342U
%    BRYAN MIGUEL ROSALES GALEANO    2019-0012U
%    FREDDY MANUEL RUIZ RIOS         2019-0027U
%GRUPO:
%    2M3-CO
%
function varargout = AreasdeFunciones(varargin)
%Comienzo de la inicialización del código - NO EDITAR
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
% Fin de la inicialización del código - NO EDITAR

%Ejecución de la visibilidad de las funciones lineales
function AreasdeFunciones_OpeningFcn(hObject, eventdata, handles, varargin)
%Ocultar los ejes mientras no se introduzca nada
cla(handles.axes5,'reset')
set(handles.axes5,'Visible','off')
%Definición de objeto
handles.output = hObject;

%Actualización del manejo de la estructura
guidata(hObject, handles);

% --- Las salidas de esta función se devuelven a la línea de comando.
function varargout = AreasdeFunciones_OutputFcn(hObject, eventdata, handles) 
%matriz de celdas varargout para devolver argumentos de salida (ver VARARGOUT);
varargout{1} = handles.output;

%Código fuente de txtFuncion
function txtFuncion_Callback(hObject, eventdata, handles)

%Función de txtFuncion
function txtFuncion_CreateFcn(hObject, eventdata, handles)
%Aplicar propiedades
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

%Código fuente de txtA
function txtA_Callback(hObject, eventdata, handles)
%

%Función de txtA
function txtA_CreateFcn(hObject, eventdata, handles)
%Aplicar propiedades
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

%Código fuente de txtB
function txtB_Callback(hObject, eventdata, handles)
%

%Función de txtB
function txtB_CreateFcn(hObject, eventdata, handles)
%Aplicar condiciones
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

%Código fuente de txtN
function txtN_Callback(hObject, eventdata, handles)
%

%Función de txtN
function txtN_CreateFcn(hObject, eventdata, handles)
%Aplicar propiedades
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

%Código fuente del botón REGRESAR A LA PRESENTACIÓN
function btnRegresar_Callback(hObject, eventdata, handles)
close(AreasdeFunciones) %Cerrar interfaz para realizar las gráficas solicitadas
Presentacion %Abrir interfaz de Presentación

%Código fuente del botón INSCRITOS
function btnInscritos_Callback(hObject, eventdata, handles)
set(handles.txtNotificacion,'String',''); %Mantener casillas en blanco
set(handles.axes5,'Visible','off') %Ocultar el plano
cla(handles.axes5,'reset') %Ocultar la gráfica 2d previa
syms x; %Establecer la variable simbólica
f=eval(get(handles.txtFuncion,'String')); %Guardar la función
%CONVERSIÓN A VALORES NUMÉRICOS
a = str2num(get(handles.txtA,'String')); %Convertir valor del intervalo inicial
b = str2num(get(handles.txtB,'String')); %Convertir valor del intervalo final
n = str2num(get(handles.txtN,'String')); %Convertir valor de N
%Validar la entrada de una función
if isempty(f)==1 
   set(handles.txtNotificacion,'String','Se debe introducir la función');
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
    dx=(b-a)/n; %Calcular "delta x" o intervalo entre rectángulos
    x1=a; %Asignar a x1 el valor inicial del intervalo
    x2=a+dx; %Obtener la suma de la cantidad de rectángulos más el valor inicial del intervalo
    hold on; %Mantener la cuadrícula - DEBE DE COMENTARSE, NO ES RECOMENDADO EN INTERFACES GRÁFICAS
    i=1; %Inicializar la variable iteradora de los bucles
    r=a:0.01:b; %Establecer los valores de la escala
    y=subs(f,r); %Sustituir los valores de la abcisa (DOMINIO) en la función introducida
    %figure,
    plot(r,y); %Graficar el plano
    xlabel('Eje x');      %Impresión de etiqueta x
    ylabel('Eje y');      %Impresión de etiqueta y 
    title('ÁREA MENOR') %Impresión del título en la gráfica
    axes(handles.axes5) %Mostrar ejes

    while i<=n %INICIO DEL CICLO
         v1=subs(f,x1); %Sustituir el valor de x1 en la función
         v2=subs(f,x2); %Sustituir el valor de x2 en la función
         f1=abs(v1); %Obtener el valor absoluto de v1
         f2=abs(v2); %Obtener el valor absoluto de v2
         
         if f1<f2 %INICIO DE LA CONDICIÓN DEL ÁREA MENOR
             if v1<0 %INICIO DE LA CONDICIÓN SI V1 ES NEGATIVO
                 pause(1) %Pausa para animación
                 rectangle('Position', [x1 double(v1) dx double(f1+0.001)],'FaceColor','Red'); %Impresión del rectángulo
             else %Sino
                 pause(1) %Pausa para animación
                 rectangle('Position', [x1 0 dx double(f1+0.001)],'FaceColor','Red'); %Impresión del rectángulo
             end %FIN DE LA CONDICIÓN
         else %Sino
             if v2<0 %INICIO DE LA CONDICIÓN SI V2 ES NEGATIVO
                 pause(1) %Pausa para animación
                 rectangle('Position', [x1, double(v2), dx,double(f2+0.001)],'FaceColor','Red'); %Impresión del rectángulo
             else
                 pause(1); %Pausa para animación
                 rectangle('Position', [x1, 0, dx, double(f2+0.001)],'FaceColor','Red'); %Impresión del rectángulo
             end %FIN DE LA CONDICIÓN
         end %FIN DE LA CONDICIÓN DEL ÁREA MENOR
        x1=x1+dx; %Incrementar la variable x1
        x2=x2+dx; %Incrementar la variable x2
        i=i+1;%Incremento de la iteración que contiene la animación
    end %FIN DEL CICLO
end %Fin de la condición

% Código fuente del botón LIMPIAR PANTALLA
function btnLimpiarPantalla_Callback(hObject, eventdata, handles)
set(handles.txtFuncion,'String',''); %Limpiar casilla  
set(handles.txtNotificacion,'String',''); %Limpiar casilla
set(handles.txtA,'String',''); %Limpiar casilla
set(handles.txtB,'String','') %Limpiar casilla
set(handles.txtN,'String','') %Limpiar casilla
%Ocultar gráficas 2d
cla(handles.axes5,'reset')
%Ocultar los ejes mientras no se introduzca nada
set(handles.axes5,'Visible','off')

%Código fuente del botón Circunscritos
function btnCircunscritos_Callback(hObject, eventdata, handles)
set(handles.axes5,'Visible','off') %Ocultar el plano
cla(handles.axes5,'reset') %Ocultar la gráfica 2d previa
set(handles.txtNotificacion,'String',''); %Mantener casillas en blanco
syms x; %Establecer la variable simbólica
f=eval(get(handles.txtFuncion,'String')); %Guardar la función
%CONVERSIÓN A VALORES NUMÉRICOS
a = str2num(get(handles.txtA,'String')); %Convertir valor del intervalo inicial
b = str2num(get(handles.txtB,'String')); %Convertir valor del intervalo final
n = str2num(get(handles.txtN,'String')); %Convertir valor de N
%Validar la entrada de una función
if isempty(f)==1 
   set(handles.txtNotificacion,'String','Se debe introducir la función')
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
    dx=(b-a)/n; %Calcular "delta x" o intervalo entre rectángulos
    x1=a; %Asignar a x1 el valor inicial del intervalo
    x2=a+dx; %Obtener la suma de la cantidad de rectángulos más el valor inicial del intervalo
    hold on; %Mantener la cuadrícula - DEBE DE COMENTARSE, NO ES RECOMENDADO EN INTERFACES GRÁFICAS
    i=1; %Inicializar la variable iteradora de los bucles
    r=a:0.01:b; %Establecer los valores de la escala
    y=subs(f,r); %Sustituir los valores de la abcisa (DOMINIO) en la función introducida
    plot(r,y,'b'); %Graficar el plano 
    axes(handles.axes5) %Mostrar ejes
    xlabel('Eje x');      %Impresión de etiqueta x
    ylabel('Eje y');      %Impresión de etiqueta y 
    title('ÁREA MAYOR') %Impresión del título en la gráfica
    while i<=n %INICIO DEL CICLO
        v1=subs(f,x1); %Sustituir el valor de x1 en la función
        v2=subs(f,x2);  %Sustituir el valor de x2 en la función
        f1=abs(v1); %Obtener el valor absoluto de v1
        f2=abs(v2); %Obtener el valor absoluto de v2

        if f1>f2 %INICIO DE LA CONDICIÓN DEL ÁREA MAYOR
            if v1<0 %INICIO DE LA CONDICIÓN SI V1 ES NEGATIVO
                pause(1)  %Pausa para animación
                rectangle('Position', [x1 double(v1) dx double(f1+0.001)],'FaceColor','Red'); %Impresión del rectángulo
                plot(r,y,'b') %Gráfica
            else %Sino
                pause(1) %Pausa para animación
                rectangle('Position', [x1 0 dx double(f1+0.001)],'FaceColor','Red'); %Impresión del rectángulo
                plot(r,y,'b') %Gráfica
            end %Fin de la condición
        else %Sino
            if v2<0 %Inicio de la condición si V2 ES NEGATIVO
                pause(1); %Pausa para animación
                rectangle('Position', [x1, double(v2), dx,double(f2+0.001)],'FaceColor','Red'); %Impresión del rectángulo
                plot(r,y,'b') %Gráfica
            else %Sino
                pause(1); %Pausa para animación
                rectangle('Position', [x1, 0, dx, double(f2+0.001)],'FaceColor','Red'); %Impresión del rectángulo
                plot(r,y,'b') %Gráfica
            end   %Fin de la condición
        end%Fin de la condición
        x1=x1+dx;
        x2=x2+dx;
        i=i+1;
    end %FIN DEL CICLO 
end %Fin de la condición

% Código fuente del botón RIEMANN
function btnRiemann_Callback(hObject, eventdata, handles)
set(handles.axes5,'Visible','off') %Ocultar el plano
cla(handles.axes5,'reset') %Ocultar las gráficas 2d previas
set(handles.txtNotificacion,'String',''); %Mantener casillas en blanco
syms x; %Establecer la variable simbólica
f=eval(get(handles.txtFuncion,'String')); %Guardar la función
%CONVERSIÓN A VALORES NUMÉRICOS
a = str2num(get(handles.txtA,'String')); %Convertir valor del intervalo inicial
b = str2num(get(handles.txtB,'String')); %Convertir valor del intervalo final
n = str2num(get(handles.txtN,'String')); %Convertir valor de N

%Validar la entrada de una función
if isempty(f)==1 
   set(handles.txtNotificacion,'String','Se debe introducir la función')
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
    dx=(b-a)/n;         %Calcular "delta x" o intervalo entre rectángulos
    x1=a;               %Asignar a x1 el primer valor del intervalo
    x2=a+dx;            %Calcular la suma del primer valor del intervalo más el intervalo de separación
    hold on             %Mantener la cuadrícula
    i=1;                %Inicializar variable iteradora
    r=a:0.01:b;          %Establecer el DOMINIO
    y=subs(f,r);           %Sustituir los valores de la abscisa en la función
    plot(r,y,'b')          %Impresión del plano xy
    xlabel('Eje x');      %Impresión de etiqueta x
    ylabel('Eje y');      %Impresión de etiqueta y 
    title('ÁREA RIEMANN') %Impresión del título en la gráfica
    axes(handles.axes5) %Mostrar ejes

    while i<=n %INICIO DEL CICLO DE ANIMACIÓN
         pm=x1+(dx/2) %DETERMINAR LA SUMA DEL COMIENZO DEL INTERVALO MÁS LA MITAD DEL INTERVALO DE DISTANCIA ENTRE RECTÁNGULOS
         v=subs(f,pm) %DETERMINAR EL VALOR DE PM EVALUDADO EN LA FUNCIÓN
         f1=abs(v) %DETERMINAR EL VALOR ABSOLUTO DE V

         if(v<0) %CONDICIÓN EN CASO DE QUE V SEA NEGATIVO
             pause(1); %PAUSA DE ANIMACIÓN
             rectangle('Position', [x1 double(v) dx double(f1+0.001)],'FaceColor','Red'); %CREACIÓN DEL RECTÁNGULO
         else %SINO
             pause(1); %PAUSA DE ANIMACIÓN
             rectangle('Position', [x1 0 dx double(f1+0.001)],'FaceColor','Red'); %CREACIÓN DEL RECTÁNGULO
         end %FIN DE LA CONDICIÓN
         x1=x1+dx; %INCREMENTO EN X1
         x2=x2+dx; %INCREMENTO EN X2
         i=i+1; %ACUMULACIÓN CÍCLICA
    end %FIN DEL CICLO
end %FIN DE LA CONDICIÓN   