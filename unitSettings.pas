unit unitSettings;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.ComCtrls,
  Vcl.ToolWin;

type
 TRecAlarm = Record
  alarmNoticeTime : String[10]; // время для аларм
  alarmStatus : word; // не выключен ли будильник
  alarmNoticeTitle:  String[20];
  alarmNoticeBody:  String[20];
  alarmNoticeId:  word;
 End;
  Tsettings = class(TForm)
    ButtonCancel: TButton;
    ButtonSave: TButton;
    EditNumberMaxPage: TEdit;
    LabelNumberMaxPage: TLabel;
    gTimer: TGroupBox;
    timerAllClose: TEdit;
    timerLabelClose: TLinkLabel;
    TimerCorrectionLabel: TLinkLabel;
    timerCorrectionDay: TEdit;
    LinkLabel1: TLinkLabel;
    timerUpdate: TEdit;
    Label1: TLabel;
    timerAllHours: TEdit;
    bashCheack: TCheckBox;
    noticeTime: TEdit;
    noticeTitle: TEdit;
    noticeBody: TEdit;
    noticeChange: TButton;
    noticeNumberCurrent: TLabel;
    noticeNumberZnak: TLabel;
    noticeNumberAll: TLabel;
    noticeNumberPrevious: TButton;
    noticeNumberFollowing: TButton;
    gNotice: TGroupBox;
    noticeAdd: TButton;
    noticeDelete: TButton;
    noticeTimer: TTimer;
    HotKey1: THotKey;
    StatusBar1: TStatusBar;
    Splitter1: TSplitter;
    hotKeyCaption: TLabel;
    hotkeyMemo: TMemo;
    addHotkeyButton: TButton;
    hotKeyGroup: TGroupBox;
    hotKeyCurient: TLabel;
    hotkeyAllNum: TLabel;
    Label2: TLabel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    GroupBox1: TGroupBox;
    logTrue: TCheckBox;
    noticeAutorun: TCheckBox;
    bdwayCheange: TSaveDialog;
    bdWay: TEdit;
    bdWayButton: TButton;
    bdWayLabel: TLabel;

    procedure ButtonCancelClick(Sender: TObject);
    procedure ButtonSaveClick(Sender: TObject);
    procedure noticeAddClick(Sender: TObject);
    procedure noticeClearClick(Sender: TObject);
    procedure noticeInit(numCurrient:integer);
    procedure noticeDeleteClick(Sender: TObject);
    procedure noticeNumberFollowingClick(Sender: TObject);
    procedure noticeNumberPreviousClick(Sender: TObject);
    procedure noticeTimerTimer(Sender: TObject);
    procedure noticeChangeClick(Sender: TObject);
    procedure HotKey1Change(Sender: TObject);
    procedure addHotkeyButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure bdWayButtonClick(Sender: TObject);
    procedure bdWayChange(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);

  private
    { Private declarations }

  public

    { Public declarations }
//    numberPageMax:word;      // число страниц копипаста по умолчанию 99 страниц переменная равна 99;
    numberPageСurrent:word; // номер текущей страницы

    // переменные settinhs alarm
//    noticeInitCurrent: word; // текущая страница alarm
    alarmMass: array[1..100] of TRecAlarm;
    alarmNumPage: word;
    alarmID: word; // отображает id в базе текущей формы notice
    noticeTimerIsActive: boolean;
    procedure activeTimer();
    procedure initSettings();
    procedure initHotkey(i:word);
  end;

var
  settings: Tsettings;

implementation

{$R *.dfm}

uses unitMain, unitBuffer;
procedure Tsettings.initHotkey(i: Word);
begin
  main.cmdSql(0,'SELECT s.cmd FROM shortcuts s WHERE rowid="'+inttostr(i)+'"',main.tmp);
  main.log(2,'В hotkey:'+main.tmp);
  settings.hotkeyMemo.Text:=trim(main.tmp);
end;
procedure Tsettings.initSettings();
var
  res:string;
  i:word;
begin
main.log(1,'procedure Tsettings.initSettings();');
  // Проверка на существование base.db в каталоге где запускается приложение если не существует инициализируем таблицу.
if not FileExists(main.dbName) then begin
  main.log(1,'Базу не обнаружил, будем создавать...');
  main.BufferConnection.Connected:=true;
  main.dbConnect:=true;
  for i := 1 to 5 do main.dbCreateTable(i);
  main.log(1,'Создал новую базу!');
end;
main.log(1,'База существует... идем дальше!');

alarmNumPage:=1;

  main.cmdSql(0,'select s.value FROM settings s WHERE param="numberPageMax";',res);
  main.numberPageMax:=strtoint(res);

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

         main.cmdSql(0,'select s.value FROM settings s WHERE param="noticeTimeIsActiveOnLast";',res);
        if res='1' then  settings.activeTimer();






//  if strtoint(res)=1 then begin
//    settings.bashCheack.Checked:=true;
//    main.bashSpace:=' ';
//  end else begin
//    settings.bashCheack.Checked:=false;
//    main.bashSpace:='';
//  end;




  main.pageInitSQL(settings.numberPageСurrent);

