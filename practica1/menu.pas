Program Conversor_de_unidades;

uses crt;

var grado, opcion: integer;

begin
    clrscr;
    write('introduzca un valor: ');
    readln(grado);

    writeln('seleccione su opcion');
    writeln('1: Celcius a Fahrenheit');
    writeln('2: Fahrenheit a Celcius');
    readln(opcion);

    case opcion of
        1: writeln('C a F: ', (grado + 9 / 5));
        2: writeln('F a C: ', ((grado - 32) + 9 / 5));
    end;

    readln;
end.
