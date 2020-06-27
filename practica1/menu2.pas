uses crt;

procedure altas;

	type

		registro=record

					titulo:string;

					autor:string;

	end;

	var

	disco:registro;

	begin

	clrscr;

		writeln('Ingrese titulo: ');

		readln(disco.titulo);

		writeln('Ingrese autor');

		readln(disco.autor);

		writeln('--------Informacion Ingresada--------');

		writeln('Titulo: ',disco.titulo);

		writeln('Autor: ',disco.autor);

 

	end;

	var

		opcion:char;

	begin

	clrscr;

		writeln('--------Menu Principal---------');

		writeln('-------1- Altas--------');

		writeln('-------2- Salir--------');

		readln(opcion);

	case opcion of

	'1': altas;

	'2': exit;

		end;

	readkey;

	end.