// NoticeSettings init
//  settings.noticeInitCurrent := 1;
  settings.alarmNumPage:=1;
  settings.noticeInit(alarmNumPage);
 main.log(1,'ENTER: syncDbApp();');
main.syncDbApp();
main.log(1,'EXIT: syncDbApp');
main.log(1,'ENTER: syncDbHotKey');
main.syncDbHotKey();

end;
procedure noticeReadOnly(use:boolean);
begin
if use then
begin
  settings.noticeTime.ReadOnly := true;
  settings.noticeTitle.ReadOnly := true;
  settings.noticeBody.ReadOnly := true;

  settings.noticeTime.Color := cl3DLight;
  settings.noticeTitle.Color := cl3DLight;
  settings.noticeBody.Color := cl3DLight;

end else begin
  settings.noticeTime.ReadOnly := false;
  settings.noticeTitle.ReadOnly := false;
  settings.noticeBody.ReadOnly := false;

  settings.noticeTime.Color := clMoneyGreen;
  settings.noticeTitle.Color := clMoneyGreen;
  settings.noticeBody.Color := clMoneyGreen;

end;

end;
procedure Tsettings.activeTimer();
begin

if settings.noticeTimer.Enabled then begin
 settings.noticeTimerIsActive := false;
 main.log(1,'Отключенид уведомления');
 settings.noticeTimer.Enabled := false;
end else begin
 main.log(1,'Включил уведомления');
 settings.noticeTimerIsActive:=true;
 settings.noticeTimer.Enabled := true;
end;

end;

procedure Tsettings.noticeChangeClick(Sender: TObject);
var sql:string;
begin
noticereadonly(false);
if settings.noticeChange.Caption='Изменить' then begin
  main.log(1,'изменить');
  settings.noticeChange.Caption:='Сохранить';
  settings.noticeDelete.Caption :='X';
end else begin
  settings.noticeChange.Caption:='Изменить';

  noticereadonly(true);
  sql:='UPDATE notices SET time = "'+trim(settings.noticeTime.Text)+'",title = "'+trim(settings.noticeTitle.Text)+'",body = "'+trim(settings.noticeBody.Text)+'", status="1" WHERE idRecord = "'+trim(settings.noticeNumberCurrent.Caption) +'"';
  main.log(1,sql);
  main.cmdSql(1,sql,main.tmp);
end;



end;

procedure Tsettings.noticeClearClick(Sender: TObject);
begin

showmessage('Успешно сброшена!');

end;
procedure Tsettings.noticeDeleteClick(Sender: TObject);
begin
if(settings.noticeDelete.Caption='-') then begin
//тут удаляем запись с БД
end else begin
//тут возвращаем обратно состояние
  settings.noticeAdd.Caption:='+';
  settings.noticeDelete.Caption:='-';
  settings.noticeTime.Text :='00:00';
  settings.noticeTitle.Text := '*Заголовок*';
  settings.noticeBody.Text := '*Основной текст*';

  settings.noticeChange.Caption:='Изменить';
  noticeReadOnly(true);


end;

end;

procedure Tsettings.noticeInit(numCurrient:integer);
var
  i: Integer;
begin

  //Заполню alarm_settings

  main.cmdSql(0,'SELECT count(1) from notices',main.tmp);
  settings.noticeNumberAll.Caption:=main.tmp;

  settings.noticeNumberCurrent.Caption :=  inttostr(settings.alarmNumPage);

  main.cmdSql(0,'SELECT nn.time from notices nn where nn.rowid='+inttostr(numCurrient),main.tmp);
  settings.noticeTime.Text := main.tmp;

  main.cmdSql(0,'SELECT nn.title from notices nn  where nn.rowid='+inttostr(numCurrient),main.tmp);
  settings.noticeTitle.Text := main.tmp;

  main.cmdSql(0,'SELECT nn.body from notices nn where nn.rowid='+inttostr(numCurrient),main.tmp);
  settings.noticeBody.Text := main.tmp;
//  inc(alarmNumPage);






  settings.noticeAdd.Caption := '+';
  settings.noticeDelete.Caption := '-';

end;



procedure Tsettings.noticeNumberFollowingClick(Sender: TObject);
begin
if (strtoint(settings.noticeNumberAll.Caption) > strtoint(settings.noticeNumberCurrent.Caption)) then begin
  inc(alarmNumPage);
  settings.noticeInit(alarmNumPage);
  settings.noticeNumberCurrent.Caption := inttostr(alarmNumPage);
end;
end;

procedure Tsettings.noticeNumberPreviousClick(Sender: TObject);
begin
if (1 > (alarmNumPage - 1)) then settings.noticeNumberCurrent.Caption := '1'
  else begin alarmNumPage:=alarmNumPage - 1 ;
    settings.noticeInit(alarmNumPage);
    settings.noticeNumberCurrent.Caption := inttostr(alarmNumPage);
  end;
end;

procedure Tsettings.noticeTimerTimer(Sender: TObject);

