program MultiBuffer;

uses
  Vcl.Forms,
  unitMain in 'unitMain.pas' {main},
  unitSettings in 'unitSettings.pas' {settings},
  unitBuffer in 'unitBuffer.pas' {buffer};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(Tmain, main);
  Application.CreateForm(Tsettings, settings);
  Application.CreateForm(Tbuffer, buffer);
  unitMain.main.pageInitSQL(unitSettings.settings.numberPage—urrent);
  buffer.FormStyle:=fsStayOnTop;
  main.N5.Checked:=true;
  buffer.Show;
  Application.Run;

end.
