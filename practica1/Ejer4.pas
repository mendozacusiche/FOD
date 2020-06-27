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
		
		writeln(' LISTADO DE EMPLEADO ');
		write(' n° DE EMPLEADO:-',emp.numerodeEmpleado);
		write(' APELLIDO:-',emp.apellido);
		write(' NOMBRE:-',emp.nombre);
		write(' EDAD:-',emp.edad);
		write(' DNI:-',emp.DNI);
		writeln;
		writeln;
		
		if(emp.edad > 60)then begin
			writeln(' PROXIMOS A JUBILARSE');
			writeln(' n° DE EMPLEADO:-',emp.numerodeEmpleado);
			writeln(' APELLIDO:-',emp.apellido);
			writeln(' NOMBRE:-',emp.nombre);
			writeln(' EDAD:-',emp.edad);
			writeln(' DNI:-',emp.DNI);
		end;
		
	end;
	{Cerramos el archivo}
	close(Empleados);
end;

procedure Leer(var emp:Empleado);
begin
	{lecutura de los datos del empleado}
	writeln('APELLIDO');
	readln(emp.apellido);
	if(emp.apellido <> '')then begin
		writeln('INGRESE N° DE EMPLEADO');
		readln(Emp.numerodeEmpleado);
		writeln('NOMBRE');
		readln(Emp.nombre);
		writeln('EDAD');
		readln(Emp.edad);
	end;
end;

procedure AgreagarEmpleados(var Empleados:ArchivodeEmpleados);
var
	emp: Empleado; {para leer elemetos del archivo}
begin
	{dado que el archivo ya esta creado se debe de abrir como  de lectura y escritura}
	reset(Empleados);

	{nos Posicionamos al final del archivo}
	seek(Empleados, filesize(Empleados));

	writeln('Añadiremos mas empleados');

	{lectura de los datos de los empleados }
	Leer(emp);
	while(emp.apellido <> '')do begin
		{se agrega a un empleado al archivo}
		write(Empleados, emp);

		{lectura de otro datos de otro empleado}
		Leer(emp);
	end;
	{cierre del archivo}
	close(Empleados);

end;

procedure ModifiarEdad(var Empleados:ArchivodeEmpleados);
var
	numEmpleado:string[12];
	emp: Empleado;
begin
	writeln('Ingrese numero del empleado para modicar su edad');
	readln(numEmpleado);

	{dado que el archivo ya esta creado se debe de abrir como  de lectura y escritura}
	reset(Empleados);
	
	while(not eof(Empleados))do begin
		read(Empleados, emp);
		
		if(emp.numerodeEmpleado = numEmpleado)then begin
			writeln('Modifique la edad del empleado');
			readln(emp.edad);
			write(Empleados, emp);
		end;
		
	end;
	{cerramos el archivo}
	close(Empleados);
end;

procedure ExportarTXT(var Empleados:ArchivodeEmpleados);
var
	   nuevoArch:ArchivodeEmpleados;
 	   emp: Empleado;
begin
     reset(Empleados);

     assign(nuevoArch, 'empleados.txt');

     rewrite(nuevoArch);

     while(not eof(Empleados))do begin
           read(Empleados, emp);
           write(nuevoArch, emp);
     end;
     
     close(nuevoArch);
     close(Empleados);
     writeln('Archivo de empleados cargados en txt exitosamente');
end;

procedure SinDNI(var Empleados:ArchivodeEmpleados);
var
	sindni: ArchivodeEmpleados;
	emp:Empleado;
begin
	reset(Empleados);
	assign(sindni, 'faltaDNI.txt');
	
	rewrite(sindni);
	while(not eof(Empleados))do begin
		read(Empleados, emp);

 		if(emp.DNI = '00')then begin
			write(sindni,emp);
		end;
	end;
	{cerramos los archivos}
	close(sindni);
	close(Empleados);
      writeln('Archivo de empleados cargados en txt exitosamente');
end;

{Programa  principal}
var
	Empleados	: ArchivodeEmpleados;
	opcion	: char;
begin
	writeln('***********************************************');
	writeln('************** MENU DE OPCIONES ***************');
	writeln('***********************************************');
	writeln;

	{opciones del menu principal}
	writeln('************** INGRESE LA OPCION **************');
	writeln;
	writeln('  A:  Crear Archivo              ');
	writeln('  B:  Abrir Archivo Generado     ');
	writeln('  C:  Añadir Empleados al Archivo');
	writeln('  D:  Modificar Edad de Empleados');
	writeln('  E:  Exporta Archivo a Formato .txt');
	writeln('  F:  Exportar Empleados Sin DNI');
	writeln('  G:  Salir');
	writeln;
	readln(opcion);


	while(opcion <> 'G')do begin	

		case opcion of
			'A' : CrearArchivo(Empleados);
			'B' : AbrirArchivo(Empleados);
			'C' : AgreagarEmpleados(Empleados);
			'D' : ModifiarEdad(Empleados);
			'E' : ExportarTXT(Empleados);
			'F' : SinDNI(Empleados);
			'G' : exit
		end;

 		writeln('************** INGRESE LA OPCION **************');
		writeln;
		writeln('  A:  Crear Archivo              ');
		writeln('  B:  Abrir Archivo Generado     ');
		writeln('  C:  Añadir Empleados al Archivo');
		writeln('  D:  Modificar Edad de Empleados');
		writeln('  E:  Exporta Archivo a Formato .txt');
		writeln('  F:  Exportar Empleados Sin DNI');
		writeln('  G:  Salir');
		writeln;
		readln(opcion);
		
	end;
	{AbrirArchivo(Empleados);}
end.