var toTime : TDATETIME;
j,i:integer;
miTime:TDate;
isTime:boolean;
begin

toTime:=Time;
isTime:=true;
miTime:= strtotime('23:59');

for i := 1 to strtoint(settings.noticeNumberAll.Caption) do  begin

//showmessage((settings.alarmMass[i].alarmNoticeTime));
try
  miTime:=strToTime(settings.alarmMass[i].alarmNoticeTime);
except
  isTime:=false;
  buffer.StatusBar1.Panels[1].Text := 'ошибка времени '+inttostr(i);
end;

 if (toTime > miTime ) and (settings.alarmMass[i].alarmStatus=1) and isTime then begin
// showmessage(settings.alarmMass[i].alarmNoticeTime);
  main.notice('1',settings.alarmMass[i].alarmNoticeTime,settings.alarmMass[i].alarmNoticeTitle,settings.alarmMass[i].alarmNoticeBody);
  main.noticeAlarmNumActive:=i;
  buffer.ok.Visible:=true;
 end;
end;

end;

procedure Tsettings.addHotkeyButtonClick(Sender: TObject);
begin
  main.cmdSql(1,'INSERT INTO shortcuts(cmd, shortcut ) VALUES ("'+ settings.hotkeyMemo.Text +'","$'+IntToHex(main.shortCutKey, 2) +'");',main.tmp);
  settings.hotkeyMemo.Clear;
end;

procedure Tsettings.bdWayButtonClick(Sender: TObject);
begin
  if settings.bdwayCheange.Execute then begin
   main.log(1,settings.bdwayCheange.FileName);
   settings.bdWay.Text:= settings.bdwayCheange.FileName;
  end;
end;

procedure Tsettings.bdWayChange(Sender: TObject);
begin
main.log(2,'ИЗМЕНЕНА ПУТЬ К БАЗЕ');
end;

procedure Tsettings.Button1Click(Sender: TObject);
begin
  if strtoint(settings.hotKeyCurient.Caption)>1 then
     settings.hotKeyCurient.Caption:=inttostr(strtoint(settings.hotKeyCurient.Caption)-1);
  main.syncDbHotKey();
end;

procedure Tsettings.Button2Click(Sender: TObject);
begin
  if strtoint(settings.hotKeyCurient.Caption)<strtoint(settings.hotkeyAllNum.Caption) then
     settings.hotKeyCurient.Caption:=inttostr(strtoint(settings.hotKeyCurient.Caption)+1);
  main.syncDbHotKey();
end;

procedure Tsettings.Button3Click(Sender: TObject);
var sql:string;
begin

  sql:='UPDATE shortcuts SET cmd = "'+trim(settings.hotkeyMemo.Text)+'" WHERE rowid = "'+trim(settings.hotKeyCurient.Caption) +'"';
  main.log(2,sql);
  main.cmdSql(1,sql,main.tmp);
  main.statusBottom('Изменен','');
end;

procedure Tsettings.ButtonCancelClick(Sender: TObject);
begin
settings.Hide;

end;

procedure Tsettings.ButtonSaveClick(Sender: TObject);
begin
main.settingsSave();
settings.Hide;
end;

procedure Tsettings.FormCreate(Sender: TObject);
begin
 alarmNumPage:=1;
 main.numberPageMax:=99;
 settings.numberPageСurrent:=1;
 settings.timerAllHours.Text:='12';
 settings.timerAllClose.Text:='22';
 settings.timerCorrectionDay.Text:='4';
 settings.timerUpdate.Text:='2';

 settings.alarmNumPage:=1;
if main.dbConnect then begin
 settings.noticeInit(1);
 main.bdCheack.Checked:=true;
 settings.initSettings();
end;

//main.syncDbApp();
// main.bdCheack.Click;
end;

procedure Tsettings.HotKey1Change(Sender: TObject);
begin
//main.log('=>' + IntToStr(HotKey1.HotKey)+' $'+IntToHex(HotKey1.HotKey, 2));
main.shortCutKey:=HotKey1.HotKey;
end;

procedure Tsettings.noticeAddClick(Sender: TObject);
begin
if(settings.noticeAdd.Caption='+') then begin
//Готовим место чтобы получить данные с кнопок
  settings.noticeAdd.Caption:='OK';
  settings.noticeDelete.Caption :='X';
  settings.noticeTime.Text :=timetostr(time);;
  settings.noticeTitle.Text := '*Заголовок*';
  settings.noticeBody.Text := '*Основной текст*';

noticeReadOnly(false);

end else begin
//Начинаем писать в БД
  settings.noticeAdd.Caption:='+';
  settings.noticeDelete.Caption :='-';
  main.cmdSql(1,'insert INTO notices (time,title,body,status) VALUES ("'+settings.noticeTime.Text+'","'+settings.noticeTitle.Text+'","'+settings.noticeBody.Text+'","1");',main.tmp);
  settings.noticeTitle.Text ;
  settings.noticeInit(alarmNumPage);
  noticeReadOnly(true);

end;

end;



end.
