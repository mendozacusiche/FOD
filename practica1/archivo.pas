program Ejemplo_archivo_de_texto_binario;
Type
	tRegistroVotos=Record
		codProv: integer;
		codLoc: integer;
		nroMesa: integer;
		cantVotos: integer;
            desc:String;
       End;

	tArchVotos=File of tRegistroVotos;
Var
  	opc:integer;
  	nomArch, nomArch2: String;
   	arch: tArchVotos; 
	carga: Text; { archivo de texto con datos de los votos, se lee de el y se genera archivo binario. }
	votos: tRegistroVotos;
	nombreFisico:string[15];
	v:tRegistroVotos;
begin

		                      
	
	Repeat
		WriteLn('VOTOS');
		WriteLn;
		WriteLn(' 0. Terminar el Programa');
		WriteLn(' 1. Crear un archivo binario desde un arch texto');
		WriteLn(' 2. Abrir un archivo binario y exportar a texto');
		writeln(' 3. crear archivo ');
	
		Write('Ingrese el nro. de opcion: '); 
		ReadLn(opc);

		
     
	
     {Opción 1 crea el archivo binario desde un texto}
	Case opc of 
     		1: begin
        		Write('Nombre del archivo binario ');
        		ReadLn(nomArch2);

        		Assign(arch, nomArch2); 

        		Reset(carga);   		{abre archivo de texto con datos}
        		Rewrite(arch); 		{crea nuevo archivo binario}
        		while (not eof(carga)) do begin
        			With votos do 
				ReadLn(carga, codProv, codLoc, nroMesa, cantVotos, desc); {lectura de archivo de texto}
       		
				Write(arch, votos); {escribe binario}
        		end;
        		Write('Archivo cargado.');
        		writeln;
       	 	Close(arch); 
			Close(carga); 
			{cierra los dos archivos}
		    end;

			{Opcion 2 exporta el contenido del binario a un texto}
		 2: begin
        			Reset(arch); {abre archivo binario}
				
				Write('Nombre del archivo de votos: ');
   				ReadLn(nomArch);
   		      	Assign(carga, nomArch);

				Rewrite(carga); {crea archivo de texto, se utiliza el mismo de opcion 1 a modo ejemplo}

				while (not eof(arch)) do begin
        				Read(arch, votos); {lee votos del arch binario}
      				With votos do 
      				WriteLn(codProv:5, codLoc:5, nroMesa:5, cantVotos:5, desc:5); {escribe en pantalla el registro}
      				With votos do 

					{escribe en el archivo texto los campos separados por el carácter blanco}	
      				WriteLn(carga,' ',codProv,' ',codLoc,' ', nroMesa,' ',cantVotos,' ',desc); 
				end;
  				Close(arch);
		 		Close(carga)
  			end;
		 
		     {opcion 3 crea un archivo provisorio para realizar el ejemplo y ver como se exprota de binario a texto y visebersa}
              3: begin
				writeln('ingrese el nombre el archivo prueva');
				readln(nombreFisico);
	
				assign(arch, nombreFisico);

				rewrite(arch); {creo archivo  provisorio}
		            
					writeln('CORTE DE CONTROL ES zzz');
					writeln;
					writeln('Descripcin');
			      	readln(v.desc);
			
					while(v.desc <> 'zzz')do begin
					    
      	        			writeln('Ingrese codigo de provicia');
						readln(v.codProv);
						writeln('Ingrese codigo de local');
						readln(v.codLoc);
						writeln('Ingrese el numero de mesa');
						readln(v.nroMesa);
						writeln('Ingrese la cantidad de votos');
						readln(v.cantVotos);
						
						{escritura del registro de votos  en el archivo}
						write(arch, v);
						{leemos otros locales de votacion}
						writeln('Descripcin');
				      	readln(v.desc);
			
      	                  end;
				{cierro el archivo}
				close(arch);		
				
		     end;
       end;

until(opc = 0);

end.
