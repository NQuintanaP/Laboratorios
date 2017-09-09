program tarea;
const
  fin= '$';
  punto= '.';
  maxlargo=7;
var
  base,num,contador:integer;
  ch:char;
  resultado:longint;
  cerrar:boolean;//me controla de que no se pase de max largo
begin
  read(ch);
  while (cerrar = false) and (ch <> fin)  do
  begin
    case ch of
    '1':
    begin
      read(ch);
      base:=((ord(ch)-ord('0'))+10);
    end;
    '2','3','4','5','6','7','8','9': base:=(ord(ch)-ord('0'));
    end;
    read(ch);
    read(ch);
    while (contador<maxlargo) and (ch<>punto) do
    begin
      case ch of
      '0','1','2','3','4','5','6','7','8','9':
        begin
          num := (ord(ch)-ord('0'));
          resultado := ((resultado*base) + num);
          contador := contador + 1;
          read(ch);
        end;
        'A','B','C','D','E','F':
        begin
          num:=((ord(ch)-ord('A'))+10);
          resultado := ((resultado*base) + num);
          contador := contador + 1;
          read(ch);
        end;
      end;
    end;
    if ch=punto then
    begin
      writeln(resultado);
      contador:=0;
      resultado:=0;
      readln;
      read(ch);
    end;
    if (contador=maxlargo) THEN
    begin
      writeln('ERROR');
      cerrar:=true;
    end;
  end;
end.
