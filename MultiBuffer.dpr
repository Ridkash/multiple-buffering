program MultiBuffer;

uses
  Vcl.Forms,
  Unit1 in 'Unit1.pas' {main},
  Unit2 in 'Unit2.pas' {settings},
  Unit3 in 'Unit3.pas' {buffer};


{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(Tmain, main);
  //Application.CreateForm(Tbuffer, buffer);
  Application.CreateForm(Tsettings, settings);
  Application.CreateForm(Tbuffer, buffer);

  buffer.FormStyle:=fsStayOnTop;
  main.N5.Checked:=true;
  buffer.Show;
  Application.Run;

end.
