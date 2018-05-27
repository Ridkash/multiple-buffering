unit unitDebug;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  Tdebug = class(TForm)
    memo: TMemo;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  debug: Tdebug;

implementation

{$R *.dfm}

uses unitMain;

end.
