unit UF_LanzadorServidorImpresion;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxLookAndFeels,
  cxLookAndFeelPainters, Vcl.Menus, Vcl.StdCtrls, cxButtons, cxControls,
  cxContainer, cxEdit, Vcl.ExtCtrls, cxGroupBox, cxLabel, cxTextEdit, cxMemo,
  cxRichEdit, U_ServidorImpresion, BackgroundWorker;

type
  Tf_LanzadorServidorImpresion = class(TForm)
    gb_Estados: TcxGroupBox;
    s_EstadoDetenido: TShape;
    l_EstadoDetenido: TcxLabel;
    s_EstadoIniciando: TShape;
    l_EstadoIniciando: TcxLabel;
    s_EstadoPreparado: TShape;
    l_EstadoPreparado: TcxLabel;
    s_EstadoImprimiendo: TShape;
    l_EstadoImprimiendo: TcxLabel;
    gb_Mensajes: TcxGroupBox;
    e_MensajesServidor: TcxRichEdit;
    gb_Acciones: TcxGroupBox;
    b_Iniciar: TcxButton;
    b_Imprimir: TcxButton;
    b_Detener: TcxButton;
    b_LimpiarConsola: TcxButton;
    b_Copy: TcxButton;
    procedure FormCreate(Sender: TObject);
    procedure b_IniciarClick(Sender: TObject);
    procedure b_DetenerClick(Sender: TObject);
    procedure b_ImprimirClick(Sender: TObject);
    procedure b_LimpiarConsolaClick(Sender: TObject);
    procedure b_CopyClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    FServidorImpresion: TServidorImpresion;
    procedure ImprimirMensajeLog(Mensaje: String; Color: TColor);
    procedure ActualizarEstado;
  end;

var
  f_LanzadorServidorImpresion: Tf_LanzadorServidorImpresion;

implementation

uses U_Estados, ClipBrd;

{$R *.dfm}

procedure Tf_LanzadorServidorImpresion.ActualizarEstado;
begin

   if Assigned(Self.FServidorImpresion) then
   begin
      s_EstadoDetenido.Enabled := FServidorImpresion.Estado is TEstadoDetenido;
      l_EstadoDetenido.Enabled := s_EstadoDetenido.Enabled;

      s_EstadoIniciando.Enabled := FServidorImpresion.Estado is TEstadoIniciando;
      l_EstadoIniciando.Enabled := s_EstadoIniciando.Enabled;

      s_EstadoPreparado.Enabled := FServidorImpresion.Estado is TEstadoPreparado;
      l_EstadoPreparado.Enabled := s_EstadoPreparado.Enabled;

      s_EstadoImprimiendo.Enabled := FServidorImpresion.Estado is TEstadoImprimiendo;
      l_EstadoImprimiendo.Enabled := s_EstadoImprimiendo.Enabled;
   end;
end;

procedure Tf_LanzadorServidorImpresion.b_CopyClick(Sender: TObject);
begin
   Clipboard.AsText := e_MensajesServidor.Text;
end;

procedure Tf_LanzadorServidorImpresion.b_DetenerClick(Sender: TObject);
begin
   FServidorImpresion.Detener;
end;

procedure Tf_LanzadorServidorImpresion.b_ImprimirClick(Sender: TObject);
begin
   FServidorImpresion.Imprimir;
end;

procedure Tf_LanzadorServidorImpresion.b_IniciarClick(Sender: TObject);
begin
   FServidorImpresion.Iniciar;
end;

procedure Tf_LanzadorServidorImpresion.b_LimpiarConsolaClick(Sender: TObject);
begin
   e_MensajesServidor.Clear;
   e_MensajesServidor.SelAttributes.Color := clWhite;
end;

procedure Tf_LanzadorServidorImpresion.FormCreate(Sender: TObject);
begin
   FServidorImpresion := TServidorImpresion.Create(TComponent(Self));
end;

procedure Tf_LanzadorServidorImpresion.ImprimirMensajeLog(Mensaje: String;
  Color: TColor);
begin
   e_MensajesServidor.SelAttributes.Color := Color;
   e_MensajesServidor.SelText := FormatDateTime('[YYYY-MM-DD hh:mm:ss] ', Now) + Mensaje;
   e_MensajesServidor.SelText := #13;
end;

end.
