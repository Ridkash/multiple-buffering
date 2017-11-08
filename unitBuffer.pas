unit unitBuffer;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls;

type
  Tbuffer = class(TForm)
    StatusBar1: TStatusBar;
    tablo: TLabel;
    procedure FormPaint(Sender: TObject);
    procedure Memo1Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  buffer: Tbuffer;

implementation

{$R *.dfm}

uses unitMain;

procedure Tbuffer.FormPaint(Sender: TObject);
begin
Application.RestoreTopMosts;
end;

procedure Tbuffer.Memo1Change(Sender: TObject);
begin
Application.RestoreTopMosts;
end;

end.
