program ejercicio3;
type
	Empleado = record
		numerodeEmpleado 	:string[12];
		apellido		:string[12];
 		nombre		:string[12];
		edad			:integer;
		DNI			:string[8];
	end;
 	ArchivodeEmpleados = file of Empleado;
{procesos del programa principal}
procedure CrearArchivo(var Empleados: ArchivodeEmpleados);
var
	Emp			:Empleado;
	NombreFisico	:string[15];
begin
	writeln('Ingrese el nombre del archivo: ');
	readln(NombreFisico);
	
	{enlace entre el nombre logico y el nombre fisico}
	assign(Empleados, NombreFisico);

	{apertura del archivo para creacion}
	rewrite(Empleados);

	{lecutura de los datos del empleado}
	writeln('APELLIDO');
	readln(Emp.apellido);
	
	while(Emp.apellido <> '')do begin
		writeln('INGRESE N° DE EMPLEADO');
		readln(Emp.numerodeEmpleado);
		
		writeln('NOMBRE');
		readln(Emp.nombre);
		writeln('EDAD');
		readln(Emp.edad);
		writeln('DNI');
		readln(Emp.DNI);
		
		{escribimos el registro empleado en el archivo}
		write(Empleados, Emp);

		
		writeln('APELLIDO');
		readln(Emp.apellido);

	end;
	{cierre del archivo}
	close(Empleados);

end;

procedure AbrirArchivo(var Empleados: ArchivodeEmpleados);
var
	emp:Empleado ;  {para leer el elemento del archivo}
	apellido:string[12]; 
begin
	{dado que  el archivo esta creado, deve abrisrs como de lectura/ escritura}
       writeln('ingrese un apellido a buscar en el archivo');
	 readln(apellido);

	reset(Empleados);
	
	while(not eof(Empleados))do begin
		{se obtien un elemento desde el archivo}
		read(Empleados, emp);
		
             if(emp.apellido = apellido)then begin
			writeln('DATOS DEL USUARIO BUSCADO');
			writeln('N° de empleado:-',emp.numerodeEmpleado);
			writeln('Apellido:-',emp.apellido);
			writeln('Nombre:-',emp.nombre);
			writeln('Edad:-',emp.edad);
			writeln('DNI:-',emp.DNI);
     		  end;
		
		writeln('LISTADO DE EMPLEADO');
		write('n° DE EMPLEADO:-',emp.numerodeEmpleado);
		write('APELLIDO:-',emp.apellido);
		write('NOMBRE:-',emp.nombre);
		write('EDAD:-',emp.edad);
		write('DNI:-',emp.DNI);
		writeln;
		writeln;
		
		if(emp.edad > 60)then begin
			writeln('PROXIMOS A JUBILARSE');
			writeln('n° DE EMPLEADO:-',emp.numerodeEmpleado);
			writeln('APELLIDO:-',emp.apellido);
			writeln('NOMBRE:-',emp.nombre);
			writeln('EDAD:-',emp.edad);
			writeln('DNI:-',emp.DNI);
		end;
		
	end;
	{Cerramos el archivo}
	close(Empleados);
end;

{Programa  principal}
var
	Empleados	: ArchivodeEmpleados;
	opcion	: char;
begin
	writeln('*********************************************');
	writeln('**************MENU DE OPCIONES***************');
	writeln('*********************************************');
	writeln;

	{opciones del menu principal}
	writeln('************** INGRESE LA OPCION **************');
	writeln;
	writeln;
	writeln('  A:  Crear Archivo          ');
	writeln('  B:  Abrir Archivo Generado ');
	writeln('  C:  Salir                  ');
	writeln;
	readln(opcion);


	while(opcion <> 'C')do begin	

		case opcion of
			'A' : CrearArchivo(Empleados);
			'B' : AbrirArchivo(Empleados);
			'C' : exit;
		end;

				{opciones del menu principal}
		writeln('************** INGRESE LA OPCION **************');
		writeln;
		writeln;
		writeln('  A:  Crear Archivo          ');
		writeln('  B:  Abrir Archivo Generado ');
		writeln('  C:  Salir                  ');
		writeln;
		readln(opcion);
	end;
	{AbrirArchivo(Empleados);}
end.

