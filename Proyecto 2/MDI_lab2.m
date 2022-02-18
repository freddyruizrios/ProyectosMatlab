%ALUMNOS:
%    KENER JOAN HERNANDES FLORES     2019-0021U
%    BRYAN MIGUEL ROSALES GALEANO    2019-0012U
%    FREDDY MANUEL RUIZ RIOS         2019-0027U
%GRUPO:
%    2M3-CO
%
function varargout = MDI_lab2(varargin)
%Comienzo de la inicialización del código - NO EDITAR
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @MDI_lab2_OpeningFcn, ...
                   'gui_OutputFcn',  @MDI_lab2_OutputFcn, ...
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
function MDI_lab2_OpeningFcn(hObject, eventdata, handles, varargin)
%Definición de objeto
handles.output = hObject;

%Actualización del manejo de la estructura
guidata(hObject, handles);

% --- Las salidas de esta función se devuelven a la línea de comando.
function varargout = MDI_lab2_OutputFcn(hObject, eventdata, handles) 
%matriz de celdas varargout para devolver argumentos de salida (ver VARARGOUT);
varargout{1} = handles.output;

%Menu desplegable "Gráfica de Funciones"
function graficaDeFunciones_Callback(hObject, eventdata, handles)
% hObject    handle to graficaDeFunciones (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%Menu desplegable "Cálculos designados"
function calculosDesignados_Callback(hObject, eventdata, handles)
% hObject    handle to calculosDesignados (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%Submenu "Derivar"
function derivar_Callback(hObject, eventdata, handles)
% hObject    handle to derivar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%Submenu "Integrar"
function integrar_Callback(hObject, eventdata, handles)
% hObject    handle to integrar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%Submenu "Cuadraticas"
function cuadraticas_Callback(hObject, eventdata, handles)
% hObject    handle to cuadraticas (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%Código fuente de axis para generar a la imagen impresa
function axes4_CreateFcn(hObject, eventdata, handles)
im=imread('presentacion.jpg'); %Leer el fichero
imshow(im) %Mostrar la imagen
