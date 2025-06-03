program DelphiConcepts;

uses
  Vcl.Forms,
  ufrmConcepts in 'ufrmConcepts.pas' {frmConcepts},
  uUtils in 'uUtils.pas',
  uRttiExample in 'uRttiExample.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmConcepts, frmConcepts);
  Application.Run;
end.
