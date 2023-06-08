unit U_Estados;

interface

uses BackgroundWorker, System.SysUtils;

   const
      DelayInicio = 2000;
      DelayDetener = 1000;
      DelayImpresion = 3000;

   type TEstadoAbstracto = class
      private
         FServidorImpresion: TObject;
      public
         constructor Create(ServidorImpresion: TObject);
         property ServidorImpresion: TObject read FServidorImpresion;
         procedure Iniciar; virtual; abstract;
         procedure Imprimir; virtual; abstract;
         procedure Detener; virtual; abstract;
   end;

   type TEstadoDetenido = class(TEstadoAbstracto)
      public
         procedure AfterConstruction; override;
         procedure Iniciar; override;
         procedure Imprimir;  override;
         procedure Detener;  override;
   end;

   type TEstadoIniciando = class(TEstadoAbstracto)
      public
         procedure AfterConstruction; override;
         procedure Iniciar; override;
         procedure Imprimir;  override;
         procedure Detener;  override;
         procedure InicializandoServidor(Worker: TBackgroundWorker);
   end;

   type TEstadoPreparado = class(TEstadoAbstracto)
      public
         procedure AfterConstruction; override;
         procedure Iniciar; override;
         procedure Imprimir;  override;
         procedure Detener;  override;
         procedure DeteniendoServidor(Worker: TBackgroundWorker);
   end;

   type TEstadoImprimiendo = class(TEstadoAbstracto)
      public
         procedure AfterConstruction; override;
         procedure Iniciar; override;
         procedure Imprimir;  override;
         procedure Detener;  override;
         procedure ImpresionEnCurso(Worker: TBackgroundWorker);
   end;

implementation

uses U_ServidorImpresion, Vcl.Graphics;

{==============================================================================
                                 TEstadoAbstracto
==============================================================================}

constructor TEstadoAbstracto.Create(ServidorImpresion: TObject);
begin
   FServidorImpresion := ServidorImpresion;
end;


{==============================================================================
                                 TEstadoDetenido
==============================================================================}


procedure TEstadoDetenido.AfterConstruction;
begin
   inherited;
   TServidorImpresion(ServidorImpresion).EnviarMensaje('Servidor Detenido', clRed);
end;

procedure TEstadoDetenido.Detener;
begin

end;

procedure TEstadoDetenido.Imprimir;
begin
   TServidorImpresion(ServidorImpresion).EnviarMensaje('Por favor inicie el servidor para comenzar a imprimir', clWhite);
end;

procedure TEstadoDetenido.Iniciar;
begin
   TServidorImpresion(ServidorImpresion).SetEstado(TEstadoIniciando.Create(ServidorImpresion));
end;


{==============================================================================
                                 TEstadoIniciando
==============================================================================}

procedure TEstadoIniciando.AfterConstruction;
var
   HiloImpresion: TBackgroundWorker;
begin
   inherited;
   TServidorImpresion(ServidorImpresion).EnviarMensaje('Iniciando Servidor...', clYellow);
   //Inicializar el hilo de impresión
   HiloImpresion := TBackgroundWorker.Create(nil);

   //Asignar método que se ejecutará al iniciar el Hilo e iniciarlo.
   HiloImpresion.OnWork := Self.InicializandoServidor;
   HiloImpresion.Execute;
end;


procedure TEstadoIniciando.Detener;
begin
   TServidorImpresion(ServidorImpresion).EnviarMensaje('Por favor espere mientras el servidor inicia', clWhite);
end;

procedure TEstadoIniciando.Imprimir;
begin
   TServidorImpresion(ServidorImpresion).EnviarMensaje('Por favor espere mientras el servidor inicia', clWhite);
end;

procedure TEstadoIniciando.InicializandoServidor(Worker: TBackgroundWorker);
begin
   Sleep(DelayInicio);
   TServidorImpresion(FServidorImpresion).SetEstado(TEstadoPreparado.Create(FServidorImpresion));
end;

procedure TEstadoIniciando.Iniciar;
begin
   TServidorImpresion(ServidorImpresion).EnviarMensaje('Por favor espere mientras el servidor inicia', clWhite);
end;

{==============================================================================
                                 TEstadoPreparado
==============================================================================}

procedure TEstadoPreparado.AfterConstruction;
begin
   inherited;
   TServidorImpresion(ServidorImpresion).EnviarMensaje('Servidor Preparado...', clLime);
end;

procedure TEstadoPreparado.Detener;
var
   HiloImpresion: TBackgroundWorker;
begin
   TServidorImpresion(ServidorImpresion).EnviarMensaje('Deteniendo Servidor...', clWhite);
   //Inicializar el hilo de impresión
   HiloImpresion := TBackgroundWorker.Create(nil);

   //Asignar método que se ejecutará al iniciar el Hilo e iniciarlo.
   HiloImpresion.OnWork := Self.DeteniendoServidor;
   HiloImpresion.Execute;
end;

procedure TEstadoPreparado.DeteniendoServidor(Worker: TBackgroundWorker);
begin
   Sleep(DelayDetener);
   TServidorImpresion(FServidorImpresion).SetEstado(TEstadoDetenido.Create(FServidorImpresion));
end;


procedure TEstadoPreparado.Imprimir;
begin
   TServidorImpresion(FServidorImpresion).SetEstado(TEstadoImprimiendo.Create(FServidorImpresion));
end;

procedure TEstadoPreparado.Iniciar;
begin
   TServidorImpresion(ServidorImpresion).EnviarMensaje('Reiniciando servidor', clWhite);
   TServidorImpresion(ServidorImpresion).SetEstado(TEstadoIniciando.Create(ServidorImpresion));
end;


{==============================================================================
                                 TEstadoImprimiendo
==============================================================================}

procedure TEstadoImprimiendo.AfterConstruction;
var
   HiloImpresion: TBackgroundWorker;
begin
   TServidorImpresion(ServidorImpresion).EnviarMensaje('Impresión en curso...', clBlue);
   //Inicializar el hilo de impresión
   HiloImpresion := TBackgroundWorker.Create(nil);

   //Asignar método que se ejecutará al iniciar el Hilo e iniciarlo.
   HiloImpresion.OnWork := Self.ImpresionEnCurso;
   HiloImpresion.Execute;
end;

procedure TEstadoImprimiendo.Detener;
begin
   TServidorImpresion(ServidorImpresion).EnviarMensaje('No puede detener el Servidor con una impresión en curso...', clWhite);
end;

procedure TEstadoImprimiendo.ImpresionEnCurso(Worker: TBackgroundWorker);
begin
   Sleep(DelayImpresion);
   TServidorImpresion(FServidorImpresion).SetEstado(TEstadoPreparado.Create(FServidorImpresion));
end;

procedure TEstadoImprimiendo.Imprimir;
begin
   TServidorImpresion(ServidorImpresion).EnviarMensaje('Impresión en curso por favor espere...', clWhite);
end;

procedure TEstadoImprimiendo.Iniciar;
begin
   TServidorImpresion(ServidorImpresion).EnviarMensaje('No puede reiniciar el Servidor con una impresión en curso...', clWhite);
end;

end.

