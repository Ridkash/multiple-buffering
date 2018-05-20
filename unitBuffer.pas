unit unitBuffer;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls;

type
  Tbuffer = class(TForm)
    StatusBar1: TStatusBar;
    tablo: TLabel;
    ok: TButton;
    procedure FormPaint(Sender: TObject);
    procedure Memo1Change(Sender: TObject);
    procedure okClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  buffer: Tbuffer;

implementation

{$R *.dfm}

uses unitMain, unitSettings;

procedure Tbuffer.FormPaint(Sender: TObject);
begin
Application.RestoreTopMosts;
end;

procedure Tbuffer.Memo1Change(Sender: TObject);
begin
Application.RestoreTopMosts;
end;

procedure Tbuffer.okClick(Sender: TObject);
begin
    settings.alarmMass[main.noticeAlarmNumActive].alarmStatus:=0;
    main.noticeAlarmNumActive:=0;
    buffer.ok.Visible:=false;
    main.notice('0','','','');
    settings.noticeTimer.Enabled := true;

end;

end.
