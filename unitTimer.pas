unit unitTimer;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Menus, Vcl.ExtCtrls,
  Vcl.ComCtrls;

type
  TfTimer = class(TForm)
    LabelTime: TLabel;
    LabelCount: TLabel;
    ButtonL: TButton;
    ButtonR: TButton;
    sTimer: TTimer;
    MainMenu1: TMainMenu;
    procedure sTimerTimer(Sender: TObject);
    procedure ButtonRClick(Sender: TObject);
    procedure ButtonLClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    varTimer:word;
  end;

var
  fTimer: TfTimer;

implementation

{$R *.dfm}


procedure TfTimer.ButtonLClick(Sender: TObject);
begin
ftimer.LabelCount.Caption:=inttostr(strtoint(ftimer.LabelCount.Caption)-1)
end;

procedure TfTimer.ButtonRClick(Sender: TObject);
begin
//showmessage(ftimer.LabelCount.Caption);
ftimer.LabelCount.Caption:=inttostr(strtoint(ftimer.LabelCount.Caption)+1)
end;

procedure TfTimer.sTimerTimer(Sender: TObject);
begin

showmessage('ok');
end;

end.
