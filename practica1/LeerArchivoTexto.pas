program LeerArchivoTexto;

CONST FICHERO = '/home/abelardo/Escritorio/LeerArchivoTexto.pas';

var 
	archivo: text;
	linea: string;
begin
	assign(archivo, FICHERO);
	Reset(archivo);
	while(not EOF(archivo))do begin
		readln(archivo, linea);
		writeln(linea);
	end;
	close(archivo);
end.
