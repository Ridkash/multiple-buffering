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
begin
    Unit1.ini.WriteString('settings', 'IdPagelAST', main.pageNumber.Caption);
    Unit1.ini.WriteString('settings', 'numberPageMax', settings.EditNumberMaxPage.Text);
    Unit1.ini.WriteString('settings', 'buferG', settings.EditBuferG.Text);
//    main.status.Panels.Items[1].Text:='настройки сохранены';
    settings.Hide;
end;

end.
