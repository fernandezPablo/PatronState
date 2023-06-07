program ServidorImpresion;

uses
  Vcl.Forms,
  UF_LanzadorServidorImpresion in 'UF_LanzadorServidorImpresion.pas' {f_LanzadorServidorImpresion},
  U_ServidorImpresion in 'U_ServidorImpresion.pas',
  U_Estados in 'U_Estados.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(Tf_LanzadorServidorImpresion, f_LanzadorServidorImpresion);
  Application.Run;
end.
