unit unitMain;

interface

uses
 IniFiles,unitSettings,unitBuffer,
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Menus, Vcl.ComCtrls,Clipbrd,
  Vcl.Buttons, Data.FMTBcd, Data.DbxSqlite, Data.DB, Data.SqlExpr;
type
  Tmain = class(TForm)
    titleItems: TComboBox;

    item0: TMemo;
    item1: TMemo;
    item2: TMemo;
    item3: TMemo;
    item4: TMemo;
    item5: TMemo;
    item6: TMemo;
    item7: TMemo;
    item8: TMemo;
    item9: TMemo;

    copy0: TButton;
    copy1: TButton;
    copy2: TButton;
    copy4: TButton;
    copy3: TButton;
    copy5: TButton;
    copy6: TButton;
    copy7: TButton;
    copy8: TButton;
    copy9: TButton;

    paste1: TButton;
    paste2: TButton;
    paste3: TButton;
    paste4: TButton;
    paste5: TButton;
    paste6: TButton;
    paste7: TButton;
    paste8: TButton;
    paste9: TButton;
    paste0: TButton;

    note1: TMemo;
    note2: TMemo;
    note3: TMemo;
    note4: TMemo;
    note5: TMemo;
    note6: TMemo;
    note7: TMemo;
    note8: TMemo;
    note9: TMemo;
    note0: TMemo;


    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    pageNumber: TLabel;
    previousPage: TButton;
    followingPage: TButton;
     N3: TMenuItem;
    N4: TMenuItem;
    status: TStatusBar;
    buffer1: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    copyright: TLabel;
    changeTitle: TBitBtn;
    goUp1: TBitBtn;
    goUp2: TBitBtn;
    goUp3: TBitBtn;
    goUp4: TBitBtn;
    goUp5: TBitBtn;
    goUp6: TBitBtn;
    goUp7: TBitBtn;
    goUp8: TBitBtn;
    goUp9: TBitBtn;
    goUp0: TBitBtn;
    N8: TMenuItem;
    N9: TMenuItem;
    query: TSQLQuery;
    BufferConnection: TSQLConnection;
    estbutton1: TMenuItem;
    N10: TMenuItem;
    N11: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure N3Click(Sender: TObject);

    procedure copy1Click(Sender: TObject);
    procedure copy2Click(Sender: TObject);
    procedure copy3Click(Sender: TObject);
    procedure copy4Click(Sender: TObject);
    procedure copy5Click(Sender: TObject);
    procedure copy6Click(Sender: TObject);
    procedure copy7Click(Sender: TObject);
    procedure copy8Click(Sender: TObject);
    procedure copy9Click(Sender: TObject);
    procedure copy0Click(Sender: TObject);

    procedure paste0Click(Sender: TObject);
    procedure paste1Click(Sender: TObject);
    procedure paste2Click(Sender: TObject);
    procedure paste3Click(Sender: TObject);
    procedure paste4Click(Sender: TObject);
    procedure paste5Click(Sender: TObject);
    procedure paste6Click(Sender: TObject);
    procedure paste7Click(Sender: TObject);
    procedure paste8Click(Sender: TObject);
    procedure paste9Click(Sender: TObject);

    procedure followingPageClick(Sender: TObject);
    procedure previousPageClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure changeTitleClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure goUp1Click(Sender: TObject);
    procedure goUp2Click(Sender: TObject);
    procedure goUp3Click(Sender: TObject);
    procedure goUp4Click(Sender: TObject);
    procedure goUp5Click(Sender: TObject);
    procedure goUp6Click(Sender: TObject);
    procedure goUp7Click(Sender: TObject);
    procedure goUp8Click(Sender: TObject);
    procedure goUp9Click(Sender: TObject);
    procedure goUp0Click(Sender: TObject);
    procedure N9Click(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure estbutton1Click(Sender: TObject);
    procedure titleItemsChange(Sender: TObject);
    procedure N10Click(Sender: TObject);
    procedure N0811Click(Sender: TObject);
    procedure N11Click(Sender: TObject);


  private
    { Private declarations }
    id1, id2, id3, id4: Integer;
    id_C_1, id_C_2, id_C_3, id_C_4, id_C_5,id_C_6, id_C_7, id_C_8, id_C_9, id_C_0, id_C_T, id_C_SB, id_C_G, id_C_S,id_C_l, id_C_p, id_C_m: Integer;
    id_A_1, id_A_2, id_A_3, id_A_4, id_A_5,id_A_6, id_A_7, id_A_8, id_A_9, id_A_0, id_A_T: Integer;
    id_following,id_previous:integer;

    procedure WMHotKey(var Msg: TWMHotKey); message WM_HOTKEY;

  public
    { Public declarations }
//    numberPageMax:word;      // число страниц копипаста по умолчанию 99 страниц переменная равна 99;
    bufferG:string;
    bashSpace : string;
    tmp: string;
    numberPageCurrent:word;  // Текущая страница
    procedure cmdSql( cmd :word; sql:string; var res:string);
    procedure pageInitSQL(needPageNumber:word);
    function trimInSql(str:string): string;
    function trimoutSql(str:string): string;


  end;

var
  main: Tmain;


  ini: TIniFile;           //ини файл настроек
  str_end: string;         // маркер конца строки
  sql_znak_in,
  sql_znak_out: string;    // что буду заменять в sql запросах
  currentVersion: string;  // текущая версия приложения
  modUse: integer;         // ctrl,alt
  bufferG: string;         // окно произвольного буфера

  tmpMass : Array [0..50] of string;

implementation

{$R *.dfm}

uses unitTimer;


//Свои процедуры и функции
// SQL inject
//  Query->ExecSQL();
//  Query->Open();
procedure Tmain.cmdSql( cmd :word; sql:string; var res:string);
var str: string;
    names: TStringList;
    i: Integer;
    currentField: TField;
    currentLine: string;
begin
res:='';
main.query.SQL.Text:=sql;
  case cmd of
//    0 - для SELECT, 1 -  для INSERT, CREATE, update...
    0 : begin
          main.query.Open;
        if not main.query.IsEmpty then
        begin
          main.query.First;
          names := TStringList.Create;
          try
            main.query.GetFieldNames(names);
            while not main.query.Eof do
            begin
              currentLine := '';
              for i := 0 to names.Count - 1 do
              begin
                currentField := main.query.FieldByName(names[i]);
                currentLine := currentLine + ' ' + currentField.AsString;
              end;
              res:= res + currentLine;
              main.query.Next;
            end;
          finally
            names.Free;
          end;
        end;


    end;
    1 : main.query.ExecSQL();
    else ShowMessage(' неизвестная команда');
  end;
end;










////////////
function toAddLine(inStr:string):string;
var
  i:word;
begin

  result :=(inttostr(inStr.Length));
end;

function dropLines(inStr: string):string;
  var i: word;
    outStr:string;
begin
  i:=0;
  while i < inStr.Length do begin
    outStr[i]:=inStr[i];
    if (i=250) then outStr:=outStr + '';


    i:=i+1;
    result:=outStr;
  end;
end;



function toAddLines(inStr:string):string;

begin

end;
function replaceSub(str, sub_in, sub_out: string): string;
var
  aPos: integer;
  rslt: string;
begin
  aPos:=pos(sub_in, str);
  rslt:='';
  while (aPos <> 0) do
    begin
      rslt:=rslt + copy(str, 1, aPos - 1) + sub_out;
      delete(str, 1, aPos + length(sub_in) - 1);
      aPos:=pos(sub_in, str)
    end;


  result:=rslt + str
end;
procedure Tmain.titleItemsChange(Sender: TObject);
begin
//  main.titleItems.ItemIndex:= main.titleItems.ItemIndex-1;
  pageinitsql(main.titleItems.ItemIndex+1);
end;

function Tmain.trimInSql(str:string): string;
begin
  result:= replaceSub(trim(str),'"','#3696#');
end;
function Tmain.trimoutSql(str:string): string;
begin
  result:= replaceSub(trim(str),'#3696#','"');
end;

/////
procedure savePageSQL();
var
  i:word;
  bufferCount: word;
  tmp,sql:string;
begin

  main.cmdSql(1,'UPDATE titles SET title = "'+main.trimInSql(main.titleItems.Text)+'" WHERE rowid = '+main.pageNumber.Caption+';',tmp);

  bufferCount:=strtoint(main.pageNumber.Caption) * 10;
  main.cmdSql(1,'UPDATE settings SET value = '+trim(main.pageNumber.Caption)+' WHERE param = "numberPageLast";',tmp);

  sql:= 'UPDATE buffers SET item="'+main.trimInSql(main.item0.Text)+'" WHERE rowid = '+inttostr(bufferCount)+';'; main.cmdSql(1,sql,tmp);
  sql:='UPDATE buffers SET item = "'+main.trimInSql(main.item1.Text)+'" WHERE rowid = '+inttostr(bufferCount+1)+';'; main.cmdSql(1,sql,tmp);
  main.cmdSql(1,'UPDATE buffers SET item = "'+main.trimInSql(main.item2.Text)+'" WHERE rowid = '+inttostr(bufferCount+2)+';',tmp);
  main.cmdSql(1,'UPDATE buffers SET item = "'+main.trimInSql(main.item3.Text)+'" WHERE rowid = '+inttostr(bufferCount+3)+';',tmp);
  main.cmdSql(1,'UPDATE buffers SET item = "'+main.trimInSql(main.item4.Text)+'" WHERE rowid = '+inttostr(bufferCount+4)+';',tmp);
  main.cmdSql(1,'UPDATE buffers SET item = "'+main.trimInSql(main.item5.Text)+'" WHERE rowid = '+inttostr(bufferCount+5)+';',tmp);
  main.cmdSql(1,'UPDATE buffers SET item = "'+main.trimInSql(main.item6.Text)+'" WHERE rowid = '+inttostr(bufferCount+6)+';',tmp);
  main.cmdSql(1,'UPDATE buffers SET item = "'+main.trimInSql(main.item7.Text)+'" WHERE rowid = '+inttostr(bufferCount+7)+';',tmp);
  main.cmdSql(1,'UPDATE buffers SET item = "'+main.trimInSql(main.item8.Text)+'" WHERE rowid = '+inttostr(bufferCount+8)+';',tmp);
  main.cmdSql(1,'UPDATE buffers SET item = "'+main.trimInSql(main.item9.Text)+'" WHERE rowid = '+inttostr(bufferCount+9)+';',tmp);

  main.cmdSql(1,'UPDATE buffers SET notice = "'+main.trimInSql(main.note0.Text)+'" WHERE rowid = '+inttostr(bufferCount)+';',tmp);
  main.cmdSql(1,'UPDATE buffers SET notice = "'+main.trimInSql(main.note1.Text)+'" WHERE rowid = '+inttostr(bufferCount+1)+';',tmp);
  main.cmdSql(1,'UPDATE buffers SET notice = "'+main.trimInSql(main.note2.Text)+'" WHERE rowid = '+inttostr(bufferCount+2)+';',tmp);
  main.cmdSql(1,'UPDATE buffers SET notice = "'+main.trimInSql(main.note3.Text)+'" WHERE rowid = '+inttostr(bufferCount+3)+';',tmp);
  main.cmdSql(1,'UPDATE buffers SET notice = "'+main.trimInSql(main.note4.Text)+'" WHERE rowid = '+inttostr(bufferCount+4)+';',tmp);
  main.cmdSql(1,'UPDATE buffers SET notice = "'+main.trimInSql(main.note5.Text)+'" WHERE rowid = '+inttostr(bufferCount+5)+';',tmp);
  main.cmdSql(1,'UPDATE buffers SET notice = "'+main.trimInSql(main.note6.Text)+'" WHERE rowid = '+inttostr(bufferCount+6)+';',tmp);
  main.cmdSql(1,'UPDATE buffers SET notice = "'+main.trimInSql(main.note7.Text)+'" WHERE rowid = '+inttostr(bufferCount+7)+';',tmp);
  main.cmdSql(1,'UPDATE buffers SET notice = "'+main.trimInSql(main.note8.Text)+'" WHERE rowid = '+inttostr(bufferCount+8)+';',tmp);
  main.cmdSql(1,'UPDATE buffers SET notice = "'+main.trimInSql(main.note9.Text)+'" WHERE rowid = '+inttostr(bufferCount+9)+';',tmp);

main.status.Panels[0].Text:='Успешно сохранен!';

end;
procedure TMain.pageInitSQL(needPageNumber:word);
 var
  i :word;
  bufferCount :word;//с этой позиции будем читать
  str,tmp:string;
begin

      // инициализация переменных
      //title 0...
      //page 1..
      //item 10..
      // needPageNumber - страница на которую нужно переходить

      //Формирую title
      //main.titleItems.Items Начинается запись с нуля, тут четко все!
      for i := 1 to settings.numberPageMax do begin
        main.cmdSql(0,'select t.title from titles t where t.rowid='+inttostr(i)+';',str);
        main.titleItems.Items[i-1]:=str;
      end;
      // пропишу на форму номер страницы
      main.pageNumber.Caption := inttostr(needPageNumber);

      bufferCount:=strtoint(main.pageNumber.Caption) * 10;

      //читаю горячую клавишу
      main.cmdSql(0,'select s.cmd FROM shortcuts s WHERE shortcut="g"',tmp);
      main.bufferG:= tmp;

      //пишу title
      main.cmdSql(0,'select t.rowid from titles t where t.rowid = '+inttostr(needPageNumber)+';',str);
      if strtoint(str)>0 then main.titleItems.ItemIndex:= strtoint(str)-1;


      main.cmdSql(0,'select b.item from buffers b where b.rowid = '+inttostr(bufferCount)+';',str);   main.item0.Text:= main.trimoutSql(str);
      main.cmdSql(0,'select b.item from buffers b where b.rowid = '+inttostr(bufferCount+1)+';',str); main.item1.Text:= main.trimoutSql(str);
      main.cmdSql(0,'select b.item from buffers b where b.rowid = '+inttostr(bufferCount+2)+';',str); main.item2.Text:= main.trimoutSql(str);
      main.cmdSql(0,'select b.item from buffers b where b.rowid = '+inttostr(bufferCount+3)+';',str); main.item3.Text:= main.trimoutSql(str);
      main.cmdSql(0,'select b.item from buffers b where b.rowid = '+inttostr(bufferCount+4)+';',str); main.item4.Text:= main.trimoutSql(str);
      main.cmdSql(0,'select b.item from buffers b where b.rowid = '+inttostr(bufferCount+5)+';',str); main.item5.Text:= main.trimoutSql(str);
      main.cmdSql(0,'select b.item from buffers b where b.rowid = '+inttostr(bufferCount+6)+';',str); main.item6.Text:= main.trimoutSql(str);
      main.cmdSql(0,'select b.item from buffers b where b.rowid = '+inttostr(bufferCount+7)+';',str); main.item7.Text:= main.trimoutSql(str);
      main.cmdSql(0,'select b.item from buffers b where b.rowid = '+inttostr(bufferCount+8)+';',str); main.item8.Text:= main.trimoutSql(str);
      main.cmdSql(0,'select b.item from buffers b where b.rowid = '+inttostr(bufferCount+9)+';',str); main.item9.Text:= main.trimoutSql(str);

      main.cmdSql(0,'select b.notice from buffers b where b.rowid = '+inttostr(bufferCount)+';',str);   main.note0.Text:= main.trimoutSql(str);
      main.cmdSql(0,'select b.notice from buffers b where b.rowid = '+inttostr(bufferCount+1)+';',str); main.note1.Text:= main.trimoutSql(str);
      main.cmdSql(0,'select b.notice from buffers b where b.rowid = '+inttostr(bufferCount+2)+';',str); main.note2.Text:= main.trimoutSql(str);
      main.cmdSql(0,'select b.notice from buffers b where b.rowid = '+inttostr(bufferCount+3)+';',str); main.note3.Text:= main.trimoutSql(str);
      main.cmdSql(0,'select b.notice from buffers b where b.rowid = '+inttostr(bufferCount+4)+';',str); main.note4.Text:= main.trimoutSql(str);
      main.cmdSql(0,'select b.notice from buffers b where b.rowid = '+inttostr(bufferCount+5)+';',str); main.note5.Text:= main.trimoutSql(str);
      main.cmdSql(0,'select b.notice from buffers b where b.rowid = '+inttostr(bufferCount+6)+';',str); main.note6.Text:= main.trimoutSql(str);
      main.cmdSql(0,'select b.notice from buffers b where b.rowid = '+inttostr(bufferCount+7)+';',str); main.note7.Text:= main.trimoutSql(str);
      main.cmdSql(0,'select b.notice from buffers b where b.rowid = '+inttostr(bufferCount+8)+';',str); main.note8.Text:= main.trimoutSql(str);
      main.cmdSql(0,'select b.notice from buffers b where b.rowid = '+inttostr(bufferCount+9)+';',str); main.note9.Text:= main.trimoutSql(str);

      main.status.Panels[0].Text:='ok';
end;

 procedure goUp(a:word);
 var
  c,d : string;
 begin
  case a of

    1:  begin
      c := main.item1.Text;
      d := main.note1.Text;
      main.item1.Text:=main.item0.Text;
      main.note1.Text:=main.note0.text;
      main.item0.Text:=c;
      main.note0.Text:=d;
    end;

    2: begin
      c := main.item2.Text;
      d := main.note2.Text;
      main.item2.Text:=main.item1.Text;
      main.note2.Text:=main.note1.text;
      main.item1.Text:=c;
      main.note1.Text:=d;
    end;

    3: begin
      c := main.item3.Text;
      d := main.note3.Text;
      main.item3.Text:=main.item2.Text;
      main.note3.Text:=main.note2.text;
      main.item2.Text:=c;
      main.note2.Text:=d;
    end;
    4: begin
      c := main.item4.Text;
      d := main.note4.Text;
      main.item4.Text:=main.item3.Text;
      main.note4.Text:=main.note3.text;
      main.item3.Text:=c;
      main.note3.Text:=d;
    end;
    5: begin
      c := main.item5.Text;
      d := main.note5.Text;
      main.item5.Text:=main.item4.Text;
      main.note5.Text:=main.note4.text;
      main.item4.Text:=c;
      main.note4.Text:=d;
    end;
    6: begin
      c := main.item6.Text;
      d := main.note6.Text;
      main.item6.Text:=main.item5.Text;
      main.note6.Text:=main.note5.text;
      main.item5.Text:=c;
      main.note5.Text:=d;
    end;
    7: begin
      c := main.item7.Text;
      d := main.note7.Text;
      main.item7.Text:=main.item6.Text;
      main.note7.Text:=main.note6.text;
      main.item6.Text:=c;
      main.note6.Text:=d;
    end;
    8: begin
      c := main.item8.Text;
      d := main.note8.Text;
      main.item8.Text:=main.item7.Text;
      main.note8.Text:=main.note7.text;
      main.item7.Text:=c;
      main.note7.Text:=d;
    end;
    9: begin
      c := main.item9.Text;
      d := main.note9.Text;
      main.item9.Text:=main.item8.Text;
      main.note9.Text:=main.note8.text;
      main.item8.Text:=c;
      main.note8.Text:=d;
    end;
    0: begin
      c := main.item0.Text;
      d := main.note0.Text;
      main.item0.Text:=main.item9.Text;
      main.note0.Text:=main.note9.text;
      main.item9.Text:=c;
      main.note9.Text:=d;
    end;

  end;
 end;

procedure Tmain.WMHotKey(var Msg: TWMHotKey);
var
  currentTime,bodyText: string;
begin
  { if Msg.HotKey = id1 then ShowMessage('Ctrl + A pressed !');
    if Msg.HotKey = id2 then ShowMessage('Ctrl + Alt + R pressed !');
    if Msg.HotKey = id3 then ShowMessage('Win + F4 pressed !');
    if Msg.HotKey = id4 then ShowMessage('Print Screen pressed !'); }

  if Msg.HotKey = id_C_1 then begin
     main.copy1.Click;
 {   keybd_event(VK_LCONTROL,0,0,0);
     keybd_event(Ord('r'),0,0,0);
     keybd_event(Ord('r'), 0, KEYEVENTF_KEYUP, 0);
     keybd_event(VK_LCONTROL, 0, KEYEVENTF_KEYUP, 0)}

    //  keybd_event(VK_RSHIFT,0,0,0);

      keybd_event(Ord('V'),0,0,0);
      keybd_event(Ord('V'),0,KEYEVENTF_KEYUP,0);
     // keybd_event(VK_INSERT,0,0,0);
     //(VK_INSERT, 0, KEYEVENTF_KEYUP, 0);
     // keybd_event(VK_RSHIFT, 0, KEYEVENTF_KEYUP, 0);


    // keybd_event(VK_MENU,0,0,0);
    // keybd_event(Ord('2'), 0, 0, 0);
    // keybd_event(Ord('2'), 0, KEYEVENTF_KEYUP, 0);
  //   keybd_event(VK_MENU, 0, KEYEVENTF_KEYUP, 0);

  end;
  if Msg.HotKey = id_C_2 then begin
     main.copy2.Click;
     keybd_event(Ord('V'),0,0,0);
     keybd_event(Ord('V'),0,KEYEVENTF_KEYUP,0);
  end;

  if Msg.HotKey = id_C_3 then begin
     main.copy3.Click;
     keybd_event(Ord('V'),0,0,0);
     keybd_event(Ord('V'),0,KEYEVENTF_KEYUP,0);
  end;
  if Msg.HotKey = id_C_4 then begin
    main.copy4.Click;
    keybd_event(Ord('V'),0,0,0);
    keybd_event(Ord('V'),0,KEYEVENTF_KEYUP,0);
  end;
  if Msg.HotKey = id_C_5 then begin
    main.copy5.Click;
    keybd_event(Ord('V'),0,0,0);
    keybd_event(Ord('V'),0,KEYEVENTF_KEYUP,0);
  end;
  if Msg.HotKey = id_C_6 then begin
    main.copy6.Click;
    keybd_event(Ord('V'),0,0,0);
    keybd_event(Ord('V'),0,KEYEVENTF_KEYUP,0);
  end;
  if Msg.HotKey = id_C_7 then begin
    main.copy7.Click;
    keybd_event(Ord('V'),0,0,0);
    keybd_event(Ord('V'),0,KEYEVENTF_KEYUP,0);
  end;
  if Msg.HotKey = id_C_8 then begin
    main.copy8.Click;
    keybd_event(Ord('V'),0,0,0);
    keybd_event(Ord('V'),0,KEYEVENTF_KEYUP,0);
  end;
  if Msg.HotKey = id_C_9 then begin
    main.copy9.Click;
    keybd_event(Ord('V'),0,0,0);
    keybd_event(Ord('V'),0,KEYEVENTF_KEYUP,0);
  end;
  if Msg.HotKey = id_C_0 then begin
    main.copy0.Click;
    keybd_event(Ord('V'),0,0,0);
    keybd_event(Ord('V'),0,KEYEVENTF_KEYUP,0);
  end;

  if Msg.HotKey = id_previous then main.previousPage.Click;
  if Msg.HotKey = id_following then main.followingPage.Click;


  if Msg.HotKey = id_C_T then begin
    currentTime:= FormatDateTime('dd.MM.YYYY hh:mm ',Now);
    ClipBoard.SetTextBuf(PChar(currentTime));
    buffer.tablo.Caption := currentTime;
    buffer.Caption := 'Текущее время:';
//    buffer.StatusBar1.Panels[0].Text := '';
//    buffer.StatusBar1.Panels[1].Text := '';
    keybd_event(Ord('V'),0,0,0);
    keybd_event(Ord('V'),0,KEYEVENTF_KEYUP,0);
  end;

  if Msg.HotKey = id_C_G then begin
//    currentTime:= FormatDateTime('hh:mm, dd.MM.YYYY',Now);
    bodyText:= main.trimoutSql(main.bufferG);

//    bodyText := 'информация об ОО: '+#13#10#9
//              +'звонил: '+#13#10#9
//              +'когда: '+currentTime+#13#10#9
//              +'номер инцидента: '+#13#10#9
//              +'по проблеме: '+#13#10#9
//              +'что сделано: '+#13#10
//              +'-------------------'+#13#10
//              ;
    ClipBoard.SetTextBuf(  PChar(bodyText));

    buffer.tablo.Caption := currentTime + bodyText;
    buffer.Caption := 'Содержит:';
//    buffer.StatusBar1.Panels[0].Text := '';
//    buffer.StatusBar1.Panels[1].Text := '';
    keybd_event(Ord('V'),0,0,0);
    keybd_event(Ord('V'),0,KEYEVENTF_KEYUP,0);
  end;

  if Msg.HotKey = id_C_SB then main.N7.Click;


  if Msg.HotKey = id_C_l then begin

    bodyText:= main.trimoutSql(main.bufferG);

    ClipBoard.SetTextBuf(  PChar(bodyText));

    buffer.tablo.Caption := currentTime + bodyText;
    buffer.Caption := 'Содержит:';

    keybd_event(Ord('V'),0,0,0);
    keybd_event(Ord('V'),0,KEYEVENTF_KEYUP,0);

  end;
  if Msg.HotKey = id_C_p then begin

    bodyText:= main.trimoutSql(main.bufferG);

    ClipBoard.SetTextBuf(  PChar(bodyText));

    buffer.tablo.Caption := currentTime + bodyText;
    buffer.Caption := 'Содержит:';

    keybd_event(Ord('V'),0,0,0);
    keybd_event(Ord('V'),0,KEYEVENTF_KEYUP,0);

  end;
  if Msg.HotKey = id_C_m then begin
    showmessage('OK3');
  end;




end;

  //////////////////////////////////
procedure Tmain.copy0Click(Sender: TObject);
begin
  TClipboard.Create; //Создали объект


  tmp:=item0.Lines.Text;
  item0.Lines.Text:=main.bashSpace+item0.Lines.Text;
  ClipBoard.SetTextBuf(item0.Lines.GetText);//Скопировали в буфер обмена текст
  item0.Lines.Text:=tmp;
  buffer.Caption := note0.Lines.GetText;
  buffer.tablo.Caption:=item0.Lines.GetText;
  buffer.StatusBar1.Panels[0].Text := 'page: '+pageNumber.Caption;
end;
procedure Tmain.copy1Click(Sender: TObject);
begin
  TClipboard.Create; //Создали объект
  tmp:=item1.Lines.Text;
  item1.Lines.Text:=main.bashSpace+item1.Lines.Text;

  ClipBoard.SetTextBuf(item1.Lines.GetText);//Скопировали в буфер обмена текст
  item1.Lines.Text:=tmp;
  buffer.Caption := note1.Lines.GetText;
  buffer.tablo.Caption:=item1.Lines.GetText;
  buffer.StatusBar1.Panels[0].Text := 'page: '+pageNumber.Caption;
  buffer.StatusBar1.Panels[1].Text := main.titleItems.Text;

end;
procedure Tmain.copy2Click(Sender: TObject);
begin
  TClipboard.Create; //Создали объект
  tmp:=item2.Lines.Text;
  item2.Lines.Text:=main.bashSpace+item2.Lines.Text;

  ClipBoard.SetTextBuf(item2.Lines.GetText);//Скопировали в буфер обмена текст
  item2.Lines.Text:=tmp;
  buffer.Caption := note2.Lines.GetText;
  buffer.tablo.Caption:=item2.Lines.GetText;
  buffer.StatusBar1.Panels[0].Text := 'page: '+pageNumber.Caption;
end;
procedure Tmain.copy3Click(Sender: TObject);
begin
  TClipboard.Create; //Создали объект
  tmp:=item3.Lines.Text;
  item3.Lines.Text:=main.bashSpace+item3.Lines.Text;

  ClipBoard.SetTextBuf(item3.Lines.GetText);//Скопировали в буфер обмена текст
  item3.Lines.Text:=tmp;
  buffer.Caption := note3.Lines.GetText;
  buffer.tablo.Caption:=item3.Lines.GetText;
  buffer.StatusBar1.Panels[0].Text := 'page: '+pageNumber.Caption;
end;
procedure Tmain.copy4Click(Sender: TObject);
begin
  TClipboard.Create; //Создали объект
  tmp:=item4.Lines.Text;
  item4.Lines.Text:=main.bashSpace+item4.Lines.Text;

  ClipBoard.SetTextBuf(item4.Lines.GetText);//Скопировали в буфер обмена текст
  item4.Lines.Text:=tmp;
  buffer.Caption := note4.Lines.GetText;
  buffer.tablo.Caption:=item4.Lines.GetText;
  buffer.StatusBar1.Panels[0].Text := 'page: '+pageNumber.Caption;
end;
procedure Tmain.copy5Click(Sender: TObject);
begin
  TClipboard.Create; //Создали объект
  tmp:=item5.Lines.Text;
  item5.Lines.Text:=main.bashSpace+item5.Lines.Text;

  ClipBoard.SetTextBuf(item5.Lines.GetText);//Скопировали в буфер обмена текст
  item5.Lines.Text:=tmp;
  buffer.Caption := note5.Lines.GetText;
  buffer.tablo.Caption:=item5.Lines.GetText;
  buffer.StatusBar1.Panels[0].Text := 'page: '+pageNumber.Caption;

end;
procedure Tmain.copy6Click(Sender: TObject);
begin
  TClipboard.Create; //Создали объект
  tmp:=item6.Lines.Text;
  item6.Lines.Text:=main.bashSpace+item6.Lines.Text;

  ClipBoard.SetTextBuf(item6.Lines.GetText);//Скопировали в буфер обмена текст
  item6.Lines.Text:=tmp;
  buffer.Caption := note6.Lines.GetText;
  buffer.tablo.Caption:=item6.Lines.GetText;
  buffer.StatusBar1.Panels[0].Text := 'page: '+pageNumber.Caption;

end;
procedure Tmain.copy7Click(Sender: TObject);
begin
  TClipboard.Create; //Создали объект
  tmp:=item7.Lines.Text;
  item7.Lines.Text:=main.bashSpace+item7.Lines.Text;

  ClipBoard.SetTextBuf(item7.Lines.GetText);//Скопировали в буфер обмена текст
  item7.Lines.Text:=tmp;
  buffer.Caption := note7.Lines.GetText;
  buffer.tablo.Caption:=item7.Lines.GetText;
  buffer.StatusBar1.Panels[0].Text := 'page: '+pageNumber.Caption;

end;
procedure Tmain.copy8Click(Sender: TObject);
begin
  TClipboard.Create; //Создали объект
  tmp:=item8.Lines.Text;
  item8.Lines.Text:=main.bashSpace+item8.Lines.Text;

  ClipBoard.SetTextBuf(item8.Lines.GetText);//Скопировали в буфер обмена текст
  item8.Lines.Text:=tmp;
  buffer.Caption := note8.Lines.GetText;
  buffer.tablo.Caption:=item8.Lines.GetText;
  buffer.StatusBar1.Panels[0].Text := 'page: '+pageNumber.Caption;
end;
procedure Tmain.copy9Click(Sender: TObject);
begin
  TClipboard.Create; //Создали объект
  tmp:=item9.Lines.Text;
  item9.Lines.Text:=main.bashSpace+item9.Lines.Text;

  ClipBoard.SetTextBuf(item9.Lines.GetText);//Скопировали в буфер обмена текст
  item9.Lines.Text:=tmp;
  buffer.Caption := note9.Lines.GetText;
  buffer.tablo.Caption:=item9.Lines.GetText;
  buffer.StatusBar1.Panels[0].Text := 'page: '+pageNumber.Caption;
end;

procedure Tmain.estbutton1Click(Sender: TObject);
var str:string;
begin

main.cmdSql(1,'DELETE FROM settings;',str);
main.cmdSql(1,'drop table settings;',str);
main.cmdSql(1,'create table settings (param text,value text);',str);
main.cmdSql(1,'insert INTO settings (param,value) VALUES ("numberPageLast","1");',str);
main.cmdSql(1,'insert INTO settings (param,value) VALUES ("numberPageMax","99");',str);
main.cmdSql(1,'insert INTO settings (param,value) VALUES ("hoursDayWorkComplited","12");',str);
main.cmdSql(1,'insert INTO settings (param,value) VALUES ("numberDayWorkComplited","20");',str);
main.cmdSql(1,'insert INTO settings (param,value) VALUES ("numberDayWorkParts","4");',str);
main.cmdSql(1,'insert INTO settings (param,value) VALUES ("secTimerUpdate","2");',str);
main.cmdSql(1,'insert INTO settings (param,value) VALUES ("BashCheack","0");',tmp);

showmessage('Успешно сброшена!');
end;

procedure Tmain.paste0Click(Sender: TObject);
begin
  item0.lines.text:=ClipBoard.AsText;
end;
procedure Tmain.paste1Click(Sender: TObject);
begin
  item1.lines.text:=ClipBoard.AsText;

end;
procedure Tmain.paste2Click(Sender: TObject);
begin
  item2.lines.text:=ClipBoard.AsText;
end;
procedure Tmain.paste3Click(Sender: TObject);
begin
  item3.lines.text:=ClipBoard.AsText;
end;
procedure Tmain.paste4Click(Sender: TObject);
begin
  item4.lines.text:=ClipBoard.AsText;
end;
procedure Tmain.paste5Click(Sender: TObject);
begin
  item5.lines.text:=ClipBoard.AsText;
end;
procedure Tmain.paste6Click(Sender: TObject);
begin
  item6.lines.text:=ClipBoard.AsText;
end;
procedure Tmain.paste7Click(Sender: TObject);
begin
  item7.lines.text:=ClipBoard.AsText;
end;
procedure Tmain.paste8Click(Sender: TObject);
begin
  item8.lines.text:=ClipBoard.AsText;
end;
procedure Tmain.paste9Click(Sender: TObject);
begin
  item9.lines.text:=ClipBoard.AsText;
end;

procedure Tmain.followingPageClick(Sender: TObject);
begin
  if (settings.numberPageMax=strtoint(pageNumber.Caption)) then pageNumber.Caption:='1'
    else pageNumber.Caption := inttostr(strtoint(pageNumber.Caption)+1);

  pageInitSql(strtoint(main.pageNumber.Caption));
  buffer.StatusBar1.Panels[1].Text:=main.titleItems.Text;
  buffer.StatusBar1.Panels[0].Text:='page: '+main.pageNumber.Caption;
  main.numberPageCurrent:=strtoint(main.pageNumber.Caption);

//  showmessage('->'+pageNumber.Caption+'mod'+inttostr(strtoint(pageNumber.Caption) div 10));
end;
procedure Tmain.previousPageClick(Sender: TObject);
begin
if (strtoint(pageNumber.Caption)=1) then pageNumber.Caption := inttostr(settings.numberPageMax)
  else pageNumber.Caption := inttostr(strtoint(pageNumber.Caption)-1);
  pageInitSql(strtoint(main.pageNumber.Caption));
  buffer.StatusBar1.Panels[1].Text:=main.titleItems.Text;
  buffer.StatusBar1.Panels[0].Text:='page: '+main.pageNumber.Caption;
  main.numberPageCurrent:=strtoint(main.pageNumber.Caption);

end;

procedure Tmain.changeTitleClick(Sender: TObject);
var s:string;
begin
  s:=  main.titleItems.Text;
  if inputQuery('Название страницы:', 'новый title:',s) then
  main.titleItems.Text:=s;
end;

procedure Tmain.FormCreate(Sender: TObject);
const
  {
  MOD_ALT = 1;
    MOD_CONTROL = 2;
    MOD_SHIFT = 4;
    MOD_WIN = 8;
    }
  VK_0 = $30;
  VK_1 = $31;
  VK_2 = $32;
  VK_3 = $33;
  VK_4 = $34;
  VK_5 = $35;
  VK_6 = $36;
  VK_7 = $37;
  VK_8 = $38;
  VK_9 = $39;
//  VK_T = $54;
  VK_T = $42;
  VK_SB = $6A;
  VK_G = $47;
  VK_S = $6F;
  VK_L = $4C;
  VK_P = $50;
  VK_M = $4D;



  VK_previous = $51;
  VK_following = $45;
 // Спец символы
//   qQq   = #39; // '


var
//sqlite


//////////
  initNumberPageCurrent,initNumberPageMax,i: word;
  a,b,tmp: string;
  fileSettingsName:string;
  dbName : string;
  names: TStringList;
begin

  //Инициализация переменных
  status.Panels[1].text:='инициализация данных...';
  initNumberPageMax := 99;    // Число страниц (по умолчанию)
  numberPageCurrent := 1; // Текущая страница
  currentVersion:='0.8.2';

  status.Panels[0].text:='';

// MOD_ALT = 1;
// MOD_CONTROL = 2;
  modUse := 2;
//  fileSettingsName := GetCurrentDir + '\settings.ini';
  dbName:=GetCurrentDir + '\base.db';
  main.BufferConnection.Params.Add('Database='+dbName);
  main.Caption := main.Caption + ' ' + currentVersion;

//SQL - запросы
  // create table buffers (item text,notice text);
  //*********
  // INSERT INTO bufers (item, notice)
  //              VALUES ("ok", "okk");
  //***********
  // UPDATE Customers
  //  SET ContactName = 'Alfred Schmidt', City= 'Frankfurt'
  //  WHERE CustomerID = 1;
  //************
  // DELETE FROM Customers
  //  WHERE CustomerName='Alfreds Futterkiste';

  // Проверка на существование base.db в каталоге где запускается приложение если не существует инициализируем таблицу.

  if not FileExists(dbName) then begin
    //создаю бд и записываю рандомные значения
    showmessage('Буду сосздавать базу (минутку после нажатия ОК) ');
    main.BufferConnection.Connected:=true;
    cmdSql(1,'create table buffers (item text,notice text);',tmp);
    cmdSql(1,'create table titles (title text);',tmp);
    cmdSql(1,'create table shortcuts (shortcut text,cmd text);',tmp);
    cmdSql(1,'create table settings (param text,value text);',tmp);
    cmdSql(1,'insert INTO settings (param,value) VALUES ("numberPageLast","'+inttostr(numberPageCurrent)+'");',tmp);
    cmdSql(1,'insert INTO settings (param,value) VALUES ("numberPageMax","'+inttostr(initNumberPageMax)+'");',tmp);
    cmdSql(1,'insert INTO settings (param,value) VALUES ("hoursDayWorkComplited","12");',tmp);
    cmdSql(1,'insert INTO settings (param,value) VALUES ("numberDayWorkComplited","20");',tmp);
    cmdSql(1,'insert INTO settings (param,value) VALUES ("numberDayWorkParts","4");',tmp);
    cmdSql(1,'insert INTO settings (param,value) VALUES ("secTimerUpdate","2");',tmp);
    cmdSql(1,'insert INTO settings (param,value) VALUES ("BashCheack","0");',tmp);


    for i := 1 to initNumberPageMax do cmdSql(1,'INSERT INTO titles (title) VALUES ("title '+ inttostr(i) +'");',tmp);
    for i := 1 to initNumberPageMax*10+10 do cmdSql(1,'INSERT INTO buffers (item,notice) VALUES ("item '+inttostr(i)+'", "notice '+inttostr(i)+'");',tmp);

    cmdSql(1,'INSERT INTO shortcuts (shortcut, cmd) VALUES ("g", "буфер G");',tmp);

    cmdSql(1,'INSERT INTO shortcuts (shortcut, cmd) VALUES ("l", "буфер L");',tmp);
    cmdSql(1,'INSERT INTO shortcuts (shortcut, cmd) VALUES ("p", "буфер P");',tmp);
    cmdSql(1,'INSERT INTO shortcuts (shortcut, cmd) VALUES ("m", "буфер M");',tmp);

  end else begin

  end;

 cmdSql(0,'select s.value from settings s where s.param = "numberPageLast";',tmp); initNumberPageCurrent:=strtoint(tmp);
 cmdSql(0,'select s.value from settings s where s.param = "numberPageMax";',tmp); initNumberPageMax:=strtoint(tmp);


  // Register Hotkey Ctrl + 1
  id_C_0 := GlobalAddAtom('Hotkey_C_0'); RegisterHotKey(Handle, id_C_0, modUse, VK_0);
  id_C_1 := GlobalAddAtom('Hotkey_C_1'); RegisterHotKey(Handle, id_C_1, modUse, VK_1);
  id_C_2 := GlobalAddAtom('Hotkey_C_2'); RegisterHotKey(Handle, id_C_2, modUse, VK_2);
  id_C_3 := GlobalAddAtom('Hotkey_C_3'); RegisterHotKey(Handle, id_C_3, modUse, VK_3);
  id_C_4 := GlobalAddAtom('Hotkey_C_4'); RegisterHotKey(Handle, id_C_4, modUse, VK_4);
  id_C_5 := GlobalAddAtom('Hotkey_C_5'); RegisterHotKey(Handle, id_C_5, modUse, VK_5);
  id_C_6 := GlobalAddAtom('Hotkey_C_6'); RegisterHotKey(Handle, id_C_6, modUse, VK_6);
  id_C_7 := GlobalAddAtom('Hotkey_C_7'); RegisterHotKey(Handle, id_C_7, modUse, VK_7);
  id_C_8 := GlobalAddAtom('Hotkey_C_8'); RegisterHotKey(Handle, id_C_8, modUse, VK_8);
  id_C_9 := GlobalAddAtom('Hotkey_C_9'); RegisterHotKey(Handle, id_C_9, modUse, VK_9);

  id_C_T := GlobalAddAtom('Hotkey_C_T'); RegisterHotKey(Handle, id_C_T, modUse, VK_T);
  id_C_G := GlobalAddAtom('Hotkey_C_G'); RegisterHotKey(Handle, id_C_G, modUse, VK_G);
  id_C_S := GlobalAddAtom('Hotkey_C_S'); RegisterHotKey(Handle, id_C_S, modUse, VK_S);

  id_C_SB := GlobalAddAtom('Hotkey_C_SB'); RegisterHotKey(Handle, id_C_SB, modUse, VK_SB);

  id_C_l := GlobalAddAtom('Hotkey_C_l'); RegisterHotKey(Handle, id_C_l, modUse, VK_l);
  id_C_p := GlobalAddAtom('Hotkey_C_p'); RegisterHotKey(Handle, id_C_p, modUse, VK_p);
  id_C_m := GlobalAddAtom('Hotkey_C_m'); RegisterHotKey(Handle, id_C_m, modUse, VK_m);



  id_following := GlobalAddAtom('Hotkey_following'); RegisterHotKey(Handle, id_following, modUse, VK_following);
  id_previous := GlobalAddAtom('Hotkey_C_previous'); RegisterHotKey(Handle, id_previous, modUse, VK_previous);

//
 status.Panels[1].Text:='';

end;
procedure Tmain.FormDestroy(Sender: TObject);
begin
//
//  savePageSql();
//горячие клавиши
  UnRegisterHotkey(Handle, id1); GlobalDeleteAtom(id1);
  UnRegisterHotkey(Handle, id2); GlobalDeleteAtom(id2);
  UnRegisterHotkey(Handle, id3); GlobalDeleteAtom(id3);
  UnRegisterHotkey(Handle, id4); GlobalDeleteAtom(id4);

  UnRegisterHotkey(Handle, id_C_0); GlobalDeleteAtom(id_C_0);
  UnRegisterHotkey(Handle, id_C_1); GlobalDeleteAtom(id_C_1);
  UnRegisterHotkey(Handle, id_C_2); GlobalDeleteAtom(id_C_2);
  UnRegisterHotkey(Handle, id_C_3); GlobalDeleteAtom(id_C_3);
  UnRegisterHotkey(Handle, id_C_4); GlobalDeleteAtom(id_C_4);
  UnRegisterHotkey(Handle, id_C_5); GlobalDeleteAtom(id_C_5);
  UnRegisterHotkey(Handle, id_C_6); GlobalDeleteAtom(id_C_6);
  UnRegisterHotkey(Handle, id_C_7); GlobalDeleteAtom(id_C_7);
  UnRegisterHotkey(Handle, id_C_8); GlobalDeleteAtom(id_C_8);
  UnRegisterHotkey(Handle, id_C_9); GlobalDeleteAtom(id_C_9);

  UnRegisterHotkey(Handle, id_C_T); GlobalDeleteAtom(id_C_T);
  UnRegisterHotkey(Handle, id_C_G); GlobalDeleteAtom(id_C_G);

  UnRegisterHotkey(Handle, id_C_SB); GlobalDeleteAtom(id_C_SB);

  UnRegisterHotkey(Handle, id_C_l); GlobalDeleteAtom(id_C_l);
  UnRegisterHotkey(Handle, id_C_p); GlobalDeleteAtom(id_C_p);
  UnRegisterHotkey(Handle, id_C_m); GlobalDeleteAtom(id_C_m);


  UnRegisterHotkey(Handle, id_following); GlobalDeleteAtom(id_following);
  UnRegisterHotkey(Handle, id_previous); GlobalDeleteAtom(id_previous);

//ini
  ini.Free;


end;
procedure Tmain.FormPaint(Sender: TObject);
begin
  main.status.Panels[0].text:='';
end;

procedure Tmain.FormResize(Sender: TObject);
begin
  //начало изменений формы
  //item width
  main.item0.Width := 120 + ((main.Width - 312) div 2);
  main.item1.Width := 120 + ((main.Width - 312) div 2);
  main.item2.Width := 120 + ((main.Width - 312) div 2);
  main.item3.Width := 120 + ((main.Width - 312) div 2);
  main.item4.Width := 120 + ((main.Width - 312) div 2);
  main.item5.Width := 120 + ((main.Width - 312) div 2);
  main.item6.Width := 120 + ((main.Width - 312) div 2);
  main.item7.Width := 120 + ((main.Width - 312) div 2);
  main.item8.Width := 120 + ((main.Width - 312) div 2);
  main.item9.Width := 120 + ((main.Width - 312) div 2);

//note width
  main.note0.Width := 120 + ((main.Width - 312) div 2);
  main.note0.Left := main.copy0.Width + main.paste0.Width + main.item0.Width;

  main.note1.Width := 120 + ((main.Width - 312) div 2);
  main.note1.Left := main.copy1.Width + main.paste1.Width + main.item1.Width;

  main.note2.Width := 120 + ((main.Width - 312) div 2);
  main.note2.Left := main.copy2.Width + main.paste2.Width + main.item2.Width;

  main.note3.Width := 120 + ((main.Width - 312) div 2);
  main.note3.Left := main.copy3.Width + main.paste3.Width + main.item3.Width;

  main.note4.Width := 120 + ((main.Width - 312) div 2);
  main.note4.Left := main.copy4.Width + main.paste4.Width + main.item4.Width;

  main.note5.Width := 120 + ((main.Width - 312) div 2);
  main.note5.Left := main.copy5.Width + main.paste5.Width + main.item5.Width;

  main.note6.Width := 120 + ((main.Width - 312) div 2);
  main.note6.Left := main.copy6.Width + main.paste6.Width + main.item6.Width;

  main.note7.Width := 120 + ((main.Width - 312) div 2);
  main.note7.Left := main.copy7.Width + main.paste7.Width + main.item7.Width;

  main.note8.Width := 120 + ((main.Width - 312) div 2);
  main.note8.Left := main.copy8.Width + main.paste8.Width + main.item8.Width;

  main.note9.Width := 120 + ((main.Width - 312) div 2);
  main.note9.Left := main.copy9.Width + main.paste9.Width + main.item9.Width;
  // item height

  main.item1.Height := ((main.Height-36) div 11);

  main.item2.Height := ((main.Height - 36) div 11);
  main.item2.top := 20 + main.item1.Height;

  main.item3.Height := (main.Height - 36) div 11;
  main.item3.top := 20 + main.item1.Height*2;

  main.item4.Height := (main.Height - 36) div 11;
  main.item4.top := 20 + main.item1.Height*3;

  main.item5.Height := (main.Height - 36) div 11;
  main.item5.top := 20 + main.item1.Height*4;

  main.item6.Height := (main.Height - 36) div 11;
  main.item6.top := 20 + main.item1.Height*5;

  main.item7.Height := (main.Height - 36) div 11;
  main.item7.top := 20 + main.item1.Height*6;

  main.item8.Height := (main.Height - 36) div 11;
  main.item8.top := 20 + main.item1.Height*7;

  main.item9.Height := (main.Height - 36) div 11;
  main.item9.top := 20 + main.item1.Height*8;

  main.item0.Height := (main.Height - 36) div 11;
  main.item0.top := 20 + main.item1.Height*9;
//notice
  main.note1.Height := ((main.Height-36) div 11);

  main.note2.Height := ((main.Height - 36) div 11);
  main.note2.top := 20 + main.item1.Height;

  main.note3.Height := (main.Height - 36) div 11;
  main.note3.top := 20 + main.item1.Height*2;

  main.note4.Height := (main.Height - 36) div 11;
  main.note4.top := 20 + main.item1.Height*3;

  main.note5.Height := (main.Height - 36) div 11;
  main.note5.top := 20 + main.item1.Height*4;

  main.note6.Height := (main.Height - 36) div 11;
  main.note6.top := 20 + main.item1.Height*5;

  main.note7.Height := (main.Height - 36) div 11;
  main.note7.top := 20 + main.item1.Height*6;

  main.note8.Height := (main.Height - 36) div 11;
  main.note8.top := 20 + main.item1.Height*7;

  main.note9.Height := (main.Height - 36) div 11;
  main.note9.top := 20 + main.item1.Height*8;

  main.note0.Height := (main.Height - 36) div 11;
  main.note0.top := 20 + main.item1.Height*9;
//copy height
  main.copy1.Height := ((main.Height-36) div 11);

  main.copy2.Height := ((main.Height - 36) div 11);
  main.copy2.top := 20 + main.item1.Height;

  main.copy3.Height := (main.Height - 36) div 11;
  main.copy3.top := 20 + main.item1.Height*2;

  main.copy4.Height := (main.Height - 36) div 11;
  main.copy4.top := 20 + main.item1.Height*3;

  main.copy5.Height := (main.Height - 36) div 11;
  main.copy5.top := 20 + main.item1.Height*4;

  main.copy6.Height := (main.Height - 36) div 11;
  main.copy6.top := 20 + main.item1.Height*5;

  main.copy7.Height := (main.Height - 36) div 11;
  main.copy7.top := 20 + main.item1.Height*6;

  main.copy8.Height := (main.Height - 36) div 11;
  main.copy8.top := 20 + main.item1.Height*7;

  main.copy9.Height := (main.Height - 36) div 11;
  main.copy9.top := 20 + main.item1.Height*8;

  main.copy0.Height := (main.Height - 36) div 11;
  main.copy0.top := 20 + main.item1.Height*9;
//paste height
  main.paste1.Height := ((main.Height-36) div 11);

  main.paste2.Height := ((main.Height - 36) div 11);
  main.paste2.top := 20 + main.item1.Height;

  main.paste3.Height := (main.Height - 36) div 11;
  main.paste3.top := 20 + main.item1.Height*2;

  main.paste4.Height := (main.Height - 36) div 11;
  main.paste4.top := 20 + main.item1.Height*3;

  main.paste5.Height := (main.Height - 36) div 11;
  main.paste5.top := 20 + main.item1.Height*4;

  main.paste6.Height := (main.Height - 36) div 11;
  main.paste6.top := 20 + main.item1.Height*5;

  main.paste7.Height := (main.Height - 36) div 11;
  main.paste7.top := 20 + main.item1.Height*6;

  main.paste8.Height := (main.Height - 36) div 11;
  main.paste8.top := 20 + main.item1.Height*7;

  main.paste9.Height := (main.Height - 36) div 11;
  main.paste9.top := 20 + main.item1.Height*8;

  main.paste0.Height := (main.Height - 36) div 11;
  main.paste0.top := 20 + main.item1.Height*9;
// goUp
main.goUp0.Top := main.note0.Top;
main.goUp1.Top := main.note1.Top;
main.goUp2.Top := main.note2.Top;
main.goUp3.Top := main.note3.Top;
main.goUp4.Top := main.note4.Top;
main.goUp5.Top := main.note5.Top;
main.goUp6.Top := main.note6.Top;
main.goUp7.Top := main.note7.Top;
main.goUp8.Top := main.note8.Top;
main.goUp9.Top := main.note9.Top;

main.goUp1.Left := main.Width - 50;
main.goUp2.Left := main.Width - 50;
main.goUp3.Left := main.Width - 50;
main.goUp4.Left := main.Width - 50;
main.goUp5.Left := main.Width - 50;
main.goUp6.Left := main.Width - 50;
main.goUp7.Left := main.Width - 50;
main.goUp8.Left := main.Width - 50;
main.goUp9.Left := main.Width - 50;
main.goUp0.Left := main.Width - 50;
//////


// height = 16;
main.copyright.Left := main.Width - 80;
main.copyright.Top := 20 + main.item1.Height*10;
//   верхние элементы
main.previousPage.Left := main.copy1.Width;
main.titleItems.Left := main.copy1.Width + 20;
main.titleItems.Width := main.item0.Width * 2 - 43;
main.followingPage.Left := main.titleItems.left + main.titleItems.Width;
main.changeTitle.Left := main.followingPage.Left + 22;
//



end;

procedure Tmain.goUp0Click(Sender: TObject);
begin
  goUp(0);
end;

procedure Tmain.goUp1Click(Sender: TObject);
begin
  goUp(1);
end;

procedure Tmain.goUp2Click(Sender: TObject);
begin
  goUp(2);
end;

procedure Tmain.goUp3Click(Sender: TObject);
begin
  goUp(3);
end;

procedure Tmain.goUp4Click(Sender: TObject);
begin
  goUp(4);
end;

procedure Tmain.goUp5Click(Sender: TObject);
begin
  goUp(5);
end;

procedure Tmain.goUp6Click(Sender: TObject);
begin
  goUp(6);
end;

procedure Tmain.goUp7Click(Sender: TObject);
begin
  goUp(7);
end;

procedure Tmain.goUp8Click(Sender: TObject);
begin
  goUp(8);
end;

procedure Tmain.goUp9Click(Sender: TObject);
begin
  goUp(9);
end;

procedure Tmain.N0811Click(Sender: TObject);
begin
  showmessage('Базу дотяну с 0.8.0 до 0.8.1');
  cmdSql(1,'insert INTO settings (param,value) VALUES ("BashCheack","1");',tmp);
end;

procedure Tmain.N10Click(Sender: TObject);
begin
fTimer.show;
end;

procedure Tmain.N11Click(Sender: TObject);
begin

main.cmdSql(1,'DELETE FROM shortcuts;',tmp);
main.cmdSql(1,'drop table shortcuts;',tmp);
cmdSql(1,'create table shortcuts (shortcut text,cmd text);',tmp);
cmdSql(1,'INSERT INTO shortcuts (shortcut, cmd) VALUES ("g", "буфер G");',tmp);
cmdSql(1,'INSERT INTO shortcuts (shortcut, cmd) VALUES ("l", "буфер L");',tmp);
cmdSql(1,'INSERT INTO shortcuts (shortcut, cmd) VALUES ("p", "буфер P");',tmp);
cmdSql(1,'INSERT INTO shortcuts (shortcut, cmd) VALUES ("m", "буфер M");',tmp);

showmessage('Успешно сброшена!');
end;

procedure Tmain.N2Click(Sender: TObject);
begin
    if main.N2.Checked then main.FormStyle:=fsStayOnTop
      else main.FormStyle:=fsNormal;
end;
procedure Tmain.N3Click(Sender: TObject);
var tmp : string;
begin
  savePageSql();

  
end;
procedure Tmain.N4Click(Sender: TObject);
var tmp:string;
begin
settings.Show;

cmdSql(0,'select s.value FROM settings s where s.param="numberPageMax"',tmp);
settings.EditNumberMaxPage.Text :=trim(tmp);

cmdSql(0,'select s.cmd FROM shortcuts s where s.shortcut="g"',tmp);
settings.EditBuferG.Text :=main.trimoutSql(tmp);

end;
procedure Tmain.N5Click(Sender: TObject);
begin
    if main.N5.Checked then buffer.FormStyle:=fsStayOnTop
      else buffer.FormStyle:=fsNormal;

end;
procedure Tmain.N6Click(Sender: TObject);
begin
buffer.Close;
end;
procedure Tmain.N7Click(Sender: TObject);
begin
  buffer.FormStyle:=fsStayOnTop;
  main.N5.Checked:=true;
  buffer.Show;
end;
procedure Tmain.N8Click(Sender: TObject);
var
  newNumberPage, oldNumberPage: string;
begin
  newNumberPage := InputBox('Смена страниц', 'поменять эту страницу на:', '');

  if  ((newNumberPage.Length=0) or ((strtoint(newNumberPage)<0) and (strtoint(newNumberPage) > strtoint(main.pageNumber.Caption)))) then main.status.Panels.Items[1].Text:= 'так нельзя! :(' else begin

    oldNumberPage:= main.pageNumber.Caption;

    main.status.Panels[1].Text:=  newNumberPage;

    tmpMass[1]:= main.item1.Text;
    tmpMass[2]:= main.item2.Text;
    tmpMass[3]:= main.item3.Text;
    tmpMass[4]:= main.item4.Text;
    tmpMass[5]:= main.item5.Text;
    tmpMass[6]:= main.item6.Text;
    tmpMass[7]:= main.item7.Text;
    tmpMass[8]:= main.item8.Text;
    tmpMass[9]:= main.item9.Text;
    tmpMass[0]:= main.item0.Text;
    tmpMass[11]:= main.note1.Text;
    tmpMass[12]:= main.note2.Text;
    tmpMass[13]:= main.note3.Text;
    tmpMass[14]:= main.note4.Text;
    tmpMass[15]:= main.note5.Text;
    tmpMass[16]:= main.note6.Text;
    tmpMass[17]:= main.note7.Text;
    tmpMass[18]:= main.note8.Text;
    tmpMass[19]:= main.note9.Text;
    tmpMass[10]:= main.note0.Text;
    tmpMass[20]:= main.titleItems.Text;

    pageinitsql(strtoint(newNumberPage));

    tmpMass[31]:= main.item1.Text;
    tmpMass[32]:= main.item2.Text;
    tmpMass[33]:= main.item3.Text;
    tmpMass[34]:= main.item4.Text;
    tmpMass[35]:= main.item5.Text;
    tmpMass[36]:= main.item6.Text;
    tmpMass[37]:= main.item7.Text;
    tmpMass[38]:= main.item8.Text;
    tmpMass[39]:= main.item9.Text;
    tmpMass[30]:= main.item0.Text;
    tmpMass[41]:= main.note1.Text;
    tmpMass[42]:= main.note2.Text;
    tmpMass[43]:= main.note3.Text;
    tmpMass[44]:= main.note4.Text;
    tmpMass[45]:= main.note5.Text;
    tmpMass[46]:= main.note6.Text;
    tmpMass[47]:= main.note7.Text;
    tmpMass[48]:= main.note8.Text;
    tmpMass[49]:= main.note9.Text;
    tmpMass[40]:= main.note0.Text;
    tmpMass[50]:= main.titleItems.Text;

    main.item1.Text := tmpMass[1];
    main.item2.Text := tmpMass[2];
    main.item3.Text := tmpMass[3];
    main.item4.Text := tmpMass[4];
    main.item5.Text := tmpMass[5];
    main.item6.Text := tmpMass[6];
    main.item7.Text := tmpMass[7];
    main.item8.Text := tmpMass[8];
    main.item9.Text := tmpMass[9];
    main.item0.Text := tmpMass[0];
    main.note1.Text := tmpMass[11];
    main.note2.Text := tmpMass[12];
    main.note3.Text := tmpMass[13];
    main.note4.Text := tmpMass[14];
    main.note5.Text := tmpMass[15];
    main.note6.Text := tmpMass[16];
    main.note7.Text := tmpMass[17];
    main.note8.Text := tmpMass[18];
    main.note9.Text := tmpMass[19];
    main.note0.Text := tmpMass[10];
    main.titleItems.Text := tmpMass[20];

    savePageSql();
    pageinitsql(strtoint(oldNumberPage));

    main.item1.Text := tmpMass[31];
    main.item2.Text := tmpMass[32];
    main.item3.Text := tmpMass[33];
    main.item4.Text := tmpMass[34];
    main.item5.Text := tmpMass[35];
    main.item6.Text := tmpMass[36];
    main.item7.Text := tmpMass[37];
    main.item8.Text := tmpMass[38];
    main.item9.Text := tmpMass[39];
    main.item0.Text := tmpMass[30];
    main.note1.Text := tmpMass[41];
    main.note2.Text := tmpMass[42];
    main.note3.Text := tmpMass[43];
    main.note4.Text := tmpMass[44];
    main.note5.Text := tmpMass[45];
    main.note6.Text := tmpMass[46];
    main.note7.Text := tmpMass[47];
    main.note8.Text := tmpMass[48];
    main.note9.Text := tmpMass[49];
    main.note0.Text := tmpMass[40];
    main.titleItems.Text := tmpMass[50];
    savePageSql();

    pageinitsql(strtoint(newNumberPage));
  end;


//  savePage(main.titleItems.Text,strtoint(value));
end;


procedure Tmain.N9Click(Sender: TObject);
var a: word;
begin
a := strtoint(InputBox('Перейти на страницу:', '№', '0'));
if (a >= 0) and (a <= settings.numberPageMax) then begin
  pageinitsql(a);
  main.status.Panels.Items[1].Text:='перешел';
  end else main.status.Panels.Items[1].Text:= 'страница не найдена';




end;

end.
