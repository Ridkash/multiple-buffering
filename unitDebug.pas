unit unitDebug;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,VCL.Clipbrd, Vcl.Menus;

type
  Tdebug = class(TForm)
    memo: TMemo;
    PopupMenuDebug: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
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

procedure Tdebug.N1Click(Sender: TObject);
begin
debug.memo.Clear;
end;

procedure Tdebug.N2Click(Sender: TObject);
begin
  ClipBoard.SetTextBuf(PChar(debug.memo.Text));//Скопировали в буфер обмена текст
end;

end.
