program LeerArchivoTexto;

CONST FICHERO = '/home/abelardo/Escritorio/ArchivoTexto.pas';

var 
	archivo: text;
	caracter: char;
begin
	assign(archivo, FICHERO);
	Reset(archivo);
	while(not EOF(archivo))do begin
		while (not EOLN(archivo))do begin
			Read(archivo, caracter);
			write(caracter);
		end;
		writeln;
		readln(archivo);
	end;
	close(archivo);
end.
