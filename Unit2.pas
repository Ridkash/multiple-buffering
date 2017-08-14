unit Unit2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  Tsettings = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Edit1: TEdit;
    Label1: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  settings: Tsettings;

implementation

{$R *.dfm}

uses Unit1;

procedure Tsettings.Button1Click(Sender: TObject);
begin
settings.Hide;
end;

procedure Tsettings.Button2Click(Sender: TObject);
begin
//main.
end;

end.
