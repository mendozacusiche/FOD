program ejercicio2;

type
	arch_enteros = file of integer;
{procedimientos}
procedure RecorrerArch(var archNumeros:arch_enteros);
var
	cantidad   :integer;	
	promedio   :real;	
	sumaTotal  :integer;
	num	   :integer;	
begin	
	{inicializamos las variable a utillizar}
	cantidad  := 0;
	promedio  := 0;
	sumaTotal := 0;
	
	{abro el archivo exitente}
	reset(archNumeros);
	
 	{Recoremos el archivo}
                {se imprime los numeros}			
		writeln('LISTA DE NUMEROS');

	while(not eof(archNumeros))do
	begin
		{se obtiene un elemento desde el archivo}
		read(archNumeros, num);
		
		writeln(num);

		{cantidad de numeros menores a 1000}
		if(num < 1000)then begin
			cantidad:= cantidad +1;
		end;
		
		sumaTotal := sumaTotal + num;

		promedio  := (sumaTotal/cantidad); 
		
	end;
	{cierro el archivo}
	close(archNumeros);

	writeln('Esto es la cantidad de numeros menores a 1000: -',cantidad);
	writeln('El promedio total del archivo:-',promedio:2:2);
end;

{Programa principal}
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
	
	{hacemos un llamdo al proceso recorrer archivo}
	RecorrerArch(numeros);

end.
	
