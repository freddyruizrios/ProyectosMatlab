%ALUMNOS:
%    KENER JOAN HERNANDES FLORES     2019-0021U
%    SINDY SUYEN PAVON CASTRO        2018-0342U
%    BRYAN MIGUEL ROSALES GALEANO    2019-0012U
%    FREDDY MANUEL RUIZ RIOS         2019-0027U
%GRUPO:
%    2M3-CO
%
%Establecer el menú que contiene los procesos necesarios que solicita la guía
z=menu('Seleccione el proceso que desea', '1. Solicitar 2 números y mostrar cual es el mayor, menor o decir si son iguales.', '2. Un menú de opciones que permita sumar, restar o multiplicar N números y mostrar el resultado.','3. Mostrar el discriminante de una ecuación cuadrática dada por el usuario.');

switch z
    case 1 %Mayor de dos números
        %Establecer aviso en el cuadro de diálogo interactivo con el usuario
        prompt={'Ingrese el valor del primer número', 'Ingrese el valor del segundo número'}; 
        %Establecer título del cuadro de diálogo interactivo con el usuario
        dlg_title='Ejercicio 1';
        %Establecer el número de líneas de texto para la lectura de datos
        num_lines=1;
        %Establecer líneas de texto limpias
        def={'',''};
        %Establecer el cuadro de diálogo interactivo con el usuario
        answer = inputdlg(prompt,dlg_title,num_lines,def);

        %Convertir las cadenas ingresadas por el usuario
        x=str2double(answer{1}); %Conversión a double del primer valor
        y=str2double(answer{2}); %Conversión a double del segundo valor

        if x>y %Primera condición de desigualdad
            msgbox(['El número mayor es: ' num2str(x) ' y el menor es: ' num2str(y)]);
        end

        if y>x %Segunda condición de desigualdad
                msgbox(['El número mayor es: ' num2str(y) ' y el menor es: ' num2str(x)]);
        end

        if x==y %Tercera condición de desigualdad
                msgbox(['Tanto ' num2str(x) ' como ' num2str(y) ' son números iguales']);
        end
%----------------------------------------------------------------------------------------------------------------        
    case 2 %Operaciones básicas de N números
        %Mostrar el menú de las operaciones básicas disponibles para el usuario
        m = menu('Seleccione la opción que desee', '1. Sumar', '2. Restar', '3. Multiplicación', '4. División');

        switch m %Selección de la operación básica elegida según el usuario
            case 1 %Proceso de la suma
                suma = 0; %Inicializar la variable encargada de dar la respuesta
                %Solicitud de la cantidad de números al usuario
                n=inputdlg('Ingrese la cantidad de números con los que desea trabajar: ');
                n=str2double(n{1}); %Lectura de la cantidad de número

                for i=1:n %Ciclo encargado de leer los números y sumarlos
                   numero=inputdlg('Ingrese el número: '); %Solicitar los números
                   numero=str2double(numero{1});  %Lectura de los números   
                   suma=suma+numero; %Sumar los números
                end %Fin del ciclo    

                %Mostrar la respuesta
                msgbox(['La suma correspondiente es: ' num2str(suma)])

            case 2 %Proceso de la resta
                resta = 0; %Inicializar la variable encargada de dar la respuesta
                %Solicitud de la cantidad de números al usuario
                n=inputdlg('Ingrese la cantidad de números con los que desea trabajar: ');
                n=str2double(n{1}); %Lectura de la cantidad de número

                for i=1:n %Ciclo encargado de leer los números y sumarlos
                   numero=inputdlg('Ingrese el número: '); %Solicitar los números
                   numero=str2double(numero{1});  %Lectura de los números   
                   resta=numero-resta; %Sumar los números
                end %Fin del ciclo    

                %Mostrar la respuesta
                msgbox(['La resta correspondiente es: ' num2str((resta*-1))])    

            case 3 %Proceso de la multiplicación
                multiplicacion = 1; %Inicializar la variable encargada de dar la respuesta
                %Solicitud de la cantidad de números al usuario
                n=inputdlg('Ingrese la cantidad de números con los que desea trabajar: ');
                n=str2double(n{1}); %Lectura de la cantidad de número

                for i=1:n %Ciclo encargado de leer los números y sumarlos
                   numero=inputdlg('Ingrese el número: '); %Solicitar los números
                   numero=str2double(numero{1});  %Lectura de los números   
                   multiplicacion=(multiplicacion*numero); %Sumar los números
                end %Fin del ciclo    

                %Mostrar la respuesta
                msgbox(['La multiplicación correspondiente es: ' num2str(multiplicacion)])

            case 4 %Proceso de la división
                division=1;
                %Solicitud de la cantidad de números al usuario
                n=inputdlg('Ingrese la cantidad de números con los que desea trabajar: ');
                n=str2double(n{1}); %Lectura de la cantidad de número

                for i=1:n %Ciclo encargado de leer los números y sumarlos
                   numero=inputdlg('Ingrese el número: '); %Solicitar los números
                   numero=str2double(numero{1});  %Lectura de los números   
                   division=numero/division; %Sumar los números
                end %Fin del ciclo    

                %Mostrar la respuesta
                msgbox(['El cociente correspondiente es: ' num2str((1/division))])
        end %Fin el switch
%----------------------------------------------------------------------------------------------------------------    
    case 3 %Calcular valor del discriminante
        %Establecer aviso en el cuadro de diálogo interactivo con el usuario
        prompt={'Ingrese el valor de a', 'Ingrese el valor de b', 'Ingrese el valor de c'}; 
        %Establecer título del cuadro de diálogo interactivo con el usuario
        dlg_title='Ejercicio 3';
        %Establecer el número de líneas de texto para la lectura de datos
        num_lines=1;
        %Establecer líneas de texto limpias
        def={'','',''};
        %Establecer el cuadro de diálogo interactivo con el usuario
        answer = inputdlg(prompt,dlg_title,num_lines,def);

        %Convertir las cadenas ingresadas por el usuario
        a=str2double(answer{1}); %Conversión a double del primer valor
        b=str2double(answer{2}); %Conversión a double del segundo valor
        c=str2double(answer{3}); %Conversión a double del segundo valor

        discriminante = b^2-4*a*c; %Calcular el valor del discriminante

        %Mostrar respuesta
        msgbox(['El discriminante corresponde al valor de: ' num2str(discriminante)]);        
end %FIN DEL PROGRAMA