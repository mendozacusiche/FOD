program CrearArchivo;
type
	Persona = record
		DNI: string[8];
		ApellidoyNombre:string[30];
		Direccion: string[40];
		Sexo:char;
		Salario: real;
	end;
	ArchivodePersonas = file of Persona;

{procedimientos}
procedure Recorrido(var Personas:ArchivodePersonas);
var
	Per: Persona;   {para leer el elementos del archivo} 
begin

	{dado que el archivo esta creado, debe abrirse como de lectura/escritura}
	reset(Personas);

	while(not eof(Personas))do
	     begin
		  {se obtiene un elemento desde archivo}
		  read(Personas, Per);
		  
		  {se presenta por pantallaca dato del elemento leido}
		   writeln('ESTOS SON LOS DATOS DEL USUARIO');
		   writeln('{',per.DNI,'}');
		   writeln('{',per.ApellidoyNombre,'}');
		   writeln('{',per.Direccion,'}');
	  	   writeln('{',per.Sexo,'}');
		   writeln('{',per.Salario,'}');
		   writeln;
	     end;
	{cierre del archivo}
	close(Personas);
end;	
{programa principal}
var 
	Personas      : ArchivodePersonas;
	NombreFisico  : string[12];
	per 	      : Persona;
begin

	write('Ingrese el nombre del archivo: ');
	readln(NombreFisico);

	{enlace entre el nombre lógico y el nombre fisico0}
	assign(Personas, NombreFisico);
	
	{apertura del archivo para creación}
	rewrite(Personas);
	
	{lectura del DNI de una persona}
	writeln('Ingrese el DNI');
	readln(per.DNI);

	while(per.Dni <> '')do
	     begin
			{lectura del resto de datos de la persona}
			writeln('Apellido y su Nombre');			
			readln(per.ApellidoyNombre);
			writeln('Direccion');			
			readln(per.Direccion);
			writeln('Sexo');			
			readln(per.Sexo);
			writeln('Salario');			
			readln(per.Salario);

			{escritura del registro de la persona}
			write(Personas, per);
			
			{lectura del DNI de una nueva persona}
			writeln('Ingrese el DNI');
			readln(per.DNI);
			
	     end;

	{Cierre del archivo}
	close(Personas);

	{llamamos al proceso para que imprima los datos del archivo }
	Recorrido(Personas);

end.



















