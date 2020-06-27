program ejercicio7;
	
const 
	ruta = '/home/abelardo/Escritorio/novelas.txt';
type
	cadena = string[20];
	novela = record
		cod :integer;
		precio :real;
		genero:cadena;
            nombre:cadena;
	end;
	ArchNovelas = file of novela;

procedure crearArch(var novelas:ArchNovelas; var carga: text);
var
	nove: novela;
begin
	reset(carga);
	
	rewrite(novelas);
	while(not eof(carga))do begin
		with nove do begin
		  readln(carga, cod, precio, genero);
	     	  readln(carga, nombre);

		 write(novelas, nove); {se escribe en el archivo binario}
		end;		
	end;
	writeln('archivo cargado exitosamente')
	writeln;
	close(novelas);
	close(carga);
	
end;

procedure Actualizar(var novelas: ArchNovelas);
var
	nove: novela;
	nombre = cadena;
begin
	writeln('ingrese la novela que desea modificar');
	readln(nombre);
	{dado que el archivo está creado, debe abrirse como de lectura/escritura}
	reset(novelas);
	
	while(not eof(nobelas))do begin
		readln(nobelas, nove);
		if(nove.nombre = nombre)then begin
			readln(nove.cod);
			readln(nove.precio);
			readln(nove.genero);
			readln(nove.nombre);
		end;
		seek(novelas, filepos(novelas) -1);
		
		write(novelas, nove);
	end;
	{cerramos el archivo}
	close(novelas);
end;
var
  novelas:ArchNovelas;
  carga:text;
  nombreFisico:cadena;
begin
	writeln('ingrese el nombre del archivo');
	readln(nombreFisico);

	assign(novelas, nombreFisico);
	crearArch(novelas, carga);
	Actualizar(novelas);
	
end; 
