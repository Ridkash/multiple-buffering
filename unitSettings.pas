unit unitSettings;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

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
    LabelBuferL: TLabel;
    LabelBuferP: TLabel;
    EditBuferL: TEdit;
    EditBuferP: TEdit;
    EditBuferM: TEdit;
    LabelBuferM: TLabel;
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
    timerIsActive: TButton;
    procedure ButtonCancelClick(Sender: TObject);
    procedure ButtonSaveClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure noticeAddClick(Sender: TObject);
    procedure noticeClearClick(Sender: TObject);
    procedure noticeInit(numCurrient:integer);
    procedure noticeDeleteClick(Sender: TObject);
    procedure noticeNumberFollowingClick(Sender: TObject);
    procedure noticeNumberPreviousClick(Sender: TObject);
    procedure noticeTimerTimer(Sender: TObject);
    procedure timerIsActiveClick(Sender: TObject);
    procedure noticeChangeClick(Sender: TObject);

  private
    { Private declarations }

  public

    { Public declarations }
    numberPageMax:word;      // число страниц копипаста по умолчанию 99 страниц переменная равна 99;
    numberPageСurrent:word; // номер текущей страницы

    // переменные settinhs alarm
    noticeInitCurrent: word; // текущая страница alarm
    alarmMass: array[1..100] of TRecAlarm;
    alarmNumPage: word;
  end;

var
  settings: Tsettings;

implementation

{$R *.dfm}

uses unitMain, unitBuffer;

procedure Tsettings.noticeChangeClick(Sender: TObject);
begin
//main.cmdSql(1,'UPDATE notices SET time = "'+settings.noticeTime.Text+' "," title = "'+settings.noticeTitle.Text+'"," body = "'+settings.noticeBody.Text+'"," status="1" WHERE idRecord = "'+settings.noticeID.Caption +' "');
end;

procedure Tsettings.noticeClearClick(Sender: TObject);
begin
 Try
    main.cmdSql(1,'DELETE FROM notices;',main.tmp);
    main.cmdSql(1,'drop table notices;',main.tmp);
 finally
  main.cmdSql(1,'create table notices (time,title,body);',main.tmp);
 End;


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
end;

end;

procedure Tsettings.noticeInit(numCurrient:integer);
var
  i: Integer;
begin

  //Заполню alarm_settings
  main.cmdSql(0,'SELECT count(1) from notices',main.tmp);
  settings.noticeNumberAll.Caption:=main.tmp;

  settings.noticeNumberCurrent.Caption :=  inttostr(settings.noticeInitCurrent);

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

procedure Tsettings.timerIsActiveClick(Sender: TObject);
begin


if settings.noticeTimer.Enabled then begin
 settings.timerIsActive.Caption := 'start';
 settings.noticeTimer.Enabled := false;
end else begin

 settings.timerIsActive.Caption := 'stop';

 settings.noticeTimer.Enabled := true;
end;


end;

procedure Tsettings.ButtonCancelClick(Sender: TObject);
begin
settings.Hide;

end;

procedure Tsettings.ButtonSaveClick(Sender: TObject);
var tmp :string;
pageMax:word;
begin
    main.cmdSql(1,'update shortcuts SET cmd="'+main.trimInSql(settings.EditBuferG.Text)+'" where shortcut="g"',tmp);

    main.cmdSql(1,'update shortcuts SET cmd="'+main.trimInSql(settings.EditBuferL.Text)+'" where shortcut="l"',tmp);
    main.cmdSql(1,'update shortcuts SET cmd="'+main.trimInSql(settings.EditBuferP.Text)+'" where shortcut="p"',tmp);
    main.cmdSql(1,'update shortcuts SET cmd="'+main.trimInSql(settings.EditBuferM.Text)+'" where shortcut="m"',tmp);

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
alarmNumPage:=1;

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

  main.cmdSql(0,'select s.cmd FROM shortcuts s WHERE shortcut="g"',res);
  settings.EditBuferG.Text:=trim(res);
  main.cmdSql(0,'select s.cmd FROM shortcuts s WHERE shortcut="l"',res);
  settings.EditBuferL.Text:=trim(res);
  main.cmdSql(0,'select s.cmd FROM shortcuts s WHERE shortcut="p"',res);
  settings.EditBuferP.Text:=trim(res);
  main.cmdSql(0,'select s.cmd FROM shortcuts s WHERE shortcut="m"',res);
  settings.EditBuferM.Text:=trim(res);

  main.cmdSql(0,'select s.value FROM settings s WHERE param="BashCheack";',res);





//  if strtoint(res)=1 then begin
//    settings.bashCheack.Checked:=true;
//    main.bashSpace:=' ';
//  end else begin
//    settings.bashCheack.Checked:=false;
//    main.bashSpace:='';
//  end;




  main.pageInitSQL(settings.numberPageСurrent);

// NoticeSettings init
  settings.noticeInitCurrent := 1;
  settings.noticeInit(alarmNumPage);

main.syncDbApp();
end;

procedure Tsettings.noticeAddClick(Sender: TObject);
begin
if(settings.noticeAdd.Caption='+') then begin
//Готовим место чтобы получить данные с кнопок
  settings.noticeAdd.Caption:='OK';
  settings.noticeDelete.Caption :='X';
  settings.noticeTime.Text :=timetostr(time);;
  settings.noticeTitle.Text := '*Заголовок*';
  settings.noticeBody.Text := '*Основной текст*'
end else begin
//Начинаем писать в БД
  settings.noticeAdd.Caption:='+';
    settings.noticeDelete.Caption :='-';
  main.cmdSql(1,'insert INTO notices (time,title,body,status) VALUES ("'+settings.noticeTime.Text+'","'+settings.noticeTitle.Text+'","'+settings.noticeBody.Text+'","1");',main.tmp);
  settings.noticeTitle.Text ;
  settings.noticeInit(alarmNumPage);

end;

end;



end.
