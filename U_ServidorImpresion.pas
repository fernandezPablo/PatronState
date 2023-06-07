unit U_ServidorImpresion;

interface

uses System.Classes, U_Estados, Vcl.Graphics;

   type TServidorImpresion = class
      private
         FEstado: TEstadoAbstracto;
         FOwner: TComponent;
      public
         constructor Create(var AOwner: TComponent);
         procedure SetEstado(const Value: TEstadoAbstracto);
         property Estado: TEstadoAbstracto read FEstado write SetEstado;
         procedure EnviarMensaje(Mensaje: String; Color: TColor);
         procedure Iniciar;
         procedure Detener;
         procedure Imprimir;
   end;


implementation

uses UF_LanzadorServidorImpresion;


{ TServidorImpresion }

constructor TServidorImpresion.Create(var AOwner: TComponent);
begin
   FOwner := AOwner;
   SetEstado(TEstadoDetenido.Create(Self));
end;

procedure TServidorImpresion.Detener;
begin
   FEstado.Detener;
end;

procedure TServidorImpresion.EnviarMensaje(Mensaje: String; Color: TColor);
begin
   Tf_LanzadorServidorImpresion(FOwner).ImprimirMensajeLog(Mensaje, Color);
end;

procedure TServidorImpresion.Imprimir;
begin
   FEstado.Imprimir;
end;

procedure TServidorImpresion.Iniciar;
begin
   FEstado.Iniciar;
end;

procedure TServidorImpresion.SetEstado(const Value: TEstadoAbstracto);
begin
   FEstado := Value;
   Tf_LanzadorServidorImpresion(FOwner).ActualizarEstado;
end;

end.
