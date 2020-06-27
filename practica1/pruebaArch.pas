program creacion_archivo;
type
 	persona = record
		dni: string[8];
		apellidoyNombre:string[30];
		direccion:String[40];
		sexo: char;
		salario: real;
	end;
	archivo_personas = file of persona;
var
	personas: archivo_personas;
	nombre_fisico: string[12];
	per: persona;
begin
	write('Ingrese el nombre del archivo: ');
	readln(nombre_fisico);
	{enlace entre el nombre lógico y el nombre fisico}

	assign(personas, nombre_fisico);

	{apertura del archivo para creación}
	rewrite(personas);

	{lectura del DNI una persona }
	writeln('Ingrese el DNI');
	readln(per.dni);
	
 	while(per.dni <> '')do begin
		{lectura del resto de los datos de la persona}
		writeln('Apeliido y Nombre');	
		readln(per.apellidoyNombre);
		writeln('Dieccion');
		readln(per.direccion);
		writeln('Sexo');
		readln(per.sexo);
		writeln('Salario');
		readln(per.salario);

		{escritura del registro de la persona en el archivo}
		write(personas, per);

		{lectura del dni de una nueva persona}
		writeln('Ingrese el DNI');	
		readln(per.dni);
	end;

	{cierre del archivo}
	close(personas);
end.
