program ejercicio1;

type
	arch_enteros = file of integer;

var	
	numero:integer;
	nombre_fisico: string[15];
	numeros: arch_enteros;
begin

	writeln('Ingrese el nombre del Archivo: ');
	readln(nombre_fisico);
	
	{enlace entre el nombre logico y el nombre fisico}
	assign(numeros,nombre_fisico);
	
	{apertura del archivo para crearcion}
	rewrite(numeros);

	{lectura del primer numero}
	writeln('Ingrese un numero entero');
	readln(numero);

	while(numero <> 10000) do begin

		{Escritura del numero al archivo}
		write(numeros,numero);
		
		writeln('Ingrese un numero entero');
		readln(numero);
	end;

	{Cierre del archivo}
	close(numeros);
end.
	

