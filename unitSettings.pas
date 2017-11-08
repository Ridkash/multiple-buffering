unit unitSettings;

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
    procedure FormCreate(Sender: TObject);

  private
    { Private declarations }
  public

    { Public declarations }
    numberPageMax:word;      // число страниц копипаста по умолчанию 99 страниц переменная равна 99;
    numberPageСurrent:word // номер текущей страницы

  end;

var
  settings: Tsettings;

implementation

{$R *.dfm}

uses unitMain;

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
    main.cmdSql(1,'update shortcuts SET cmd="'+main.trimInSql(settings.EditBuferG.Text)+'" where shortcut="g"',tmp);
    pageMax:=strtoint(settings.EditNumberMaxPage.Text);
    main.cmdSql(1,'update settings SET value='+inttostr(pageMax)+' where param="numberPageMax"',tmp);
    settings.numberPageMax:= pageMax;
    main.pageInitSQL(pageMax);
end;

procedure Tsettings.FormCreate(Sender: TObject);
var
  res:string;
begin
  main.cmdSql(0,'select s.value FROM settings s WHERE param="numberPageMax";',res);
  settings.numberPageMax:=strtoint(res);

  main.cmdSql(0,'select s.value FROM settings s WHERE param="numberPageLast";',res);
  settings.numberPageСurrent:=strtoint(res);
  main.pageInitSQL(settings.numberPageСurrent);
end;

end.
