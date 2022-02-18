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
%Solicitud del número de elementos
cantidad_de_elementos=input('Ingrese la cantidad de números con los que desea trabajar: ');

suma = 0; %Inicializar el valor de suma

for i=1:cantidad_de_elementos %Ciclo para almacenar los números
    disp(['Introduzca un número:',]); %Solicitar el número
    A(i)=input(''); %Introducir el número
    suma = suma + A(i) ;
end %Fin del ciclo

fprintf("--------------------------------RESPUESTAS-------------------------------------\n");

fprintf("NÚMEROS PARES: \n"); %Indicación de los números pares
for i=1:cantidad_de_elementos %Ciclo para imprimir los números pares
    if(mod(A(i),2)==0) %Determinar si el número es par
        fprintf("%d \n",A(i)); %Imprimir el número
    end %Fin de la condición
end %Fin del ciclo

fprintf("NÚMEROS IMPARES: \n"); %Indicación de los números impares
for i=1:cantidad_de_elementos %Ciclo para imprimir los números pares
    if(mod(A(i),2)~=0) %Determinar si el número es impar
        fprintf("%d \n",A(i)); %Imprimir el número
    end %Fin de la condición
end %Fin del ciclo

%Otra forma de resolver el bucle propuesto 
%for i=1:cantidad_de_elementos
%    if(mod(A(i),2)==0)
 %       fprintf("NÚMEROS PARES:%d \n",A(i));
  %  else
    %    fprintf("El número impar es: %d \n",A(i));
   % end
%end

fprintf("EL NÚMERO MAYOR ES: %d \n", max(A)); %Impresión del número mayor
fprintf("EL NÚMERO MENOR ES: %d \n", min(A)); %Impresión del número menor
fprintf("EL PROMEDIO ES: %.2f \n", (suma/cantidad_de_elementos));