unit unitTimer;

interface

uses
//Пользовательские
  unitSettings,
  //стандартные
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Menus, Vcl.ExtCtrls,
  Vcl.ComCtrls;

type
  TfTimer = class(TForm)
    timerH: TLabel;
    timerCount: TLabel;
    ButtonL: TButton;
    ButtonR: TButton;
    sTimer: TTimer;
    MainMenu1: TMainMenu;
    timerStartButton: TMenuItem;
    timerStopButton: TMenuItem;
    Label1: TLabel;
    timerAllClose: TLabel;
    timerM: TLabel;
    timerBetwin: TLabel;
    procedure sTimerTimer(Sender: TObject);
    procedure ButtonRClick(Sender: TObject);
    procedure ButtonLClick(Sender: TObject);
    procedure timerStartButtonClick(Sender: TObject);
    procedure timerStopButtonClick(Sender: TObject);
    procedure timerUpdater(inStr: string);
  private
    { Private declarations }
  public
    { Public declarations }
    varTimer:word;
// Переменные для таймера
  iniTimerOnePart : word; // Время которое тратится за каждый промежуток
  iniCloseOnePartTask : word; // число, которое нужно закрыть за каждый промежуток
  iniPartsNumber : word; // количество промежутков
  countOneMod: word; //Число которое нужно закрыть больше, + число остатки

  end;

var
  fTimer: TfTimer;


implementation

{$R *.dfm}

procedure TfTimer.timerUpdater(inStr: string);
  var today: TDateTime;
    parseTimeH,parseTimeM,parseTimeS:word;
    outStr,str:string;
begin
today:=Time;
str:=timetostr(today);
//str:=inStr;
//str:='18:01:00';
//showmessage(str);
//showmessage('countOneMod'+inttostr(countOneMod));
//showmessage('AllDayPartcountTasks'+inttostr(AllDayPartcountTasks));



//определяю больше или меньше 10 часов
if pos(':',str)>2 then begin
//   showmessage('11 Часов');
    parseTimeH:=strtoint(copy(str,1,2));
    parseTimeM:=strtoint(copy(str,4,2));

   ftimer.timerH.Caption:='0'+inttostr(iniTimerOnePart-((parseTimeH-7)mod iniTimerOnePart) -1 );
   ftimer.timerM.Caption:=inttostr(60-parseTimeM);

   if strtoint(ftimer.timerM.Caption)<10 then ftimer.timerM.Caption:='0'+ftimer.timerM.Caption;
   if parseTimeM=0 then begin
    ftimer.timerM.Caption:='00';
    ftimer.timerH.Caption:='0'+inttostr(strtoint(ftimer.timerH.Caption)+1);
   end


  end else begin
//     showmessage('9 Часов');
    parseTimeH:=strtoint(copy(str,1,1));
    parseTimeM:=strtoint(copy(str,3,2));
//      showmessage(inttostr(iniTimerOnePart));
   ftimer.timerH.Caption:='0'+inttostr(iniTimerOnePart-(parseTimeH-6));
//   showmessage(ftimer.timerH.Caption);
   ftimer.timerM.Caption:=inttostr(60-parseTimeM);
   if strtoint(ftimer.timerM.Caption)<10 then ftimer.timerM.Caption:='0'+ftimer.timerM.Caption;
   if (parseTimeM = 0) then begin
//   showmessage('N OOOOOOO');
    ftimer.timerM.Caption:='00';
    ftimer.timerH.Caption:='0'+inttostr(strtoint(ftimer.timerH.Caption)+1);
   end




end;
// Действия в промежутке времени
if (parseTimeH>=7) and (parseTimeH < 7+iniTimerOnePart) then begin
  //part 1
    ftimer.timerCount.Caption:=inttostr(countOneMod + iniCloseOnePartTask-strtoint(ftimer.timerAllClose.Caption));
end;
if (parseTimeH>=7+iniTimerOnePart) and (parseTimeH < 7+iniTimerOnePart*2) then begin
  //part 2
   ftimer.timerCount.Caption:=inttostr(countOneMod+iniCloseOnePartTask*2-strtoint(ftimer.timerAllClose.Caption));
end;
if (parseTimeH>=7+iniTimerOnePart*2) and (parseTimeH < 7+iniTimerOnePart*3) then begin
  //part 3
   ftimer.timerCount.Caption:=inttostr(countOneMod+iniCloseOnePartTask*3-strtoint(ftimer.timerAllClose.Caption));

end;
if (parseTimeH>=7+iniTimerOnePart*3) and (parseTimeH < 7+iniTimerOnePart*4) then begin
  //part 3
   ftimer.timerCount.Caption:=inttostr(countOneMod+iniCloseOnePartTask*4-strtoint(ftimer.timerAllClose.Caption));

end;


end;

procedure TfTimer.ButtonLClick(Sender: TObject);
begin
//минус один
ftimer.timerCount.Caption:=inttostr(strtoint(ftimer.timerCount.Caption)-1);

// Увеличиваю общее закрытых
ftimer.timerAllClose.Caption:=inttostr(strtoint(ftimer.timerAllClose.Caption)+1);
end;

procedure TfTimer.ButtonRClick(Sender: TObject);
begin
//showmessage(ftimer.LabelCount.Caption);
ftimer.timerCount.Caption:=inttostr(strtoint(ftimer.timerCount.Caption)+1)
end;

procedure TfTimer.timerStartButtonClick(Sender: TObject);
var today:Tdatetime;
  str,t:string;
begin
// инициализация таймера
ftimer.sTimer.Interval:=strtoint(settings.timerUpdate.Text)*1000; // Задаю интервал обновления исходя из настроек settings
ftimer.iniTimerOnePart:= strtoint(settings.timerAllHours.Text) div strtoint(settings.timerCorrectionDay.Text);
ftimer.iniPartsNumber:= strtoint(settings.timerCorrectionDay.Text);
ftimer.countOneMod:=(strtoint(settings.timerAllClose.Text)) mod strtoint(settings.timerCorrectionDay.Text);
//showmessage('===>'+inttostr(ftimer.countOneMod));
ftimer.iniCloseOnePartTask:=(strtoint(settings.timerAllClose.Text)) div strtoint(settings.timerCorrectionDay.Text);


//showmessage('ff'+inttostr(ftimer.AllDayPartcountTasks));

//today:=Time;
//str:=timetostr(today);
//ftimer.timerUpdater(str);


// стартуем таймер
ftimer.sTimer.Enabled:=true;


end;

procedure TfTimer.timerStopButtonClick(Sender: TObject);
begin
ftimer.timerAllClose.Caption:='0';
ftimer.timerH.Caption:='00';
ftimer.timerM.Caption:='00';
ftimer.timerCount.Caption:='0';
ftimer.sTimer.Enabled:=false;
end;

procedure TfTimer.sTimerTimer(Sender: TObject);
begin
if ftimer.timerBetwin.Visible then ftimer.timerBetwin.Visible:=false
  else ftimer.timerBetwin.Visible:= true;
ftimer.timerUpdater('8:05:00');
end;

end.
