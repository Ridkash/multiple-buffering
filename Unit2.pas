unit Unit2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  Tsettings = class(TForm)
    ButtonCancel: TButton;
    ButtonSave: TButton;
    EditNumberMaxPage: TEdit;
    LabelNumberMaxPage: TLabel;
    LabelBuferG: TLabel;
    EditBuferG: TEdit;
    procedure ButtonCancelClick(Sender: TObject);
    procedure ButtonSaveClick(Sender: TObject);
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

procedure Tsettings.ButtonCancelClick(Sender: TObject);
begin
settings.Hide;
end;

procedure Tsettings.ButtonSaveClick(Sender: TObject);
var tmp :string;
pageMax:word;
begin
    main.status.Panels.Items[1].Text:='настройки сохранены';
    settings.Hide;
    main.cmdSql(1,'update shortcuts SET cmd="'+trim(settings.EditBuferG.Text)+'" where shortcut="g"',tmp);
    pageMax:=strtoint(settings.EditNumberMaxPage.Text);
    main.cmdSql(1,'update settings SET numberPageMax='+inttostr(pageMax)+' where rowid=1',tmp);
    main.numberPageMax:= pageMax;
    main.pageInitSQL(pageMax);
end;

end.
