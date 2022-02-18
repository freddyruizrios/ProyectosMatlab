%ALUMNOS:
%    KENER JOAN HERNANDES FLORES     2019-0021U
%    SINDY SUYEN PAVON CASTRO        2018-0342U
%    BRYAN MIGUEL ROSALES GALEANO    2019-0012U
%    FREDDY MANUEL RUIZ RIOS         2019-0027U
%GRUPO:
%    2M3-CO
%
%Establecer el men� que contiene los procesos necesarios que solicita la gu�a
z=menu('Seleccione el proceso que desea', '1. Solicitar 2 n�meros y mostrar cual es el mayor, menor o decir si son iguales.', '2. Un men� de opciones que permita sumar, restar o multiplicar N n�meros y mostrar el resultado.','3. Mostrar el discriminante de una ecuaci�n cuadr�tica dada por el usuario.');

switch z
    case 1 %Mayor de dos n�meros
        %Establecer aviso en el cuadro de di�logo interactivo con el usuario
        prompt={'Ingrese el valor del primer n�mero', 'Ingrese el valor del segundo n�mero'}; 
        %Establecer t�tulo del cuadro de di�logo interactivo con el usuario
        dlg_title='Ejercicio 1';
        %Establecer el n�mero de l�neas de texto para la lectura de datos
        num_lines=1;
        %Establecer l�neas de texto limpias
        def={'',''};
        %Establecer el cuadro de di�logo interactivo con el usuario
        answer = inputdlg(prompt,dlg_title,num_lines,def);

        %Convertir las cadenas ingresadas por el usuario
        x=str2double(answer{1}); %Conversi�n a double del primer valor
        y=str2double(answer{2}); %Conversi�n a double del segundo valor

        if x>y %Primera condici�n de desigualdad
            msgbox(['El n�mero mayor es: ' num2str(x) ' y el menor es: ' num2str(y)]);
        end

        if y>x %Segunda condici�n de desigualdad
                msgbox(['El n�mero mayor es: ' num2str(y) ' y el menor es: ' num2str(x)]);
        end

        if x==y %Tercera condici�n de desigualdad
                msgbox(['Tanto ' num2str(x) ' como ' num2str(y) ' son n�meros iguales']);
        end
%----------------------------------------------------------------------------------------------------------------        
    case 2 %Operaciones b�sicas de N n�meros
        %Mostrar el men� de las operaciones b�sicas disponibles para el usuario
        m = menu('Seleccione la opci�n que desee', '1. Sumar', '2. Restar', '3. Multiplicaci�n', '4. Divisi�n');

        switch m %Selecci�n de la operaci�n b�sica elegida seg�n el usuario
            case 1 %Proceso de la suma
                suma = 0; %Inicializar la variable encargada de dar la respuesta
                %Solicitud de la cantidad de n�meros al usuario
                n=inputdlg('Ingrese la cantidad de n�meros con los que desea trabajar: ');
                n=str2double(n{1}); %Lectura de la cantidad de n�mero

                for i=1:n %Ciclo encargado de leer los n�meros y sumarlos
                   numero=inputdlg('Ingrese el n�mero: '); %Solicitar los n�meros
                   numero=str2double(numero{1});  %Lectura de los n�meros   
                   suma=suma+numero; %Sumar los n�meros
                end %Fin del ciclo    

                %Mostrar la respuesta
                msgbox(['La suma correspondiente es: ' num2str(suma)])

            case 2 %Proceso de la resta
                resta = 0; %Inicializar la variable encargada de dar la respuesta
                %Solicitud de la cantidad de n�meros al usuario
                n=inputdlg('Ingrese la cantidad de n�meros con los que desea trabajar: ');
                n=str2double(n{1}); %Lectura de la cantidad de n�mero

                for i=1:n %Ciclo encargado de leer los n�meros y sumarlos
                   numero=inputdlg('Ingrese el n�mero: '); %Solicitar los n�meros
                   numero=str2double(numero{1});  %Lectura de los n�meros   
                   resta=numero-resta; %Sumar los n�meros
                end %Fin del ciclo    

                %Mostrar la respuesta
                msgbox(['La resta correspondiente es: ' num2str((resta*-1))])    

            case 3 %Proceso de la multiplicaci�n
                multiplicacion = 1; %Inicializar la variable encargada de dar la respuesta
                %Solicitud de la cantidad de n�meros al usuario
                n=inputdlg('Ingrese la cantidad de n�meros con los que desea trabajar: ');
                n=str2double(n{1}); %Lectura de la cantidad de n�mero

                for i=1:n %Ciclo encargado de leer los n�meros y sumarlos
                   numero=inputdlg('Ingrese el n�mero: '); %Solicitar los n�meros
                   numero=str2double(numero{1});  %Lectura de los n�meros   
                   multiplicacion=(multiplicacion*numero); %Sumar los n�meros
                end %Fin del ciclo    

                %Mostrar la respuesta
                msgbox(['La multiplicaci�n correspondiente es: ' num2str(multiplicacion)])

            case 4 %Proceso de la divisi�n
                division=1;
                %Solicitud de la cantidad de n�meros al usuario
                n=inputdlg('Ingrese la cantidad de n�meros con los que desea trabajar: ');
                n=str2double(n{1}); %Lectura de la cantidad de n�mero

                for i=1:n %Ciclo encargado de leer los n�meros y sumarlos
                   numero=inputdlg('Ingrese el n�mero: '); %Solicitar los n�meros
                   numero=str2double(numero{1});  %Lectura de los n�meros   
                   division=numero/division; %Sumar los n�meros
                end %Fin del ciclo    

                %Mostrar la respuesta
                msgbox(['El cociente correspondiente es: ' num2str((1/division))])
        end %Fin el switch
%----------------------------------------------------------------------------------------------------------------    
    case 3 %Calcular valor del discriminante
        %Establecer aviso en el cuadro de di�logo interactivo con el usuario
        prompt={'Ingrese el valor de a', 'Ingrese el valor de b', 'Ingrese el valor de c'}; 
        %Establecer t�tulo del cuadro de di�logo interactivo con el usuario
        dlg_title='Ejercicio 3';
        %Establecer el n�mero de l�neas de texto para la lectura de datos
        num_lines=1;
        %Establecer l�neas de texto limpias
        def={'','',''};
        %Establecer el cuadro de di�logo interactivo con el usuario
        answer = inputdlg(prompt,dlg_title,num_lines,def);

        %Convertir las cadenas ingresadas por el usuario
        a=str2double(answer{1}); %Conversi�n a double del primer valor
        b=str2double(answer{2}); %Conversi�n a double del segundo valor
        c=str2double(answer{3}); %Conversi�n a double del segundo valor

        discriminante = b^2-4*a*c; %Calcular el valor del discriminante

        %Mostrar respuesta
        msgbox(['El discriminante corresponde al valor de: ' num2str(discriminante)]);        
end %FIN DEL PROGRAMA