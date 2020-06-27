program EscribirArchivoTexto;

CONST FICHERO = '/home/abelardo/Escritorio/EscribirArchivoTexto.dat';

var 
	archivo: text;
	linea: string= '0';
begin
	Assign(archivo, FICHERO);
	ReWrite(archivo);
	while(linea <> '_Q') do begin
		write('Linea(_Q para terminar) :');
		readln(linea);
		if (linea <> '_Q')then
			writeln(archivo, linea);
	end;
	close(archivo);
end.
