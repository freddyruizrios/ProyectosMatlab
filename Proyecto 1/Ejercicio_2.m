%ALUMNOS:
%    KENER JOAN HERNANDES FLORES     2019-0021U
%    BRYAN MIGUEL ROSALES GALEANO    2019-0012U
%    FREDDY MANUEL RUIZ RIOS         2019-0027U
%GRUPO:
%    2M3-CO
%
%Limpiar Espacio de trabajo
clear all;
%Borrar pantalla
clc;
%Mensaje de Bienvenida para el usuario
disp("Estimado usuario, sea bienvenido")
%Solicitud del n�mero de elementos
cantidad_de_elementos=input('Ingrese la cantidad de n�meros con los que desea trabajar: ');

suma = 0; %Inicializar el valor de suma

for i=1:cantidad_de_elementos %Ciclo para almacenar los n�meros
    disp(['Introduzca un n�mero:',]); %Solicitar el n�mero
    A(i)=input(''); %Introducir el n�mero
    suma = suma + A(i) ;
end %Fin del ciclo

fprintf("--------------------------------RESPUESTAS-------------------------------------\n");

fprintf("N�MEROS PARES: \n"); %Indicaci�n de los n�meros pares
for i=1:cantidad_de_elementos %Ciclo para imprimir los n�meros pares
    if(mod(A(i),2)==0) %Determinar si el n�mero es par
        fprintf("%d \n",A(i)); %Imprimir el n�mero
    end %Fin de la condici�n
end %Fin del ciclo

fprintf("N�MEROS IMPARES: \n"); %Indicaci�n de los n�meros impares
for i=1:cantidad_de_elementos %Ciclo para imprimir los n�meros pares
    if(mod(A(i),2)~=0) %Determinar si el n�mero es impar
        fprintf("%d \n",A(i)); %Imprimir el n�mero
    end %Fin de la condici�n
end %Fin del ciclo

%Otra forma de resolver el bucle propuesto 
%for i=1:cantidad_de_elementos
%    if(mod(A(i),2)==0)
 %       fprintf("N�MEROS PARES:%d \n",A(i));
  %  else
    %    fprintf("El n�mero impar es: %d \n",A(i));
   % end
%end

fprintf("EL N�MERO MAYOR ES: %d \n", max(A)); %Impresi�n del n�mero mayor
fprintf("EL N�MERO MENOR ES: %d \n", min(A)); %Impresi�n del n�mero menor
fprintf("EL PROMEDIO ES: %.2f \n", (suma/cantidad_de_elementos));