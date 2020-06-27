program Ejercicio5;
CONST
	ruta = '/home/abelardo/Escritorio/electro.txt';
type
	Electrodomestico = record
		codElectrodomestico	:integer;
		precio			:integer;
		nombre			:string[15];
		stock_disponible		:integer;
		stock_minimo		:integer;
		descripcion			:string[50];
	end;
	ArchElectrodomesticos = file of Electrodomestico;
{modulos de mi programa}

procedure Leer(var E:Electrodomestico);
begin
	
	writeln('nombre del electrodomestico: ');
	readln(E.nombre);
	
	if(E.nombre <> 'zzz')then begin
		
		writeln('percio del produto: ');
		readln(E.precio);
		writeln('codigo del producto: ');
		readln(E.codElectrodomestico);
		writeln('stock disponible: ');
		readln(E.stock_disponible);
		writeln('stock minimo: ');
		readln(E.stock_minimo);
		writeln('Descripcion: ');
		readln(E.descripcion);
	end;
end;

procedure CrearArchivo(var Electros:ArchElectrodomesticos);
var 
	Elec: Electrodomestico;
	nombreFisico: string[15];
begin
	
	writeln('Ingrese el nombre del archivo: ');
	read(nombreFisico);
     
	assign(Electros, nombreFisico);
	{apertura del archivo para la creacion}
      writeln;
	rewrite(Electros);
	writeln;
	Leer(Elec);
	
	while(Elec.nombre <> 'zzz')do begin
		
		{escritura del registro en el archivo}
		write(Electros, Elec);
		{se lee otro registro}
		Leer(Elec);
	end;
	{cierre del archivo}
	close(Electros);
	
end;

procedure CrearArchivoTxt(var arch:ArchElectrodomesticos; var carga: Text);
var
 	Elec: Electrodomestico;
begin
	
	reset(arch);{abre el archivo binario}
		assign(carga, 'electro.txt');
      
		{crea el archivo de texto}
		rewrite(carga);
	
			while(not eof(arch))do begin 
				{lee el archivo binario}
				read(arch, Elec);
				
				{escribe en pantalla el registro}
				with Elec do
					writeln(codElectrodomestico:3, precio:3, nombre:3, stock_disponible:3, stock_minimo:3, descripcion:3);
			
				{escribe en el archivo de texto los campos separados por el caracter de blanco}
				with Elec do begin
					{WriteLn(carga,' ',codProv,' ',codLoc,' ', nroMesa,' ',cantVotos,' ',desc);}
					writeln(carga,' ',codElectrodomestico,' ',precio,' ',nombre);
					writeln(carga,' ',stock_disponible,' ',stock_minimo,' ',descripcion);
					
                        end;
			end;
		{cerramos los archivos}
		close(carga);
	close(arch);
end;
	
procedure crearBinario(var E:ArchElectrodomesticos; var C:Text);
var
	nombreFisico: string[15];
	elec: Electrodomestico;
begin
	writeln('Ingrese el nombre del archivo: ');
	read(nombreFisico);
	{asigno el nombre fisico con el nombre logico}
	assign(E, nombreFisico);
	
	rewrite(E);
			reset(C);
				while(not eof(C))do begin
					with elec do begin
						readln(C, codElectrodomestico, precio, nombre);
						readln(C, stock_disponible, stock_minimo, descripcion);
				      end;
					
					write(E, elec); 
				end;
			    writeln('Archivo cargado.');
			close(C);
	close(E);
	
	
	
end;

procedure ListarMinimo(var E:ArchElectrodomesticos);
var
	elec: Electrodomestico;
begin
	
	reset(E);
		while(not eof(E))do begin
			{se obtiene un elemento desde el archivo}
			read(E, elec);
			
			if(elec.stock_disponible < elec.stock_minimo)then 
			begin
				with elec do begin
					writeln(' -',codElectrodomestico);
					writeln(' -',precio);
					writeln(' -',nombre);
					writeln(' -',stock_disponible);
					writeln(' -',stock_minimo);
					writeln(' -',descripcion);
				end;
			end;
		end;
	close(E);

end;

procedure BuscarElec(var E:ArchElectrodomesticos);
var 
	nombreBuscar: string[20];
	elec: Electrodomestico;
begin
	writeln('ingrese la descripcion a buscar: ' );
	read(nombreBuscar);
	
	{abrimos el archivo exitente}
	reset(E);
		while(not eof(E))do begin
			read(E, elec);
			
			if(elec.descripcion = nombreBuscar)then begin
				with elec do begin
					writeln(' -',codElectrodomestico);
					writeln(' -',precio);
					writeln(' -',nombre);
					writeln(' -',stock_disponible);
					writeln(' -',stock_minimo);
					writeln(' -',descripcion);
				end;	
			end;		
		end;
	close(E);
end;

