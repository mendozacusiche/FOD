program crearAr;

type
 	archivodeReales = file of real;
var
	Reales	:archivodeReales;
	NroReal :real;
begin
	{enlace entre el nombre lógico y el nombre físico}
	assign(Reales, '/home/abelardo/Escritorio/numeroreales.txt');

	{apertur dle archivo para creación}
	rewrite(Reales);
	
	{lectura de un número real}
	writeln('ingrese un numero real');
	readln(NroReal);
	
	while(NroReal <> 0)do begin
		{escritura del numero en el archivo}
		write(Reales,NroReal);

		{lectura de otro numero real}
		writeln('ingrese un numero real');
		readln(NroReal); 
	end;

	{ciere del archivo}
	close(Reales);
end.
