%ALUMNOS:
%    KENER JOAN HERNANDES FLORES     2019-0021U
%    SINDY SUYEN PAVON CASTRO        2018-0342U
%    BRYAN MIGUEL ROSALES GALEANO    2019-0012U
%    FREDDY MANUEL RUIZ RIOS         2019-0027U
%GRUPO:
%    2M3-CO
%
function varargout = Presentacion(varargin)
%Comienzo de la inicializaci�n del c�digo - NO EDITAR
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Presentacion_OpeningFcn, ...
                   'gui_OutputFcn',  @Presentacion_OutputFcn, ...
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
function Presentacion_OpeningFcn(hObject, eventdata, handles, varargin)
%Definici�n de objeto
handles.output = hObject;

%Actualizaci�n del manejo de la estructura
guidata(hObject, handles);

% --- Las salidas de esta funci�n se devuelven a la l�nea de comando.
function varargout = Presentacion_OutputFcn(hObject, eventdata, handles) 
%matriz de celdas varargout para devolver argumentos de salida (ver VARARGOUT);
varargout{1} = handles.output;

%C�digo fuente para introducir el logo de la UNI
function axes7_CreateFcn(hObject, eventdata, handles)
im=imread('logoUni.png'); %Leer el fichero
imshow(im) %Mostrar la imagen


%C�digo fuente para introducir una el logo de la FEC
function axes8_CreateFcn(hObject, eventdata, handles)
im2=imread('logoFEC.jpg'); %Leer el fichero
imshow(im2) %Mostrar la imagen
