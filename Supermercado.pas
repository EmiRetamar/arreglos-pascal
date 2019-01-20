Program TpArreglos;
const DimF=100;
type productos = record
     nom:string[20];
     cod:integer;
     stock:integer;
     end;

     dirProd = array[1..DimF] of productos;

Procedure leerProd(var prod:productos; var vecProd:dirProd; var DimL:integer);

    begin
         DimL:=0;
         writeln('Ingrese un producto:');
         readln(prod.nom);
         while(DimL<DimF) and (prod.nom <>'zzz') do begin
               with prod do begin
               writeln('Ingrese el codigo del producto:');
               readln(cod);
               writeln('Ingrese el stock del producto:');
               readln(stock);
               end;
               DimL:=DimL+1;
               vecProd[DimL]:=prod;
               if(DimL<DimF) then
                 writeln('Ingrese un producto:');
                 readln(prod.nom);
         end;
    end;

Procedure imprimirElementos(DimL:integer; vecProd:dirProd);
          var
          i:integer;
          begin
          writeln;
          for i:= 1 to DimL do
             writeln('nombre:',vecProd[i].nom,' - codigo:', vecProd[i].cod,' - stock:', vecProd[i].stock);
             writeln;
          end;

Function Posicion(nombre:dirProd):integer;
          var numPos:integer;
          begin
          numPos:=1;
          while(nombre[numPos].nom <> 'aceite') do
            numPos:=numPos+1;
          Posicion:=numPos;
          end;

procedure Stock(unidades:dirProd; DimL:integer);
          var i:integer; cantProd:integer;
          begin
          cantProd:=0;
          i:=1;
          while (i<=DimL) do begin
            if(unidades[i].stock>=50) and (unidades[i].stock<= 200) then
              cantProd:=cantProd+1;
            i:=i+1;
          end;
          writeln('La cantidad de productos con con stock entre 50 y 200 son: ',cantProd);
      end;

procedure LeerNuevoProducto(var nuevoProd:productos);
          begin
          writeln;
          writeln('Ingrese un nuevo producto:');
          with nuevoProd do begin
          readln(nom);
          writeln('Ingrese el codigo del producto:');
          readln(cod);
          writeln('Ingrese el stock del producto:');
          readln(stock);
          end;
      end;

procedure LeerPosicion(var Pos:integer; DimL:integer);
          begin
          writeln;
          writeln('Ingrese una posicion de 1 a ', DimL, ' para insertar el nuevo elemento en el vector');
          writeln;
          readln(Pos);
          end;

Procedure Insertar(var vecProd:dirProd; Pos:integer; nuevoProd:productos; var DimL:integer);
          var
          i:integer;
          begin
          if (Pos<=DimL) then begin
             if (DimL<DimF) then begin
                i:=DimL;
                for i:= DimL downto Pos do
                   vecProd[i+1]:=vecProd[i];
                vecProd[Pos]:=nuevoProd;
                DimL:=DimL+1;
                ImprimirElementos(DimL, vecProd);
             end
             else
                  writeln('No se pueden agregar mas productos porque el vector esta lleno');
          end
          else
               writeln('La posicion ingresada es incorrecta');
      end;


{Programa principal}
var
   prod:productos;
   vecProd:dirProd;
   DimL:integer;
   numPos:integer;
   nuevoProd:productos;
   Pos:integer;
begin
  leerProd(prod,vecProd,DimL);
  imprimirElementos(DimL,vecProd);
  numPos:=Posicion(vecProd);
  writeln('La posicion en el vector donde aparece el producto aceite es: ',numPos);
  writeln;
  Stock(vecProd, DimL);
  LeerNuevoProducto(nuevoProd);
  LeerPosicion(Pos, DimL);
  Insertar(vecProd, Pos, nuevoProd, DimL);
readln;
end.