procedure Exportar(var E:ArchElectrodomesticos; var nueE:Text);
var
	elec:Electrodomestico;
begin
	assign(nueE, 'electro.txt');
	{abrimos el archivo ya exitente}
	reset(E);
	{creamos un nuevo archivo de texto}
	rewrite(nueE);
	
	while(not eof(E))do begin
		read(E, elec);
		with elec do begin
		    writeln(codElectrodomestico:6, precio:6, nombre:6);
		    writeln(stock_disponible:6, stock_minimo:6, descripcion);
	      end;
		{escribimos en el archivo de tect lso campos separado pro el carácter blaco}
		with elec do 
		   	writeln(nueE,' ',codElectrodomestico,' ',precio,' ',nombre,' ',stock_disponible,' ',stock_minimo,' ',descripcion);
	end;

	close(nueE);
	close(E);
end;

procedure  AnadirProd(var E:ArchElectrodomesticos);
var
	elec: Electrodomestico; 
begin
	reset(E);
	
	{posisiona al final del archivo}
	seek(E, filesize(E));

	Leer(elec);

	while(elec.nombre <> 'zzz')do begin
		
		{se agrega  un producto al archivo archivo}
		write(E, elec);

		{se lee otro registro}
		Leer(elec);
	end;
	{cierre del archivo}
	close(E);

end;

procedure ModificarStock(var E:ArchElectrodomesticos );
var
 	nueStock: integer;
	e:Electrodomestico;
	nomprod: string[15];
begin
	writeln('ingrese el nombre del producto');
	readln(nomprod);
	reset(E);
	
	while(not eof(E))do begin
		readln(E. e);
				
		if(e.nombre = nomprod)then begin
			writeln('INGRESE EL NUEVO STOCK');
			READLN(nueStock);
			e.stock_disponible:= nueStock;		
		end;
		{ubicar el puntero del archivo en el registro leido}
		seek(E,filepos(E) -1);
		{se graba el archivo modificado}
		write(E,e);
	end;
	close(E);
end;

procedure Exportasin(var E:ArchElectrodomesticos; sin:ArchElectrodomesticos);
var
	e:Electrodomestico
begin
	reset(E);
	assign(sin,'Stock.txt​');
	rewrite(sin);
	
	while(not eof(E))do begin
		readln(E, e);

		if(e.stock_disponible = 0) then begin
			write(sin, e);
            end;		
			
	end;
	close(sin);
	close(E);
	
end;

{programa principal}
var
	Electrodomesticos: ArchElectrodomesticos;
      opcion:char;
	carga: Text;
	nuevoElec:ArchElectrodomesticos;
      nueE:Text;
      sin:ArchElectrodomesticos;
begin

	CrearArchivo(Electrodomesticos);
	CrearArchivoTxt(Electrodomesticos, carga);


			writeln('***********************************************');
			writeln('************** MENU DE OPCIONES ***************');
			writeln('***********************************************');
			writeln;
	
			{opciones del menu principal}
			writeln('************** INGRESE LA OPCION **************');
			writeln;
			writeln('  A:  Crear Archivo Desde Archivo Text');
			writeln('  B:  Listar electrodomestico con stock minimo');
			writeln('  C:  Buscar Electrodomestico');
			writeln('  D:  Exportar archivo a "electro.txt"');
			writeln('  E:  AÑADIR MAS ELECTRODOMESTICOS');
			WRITELN('  F:  MODDIFICAR STOCK	');
			WRITELN('  G:  SINSTOCK');
			WRITELN('  H:  SALIR')
			writeln;
			readln(opcion);

	while(opcion <> 'H')do begin
	

		case opcion of
			
			'A' : crearBinario(nuevoElec, carga);
			'B' : ListarMinimo(nuevoElec);
			'C' : BuscarElec(nuevoElec);
			'D' : Exportar(nuevoElec, nueE);
			'E' : AnadirProd(nuevoElec);
			'F' : ModificarStock(nuevoElec);
			'G' : Exportasin(nuevoElec, sin);
			'H' : exit;

		end;

	            writeln('***********************************************');
			writeln('************** MENU DE OPCIONES ***************');
			writeln('***********************************************');
			writeln;
	
			{opciones del menu principal}
			writeln('************** INGRESE LA OPCION **************');
			writeln;
			writeln('  A:  Crear Archivo Desde Archivo Text');
			writeln('  B:  Listar electrodomestico con stock minimo');
			writeln('  C:  Buscar Electrodomestico');
			writeln('  D:  Exportar archivo a "electro.txt"');
			writeln('  E:  AÑADIR MAS ELECTRODOMESTICOS');
			WRITELN('  F:  MODDIFICAR STOCK	');
			WRITELN('  G:  SINSTOCK');
			WRITELN('  H: SALIR')
			writeln;
			readln(opcion);
      end;
		
end.
