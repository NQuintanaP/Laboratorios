program Laboratorio;
var
    base,indice,valor:integer;
    resultado:longint;
    digito:char;
    salida,cerrar,numero:boolean;{la variable numero se asegura que el digito sea un numero ingresado}
const
    centinela = '$'; {Digito finalizador del programa}
    maxlargo = 7; {Mayor largo posible para un numero ingresado}
    fin_linea = '.'; {Digito separador de lineas}
begin
    read(digito);
    if (digito = centinela) then
        cerrar:= TRUE;
    while (digito <> centinela) AND (cerrar = false) do
    begin
      //inicializacion de variables|
      resultado := 0;
      indice := 0;
      //inicializacion de variables|
      if (digito = '1') then //si el primer digito es 1, la base debe ser >= 10
        begin
            read(digito);
            base := ((ord(digito)-ord('0')) + 10);//Se resta a ord del digito el ord de '0' para conocer el numero original y se le suma 10 (1n)
        end
      else
        base := (ord(digito)-ord('0'));
        read(digito);//para consumir el : del ingreso
        read(digito);
      repeat
      begin
          if (salida = FALSE) THEN
          begin
            case digito of
              '0','1','2','3','4','5','6','7','8','9','A','B','C','D','E','F': //se controla que el digito sea un numero ingresado
              begin
                numero := TRUE;
                case digito of
                  '0','1','2','3','4','5','6','7','8','9': valor := (ord(digito)-ord('0'));
                  'A','B','C','D','E','F': valor := ((ord(digito)-ord('A')) + 10)
                end
              end;
              fin_linea://se controla que el digito sea el finalizador
              begin
                numero:=FALSE;
                readln;
              end;
            end;
            case numero of
              TRUE:
              begin
                if (indice < maxlargo) THEN
                begin
                  resultado := ((resultado*base)+valor);//Se aplica regla de horner para hallar el resultado
                  indice := indice + 1;
                end
                else if (indice = maxlargo) THEN//si el indice es igual al max largo es que se paso (porque la sucesion 0..7 posee 8 <> 7)
                begin
                  writeln('ERROR');
                  salida := TRUE;
                  cerrar := TRUE;
              end;
            end;
            FALSE:
            begin
              writeln(resultado);
              salida := TRUE;
            end;
          end;
          read(digito);
        end;
      end;
      until(salida = TRUE);
      salida:=FALSE;//se reinicia la salida para la proxima iteracion
      if (digito = centinela) THEN
        cerrar := TRUE;
    end;
end.
