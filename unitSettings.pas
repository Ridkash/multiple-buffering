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
    gTimer: TGroupBox;
    timerAllClose: TEdit;
    mainSettings: TGroupBox;
    timerLabelClose: TLinkLabel;
    TimerCorrectionLabel: TLinkLabel;
    timerCorrectionDay: TEdit;
    LinkLabel1: TLinkLabel;
    timerUpdate: TEdit;
    Label1: TLabel;
    timerAllHours: TEdit;
    bashCheack: TCheckBox;
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
    main.cmdSql(1,'update shortcuts SET cmd="'+main.trimInSql(settings.EditBuferG.Text)+'" where shortcut="g"',tmp);
    pageMax:=strtoint(settings.EditNumberMaxPage.Text);
    main.cmdSql(1,'update settings SET value='+inttostr(pageMax)+' where param="numberPageMax"',tmp);
    settings.numberPageMax:= pageMax;
    main.pageInitSQL(main.numberPageCurrent);


    main.cmdSql(1,'update settings SET value='+trim(settings.timerAllHours.Text)+' where param="hoursDayWorkComplited"',tmp);
    main.cmdSql(1,'update settings SET value='+trim(settings.timerAllClose.Text)+' where param="numberDayWorkComplited"',tmp);
    main.cmdSql(1,'update settings SET value='+trim(settings.timerCorrectionDay.Text)+' where param="numberDayWorkParts"',tmp);
    main.cmdSql(1,'update settings SET value='+trim(settings.timerUpdate.Text)+' where param="secTimerUpdate"',tmp);

  // bash cheack записываю
    if settings.bashCheack.Checked then begin
      main.bashSpace:=' ';
      main.cmdSql(1,'update settings SET value="1" where param="BashCheack"',tmp);

    end else begin
       main.bashSpace:='';
       main.cmdSql(1,'update settings SET value="0" where param="BashCheack"',tmp);
    end;



    main.status.Panels.Items[1].Text:='настройки сохранены';
    settings.Hide;
end;

procedure Tsettings.FormCreate(Sender: TObject);
var
  res:string;
begin
  main.cmdSql(0,'select s.value FROM settings s WHERE param="numberPageMax";',res);
  settings.numberPageMax:=strtoint(res);

  main.cmdSql(0,'select s.value FROM settings s WHERE param="numberPageLast";',res);
  settings.numberPageСurrent:=strtoint(res);

  main.cmdSql(0,'select s.value FROM settings s WHERE param="hoursDayWorkComplited";',res);
  settings.timerAllHours.Text:=res;

  main.cmdSql(0,'select s.value FROM settings s WHERE param="numberDayWorkComplited";',res);
  settings.timerAllClose.Text:=res;

  main.cmdSql(0,'select s.value FROM settings s WHERE param="numberDayWorkParts";',res);
  settings.timerCorrectionDay.Text:=res;

  main.cmdSql(0,'select s.value FROM settings s WHERE param="secTimerUpdate";',res);
  settings.timerUpdate.Text:=res;

  main.cmdSql(0,'select s.value FROM settings s WHERE param="BashCheack";',res);

  if strtoint(res)=1 then begin
    settings.bashCheack.Checked:=true;
    main.bashSpace:=' ';
  end else begin
   settings.bashCheack.Checked:=false;
       main.bashSpace:='';
  end;




  main.pageInitSQL(settings.numberPageСurrent);
end;

end.
