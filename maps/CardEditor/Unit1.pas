unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ImgList, StdCtrls, ComCtrls, ExtCtrls, IniFiles, Menus, ToolWin,
  TeeProcs, Chart, TeeDragPoint, TeEngine, Series,
  TeeTools, TeePageNumTool, Buttons, Mask, TeeComma;

type
  TForm1 = class(TForm)
    Button1: TButton;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    OpenDialog2: TOpenDialog;
    Card: TGroupBox;
    GroupBox2: TGroupBox;
    Edit1: TEdit;
    Button3: TButton;
    GroupBox3: TGroupBox;
    Edit2: TEdit;
    Button4: TButton;
    GroupBox4: TGroupBox;
    Edit3: TEdit;
    Button5: TButton;
    Button2: TButton;
    ProgressBar1: TProgressBar;
    RadioGroup1: TRadioGroup;
    ImageList1: TImageList;
    Button6: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Button7: TButton;
    Ident_5: TGroupBox;
    Label5: TLabel;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    Edit8: TEdit;
    Edit9: TEdit;
    Edit10: TEdit;
    Edit11: TEdit;
    Edit12: TEdit;
    Edit13: TEdit;
    Edit14: TEdit;
    Edit15: TEdit;
    Edit16: TEdit;
    Edit17: TEdit;
    Edit18: TEdit;
    Edit19: TEdit;
    Edit21: TEdit;
    Edit22: TEdit;
    Edit23: TEdit;
    Edit24: TEdit;
    Edit25: TEdit;
    Edit26: TEdit;
    Edit27: TEdit;
    Edit28: TEdit;
    Gr__1D: TPanel;
    Edit29: TEdit;
    Edit30: TEdit;
    Label4: TLabel;
    Label6: TLabel;
    Edit31: TEdit;
    Label7: TLabel;
    Label8: TLabel;
    Edit32: TEdit;
    Edit33: TEdit;
    Label9: TLabel;
    Edit34: TEdit;
    Edit35: TEdit;
    Edit36: TEdit;
    Edit37: TEdit;
    Edit38: TEdit;
    Edit39: TEdit;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Edit42: TEdit;
    Label15: TLabel;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    ToolBar1: TToolBar;
    ImageList2: TImageList;
    ImageList3: TImageList;
    ImageList4: TImageList;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    Panel1: TPanel;
    TreeView1: TTreeView;
    StatusBar1: TStatusBar;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    ToolButton9: TToolButton;
    ToolButton10: TToolButton;
    ToolButton11: TToolButton;
    ToolButton12: TToolButton;
    ToolButton13: TToolButton;
    ToolButton14: TToolButton;
    ToolButton15: TToolButton;
    ToolButton16: TToolButton;
    ToolButton17: TToolButton;
    ToolButton18: TToolButton;
    ToolButton19: TToolButton;
    ToolButton20: TToolButton;
    PopupMenu1: TPopupMenu;
    N0011: TMenuItem;
    Splitter1: TSplitter;
    Gr__2D: TPanel;
    Chart1: TChart;
    Series1: TLineSeries;
    Label16: TLabel;
    Edit43: TEdit;
    Label17: TLabel;
    Edit44: TEdit;
    Label18: TLabel;
    Edit45: TEdit;
    Label19: TLabel;
    Edit46: TEdit;
    Edit47: TEdit;
    Label20: TLabel;
    Edit48: TEdit;
    Label21: TLabel;
    Edit49: TEdit;
    Label22: TLabel;
    Edit50: TEdit;
    Label23: TLabel;
    Label24: TLabel;
    Edit51: TEdit;
    Edit52: TEdit;
    Label25: TLabel;
    Edit53: TEdit;
    Label26: TLabel;
    Edit54: TEdit;
    Label27: TLabel;
    Edit55: TEdit;
    Label28: TLabel;
    Edit56: TEdit;
    Label29: TLabel;
    Label30: TLabel;
    Edit57: TEdit;
    Edit58: TEdit;
    Label31: TLabel;
    Edit59: TEdit;
    Label33: TLabel;
    Edit61: TEdit;
    Label32: TLabel;
    Series2: TLineSeries;
    Edit60: TEdit;
    Label34: TLabel;
    Edit62: TEdit;
    Series3: TLineSeries;
    Series4: TLineSeries;
    Series5: TLineSeries;
    Series6: TLineSeries;
    Series7: TLineSeries;
    Series8: TLineSeries;
    Series9: TLineSeries;
    Series10: TLineSeries;
    Series11: TLineSeries;
    Series12: TLineSeries;
    Series13: TLineSeries;
    Series14: TLineSeries;
    Series15: TLineSeries;
    Series16: TLineSeries;
    Series17: TLineSeries;
    Series18: TLineSeries;
    Label35: TLabel;
    Edit63: TEdit;
    Label36: TLabel;
    Label37: TLabel;
    Edit64: TEdit;
    Label38: TLabel;
    Label39: TLabel;
    Edit65: TEdit;
    Edit66: TEdit;
    Label40: TLabel;
    Edit67: TEdit;
    ChartTool1: TDragPointTool;
    ChartTool2: TRotateTool;
    Edit20: TEdit;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    Label41: TLabel;
    StaticText1: TStaticText;
    StaticText2: TStaticText;
    ToolButton21: TToolButton;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    N5: TMenuItem;
    Bevel1: TBevel;
    P_Dir: TPanel;
    Edit40: TEdit;
    Label42: TLabel;
    SpeedButton9: TSpeedButton;
    SpeedButton10: TSpeedButton;
    PopupMenu2: TPopupMenu;
    N10: TMenuItem;
    N11: TMenuItem;
    N2D1: TMenuItem;
    N3D1: TMenuItem;
    N1D1: TMenuItem;
    N12: TMenuItem;
    N13: TMenuItem;
    Flagi: TPanel;
    Bevel2: TBevel;
    Edit41: TEdit;
    Edit68: TEdit;
    Label43: TLabel;
    Label44: TLabel;
    Edit69: TEdit;
    Label45: TLabel;
    Edit70: TEdit;
    Edit71: TEdit;
    Edit72: TEdit;
    Edit73: TEdit;
    Edit74: TEdit;
    Edit75: TEdit;
    Edit76: TEdit;
    RadioGroup3: TRadioGroup;
    SpeedButton11: TSpeedButton;
    SpeedButton12: TSpeedButton;
    N14: TMenuItem;
    Edit77: TEdit;
    N15: TMenuItem;
    N6: TMenuItem;
    Label46: TLabel;
    edtField1_3D: TEdit;
    lbl1: TLabel;
    edtField2_3D: TEdit;
    lbl2: TLabel;
    edtField3_3D: TEdit;
    lbl3: TLabel;
    edtField4_3D: TEdit;
    lbl4: TLabel;
    edtField5_3D: TEdit;
    lbl5: TLabel;
    edtField6_3D: TEdit;
    edt1D_Offset32: TEdit;
    lbl6: TLabel;
    lbl7: TLabel;
    edt1D_ID: TEdit;
    lbl8: TLabel;
    edtFlags_ID: TEdit;
    lbl9: TLabel;
    edtIdent_ID: TEdit;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure Edit2Change(Sender: TObject);
    procedure Edit3Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure TreeView1Change(Sender: TObject; Node: TTreeNode);
    procedure N0011Click(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure ToolButton20Click(Sender: TObject);
    procedure Edit30KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit21KeyPress(Sender: TObject; var Key: Char);
    procedure Edit21Click(Sender: TObject);
    procedure Edit22Click(Sender: TObject);
    procedure Edit23Click(Sender: TObject);
    procedure Edit24Click(Sender: TObject);
    procedure Edit25Click(Sender: TObject);
    procedure Edit26Click(Sender: TObject);
    procedure Edit27Click(Sender: TObject);
    procedure Edit28Click(Sender: TObject);
    procedure Edit12Click(Sender: TObject);
    procedure Edit13Click(Sender: TObject);
    procedure Edit14Click(Sender: TObject);
    procedure Edit15Click(Sender: TObject);
    procedure Edit16Click(Sender: TObject);
    procedure Edit17Click(Sender: TObject);
    procedure Edit18Click(Sender: TObject);
    procedure Edit19Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure Edit12KeyPress(Sender: TObject; var Key: Char);
    procedure Edit13KeyPress(Sender: TObject; var Key: Char);
    procedure Edit14KeyPress(Sender: TObject; var Key: Char);
    procedure Edit15KeyPress(Sender: TObject; var Key: Char);
    procedure Edit16KeyPress(Sender: TObject; var Key: Char);
    procedure Edit17KeyPress(Sender: TObject; var Key: Char);
    procedure Edit18KeyPress(Sender: TObject; var Key: Char);
    procedure Edit19KeyPress(Sender: TObject; var Key: Char);
    procedure Edit22KeyPress(Sender: TObject; var Key: Char);
    procedure Edit23KeyPress(Sender: TObject; var Key: Char);
    procedure Edit24KeyPress(Sender: TObject; var Key: Char);
    procedure Edit25KeyPress(Sender: TObject; var Key: Char);
    procedure Edit26KeyPress(Sender: TObject; var Key: Char);
    procedure Edit27KeyPress(Sender: TObject; var Key: Char);
    procedure Edit28KeyPress(Sender: TObject; var Key: Char);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure Edit31KeyPress(Sender: TObject; var Key: Char);
    procedure Edit34KeyPress(Sender: TObject; var Key: Char);
    procedure Edit42KeyPress(Sender: TObject; var Key: Char);
    procedure Edit31Click(Sender: TObject);
    procedure Edit34Click(Sender: TObject);
    procedure Edit42Click(Sender: TObject);
    procedure Edit32KeyPress(Sender: TObject; var Key: Char);
    procedure Edit33KeyPress(Sender: TObject; var Key: Char);
    procedure Edit35KeyPress(Sender: TObject; var Key: Char);
    procedure Edit36KeyPress(Sender: TObject; var Key: Char);
    procedure Edit37KeyPress(Sender: TObject; var Key: Char);
    procedure Edit38KeyPress(Sender: TObject; var Key: Char);
    procedure Edit39KeyPress(Sender: TObject; var Key: Char);
    procedure SpeedButton6Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure Edit48KeyPress(Sender: TObject; var Key: Char);
    procedure Edit64KeyPress(Sender: TObject; var Key: Char);
    procedure Edit43KeyPress(Sender: TObject; var Key: Char);
    procedure Edit44KeyPress(Sender: TObject; var Key: Char);
    procedure Edit60KeyPress(Sender: TObject; var Key: Char);
    procedure Edit59KeyPress(Sender: TObject; var Key: Char);
    procedure Edit53KeyPress(Sender: TObject; var Key: Char);
    procedure Edit67KeyPress(Sender: TObject; var Key: Char);
    procedure N4Click(Sender: TObject);
    procedure ToolButton3Click(Sender: TObject);
    procedure SpeedButton10Click(Sender: TObject);
    procedure SpeedButton9Click(Sender: TObject);
    procedure N10Click(Sender: TObject);
    procedure N11Click(Sender: TObject);
    procedure N2D1Click(Sender: TObject);
    procedure N3D1Click(Sender: TObject);
    procedure N1D1Click(Sender: TObject);
    procedure RadioGroup3Click(Sender: TObject);
    procedure N12Click(Sender: TObject);
    procedure SpeedButton11Click(Sender: TObject);
    procedure SpeedButton12Click(Sender: TObject);
    procedure N13Click(Sender: TObject);
    procedure N15Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure Chart1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
    Root1 : TTreeNode;
  end;

var
  Form1: TForm1;
//***** файл с данными Byte   (1 байт) **********
  OutFile, InFile: File of Byte;
  LogFile: TextFile;
  LogName: string; 
  Bufer : array of Byte;
  Tmp_B : array of Byte;
//****************************************
  MyPopUpItems: array[0..9] of TMenuItem;
  temp_id, temp_adr: Integer;
  temp_st: string; 


  Num, SizeFile : Integer;
  kp, pm, gr_1d, gr_2d, gr_3d, en_d, id, err_bl, err_T, o_t: integer;
  fl_wr: boolean;
//******************************************************************************
st_3: array[0..21] of Byte =($43,$54,$4D,$03,$01,$00,$00,$00,$00,$00,$00,$00,
$00,$00,$00,$00,$00,$00,$00,$00,$00,$00);
st_3_1: array[0..2] of Byte =($01,$05,$8F);
//******************************************************************************
st_4: array[0..21] of Byte =($43,$54,$4D,$04,$00,$00,$36,$35,$33,$32,$35,$35,
$35,$33,$00,$00,$00,$00,$00,$00,$00,$00);
//******************************************************************************
implementation

uses C_5_4, C_4, C_3, Bar, About;

{$R *.dfm}

//******************************************************************************
procedure FileToBufRead (NamFil: string);
var
n: integer;
  begin
     AssignFile(InFile, NamFil);
     Reset(InFile);
     SizeFile := FileSize(InFile);
     SetLength (Bufer, SizeFile);
        Num := SizeFile;
        for n := 0 to SizeFile - 1 do
        begin
          Read (InFile, Bufer[n]);
        end;
        CloseFile(InFile);
end;

//******************************************************************************
//******************************************************************************
procedure Conv5to3 (FileName: string);
var
Dl_bl, n, tmp,mt: integer;
begin
  AssignFile(OutFile, Form1.SaveDialog1.FileName);
  Rewrite (OutFile);
  for n := 0 to 21 do Write (OutFile, st_3[n]);      // заголовок карты
  for n := $16 to $56 do Write (OutFile, Bufer[n]);  // первое меню...
  for n := 0 to 2  do Write (OutFile, st_3_1[n]);      //
  for n := $61 to $A5 do Write (OutFile, Bufer[n]);  //
  Write (OutFile, Bufer[$A5]);

  for n := 0 to 7 do // для коррекции данных из карты...   // для VS56  !!!!
  if (Bufer[$A6+4*n] <> $FF) then Bufer[$A7+4*n] := Bufer[$A7+4*n] and $7F;

  for n := $A6 to $115 do Write (OutFile, Bufer[n]);  Write (OutFile, Bufer[$115]);
  for n := $116 to $155 do Write (OutFile, Bufer[n]); Write (OutFile, Bufer[$155]);
  for n := $156 to $195 do Write (OutFile, Bufer[n]); Write (OutFile, Bufer[$195]);
  for n := $196 to $1D5 do Write (OutFile, Bufer[n]); Write (OutFile, Bufer[$1D5]);
  for n := $1D6 to $215 do Write (OutFile, Bufer[n]); Write (OutFile, Bufer[$215]);
  for n := $216 to $255 do Write (OutFile, Bufer[n]); Write (OutFile, Bufer[$255]);
  for n := $256 to $295 do Write (OutFile, Bufer[n]); Write (OutFile, Bufer[$295]);
  for n := $296 to $2E2 do Write (OutFile, Bufer[n]); Write (OutFile, Bufer[$2E2]);
  Write (OutFile, Bufer[$2E2]); Write (OutFile, Bufer[$2E2]); Write (OutFile, Bufer[$2E2]);

  Dl_bl := Bufer[$61]*$100 + Bufer[$60] + $60;

  while Dl_bl < SizeFile - 2 do
    begin
     tmp := Dl_bl;

     if ((Bufer[tmp+1]=0) and ((Bufer[tmp+3]*$100 + Bufer[tmp+2]) > 0)) then // начало блока...
      begin
        for n := tmp to tmp+$42 do Write (OutFile, Bufer[n]);
        inc(Dl_bl,$4A);
      end;

     if ((Bufer[tmp+1]=0) and ((Bufer[tmp+3]*$100 + Bufer[tmp+2]) = 0)) then // плодменю...
      begin
       for n := tmp to tmp+$44 do Write (OutFile, Bufer[n]);
       inc(Dl_bl,$4C);
      end;

     if (Bufer[tmp+1]=1) then                                                // график - Line
      begin
       // строим пустой график
       for n := tmp to tmp+1 do Write (OutFile, Bufer[n]);
       mt:=$AE; Write (OutFile, mt);
       for n := tmp+3 to tmp+7 do Write (OutFile, Bufer[n]);

       Bufer[tmp+$13] := Bufer[tmp+$13] and $7F;                  // для VS56  !!!!
       for n := tmp+$12 to tmp+$15 do Write (OutFile, Bufer[n]);  // данные для графика в прошивке

       for n := tmp+$4C to tmp+$6B do Write (OutFile, Bufer[n]);
       mt:=$00; Write (OutFile, mt);
       for n := tmp+$6C to tmp+$8B do Write (OutFile, Bufer[n]);
       for n := 0 to $108 do Write (OutFile, mt);
       // запоонение параметров графика...
       Write (OutFile, Bufer[tmp+$30]);                 // точек по оси Х
       Write (OutFile, Bufer[tmp+$31]);
//       for n := 0 to 5 do Write (OutFile, mt);
//       for n := tmp+$38 to tmp+$43 do Write (OutFile, Bufer[n]); // начало - конец оси Х
       for n := 0 to 1 do Write (OutFile, mt);
       for n := tmp+$34 to tmp+$43 do Write (OutFile, Bufer[n]); // начало - конец оси Х
       for n := 0 to 16 do Write (OutFile, mt);
       mt:=$01; Write (OutFile, mt); mt:=$00;           // ????? по Y
       for n := 0 to 2 do Write (OutFile, mt);
       Write (OutFile, Bufer[tmp+$33]);                 // знаков после запятой на графике
       for n := 0 to 3 do Write (OutFile, mt);

       for n := 0 to 2 do Write (OutFile, mt);          // масштаб по Y  ???? +
       mt:=$40; Write (OutFile, mt); mt:=$00;           // масштаб по Y  ????

       for n := 0 to $13 do Write (OutFile, mt);
       for n := 0 to 2 do Write (OutFile, mt);          // масштаб по Y  ???? +
       mt:=$40; Write (OutFile, mt); mt:=$00;           // масштаб по Y  ????

       for n := 0 to 15 do Write (OutFile, mt);
       inc(Dl_bl,(Bufer[tmp+3]*$100 + Bufer[tmp+2]+2));
      end;

     if (Bufer[tmp+1]=2) then                                                 // график - 3D
      begin
       // строим график
       for n := tmp to tmp+1 do Write (OutFile, Bufer[n]);              // заголовок торировки
       mt:=$E2; Write (OutFile, mt); Write (OutFile, Bufer[tmp+3]);     // 'xx 02 E2 02'

       for n := tmp+4 to tmp+7 do Write (OutFile, Bufer[n]);            // ID для функции сравнения

                                                                  // адрес тарировки в прошивке
       Bufer[tmp+$13] := Bufer[tmp+$13] and $7F;                  // для VS56  !!!!
       for n := tmp+$12 to tmp+$15 do Write (OutFile, Bufer[n]);  // !!!  это ксорится   !!!

       mt:=0; for n := 0 to 3 do Write (OutFile, mt);                             // ?
       mt:=1; Write (OutFile, mt); mt:=0; for n := 0 to 2 do Write (OutFile, mt); // ? флаговая ячейка

       for n := tmp+$67 to tmp+$86 do Write (OutFile, Bufer[n]); mt:=$00; Write (OutFile, mt); // название X
       for n := tmp+$87 to tmp+$A6 do Write (OutFile, Bufer[n]); mt:=$00; Write (OutFile, mt); // название Y
       for n := tmp+$A7 to tmp+$C6 do Write (OutFile, Bufer[n]); mt:=$00; Write (OutFile, mt); // название Z
       mt:=0; Write (OutFile, mt);
       for n := tmp+$C7 to tmp+$2C5 do Write (OutFile, mt);             // Bufer[n]);

       for n := tmp+$30 to tmp+$31 do Write (OutFile, Bufer[n]);        // точек по X
       for n := tmp+$34 to tmp+$35 do Write (OutFile, Bufer[n]);        // FFFF  ???
       for n := tmp+$32 to tmp+$33 do Write (OutFile, Bufer[n]);        // точек по Z

       mt:=0; for n := 0 to 2 do Write (OutFile, mt);
//       for n := tmp+$3B to tmp+$3E do Write (OutFile, Bufer[n]);        // величина по -X
       mt:=$00; Write (OutFile, mt); mt:=$00; Write (OutFile, mt);      //
       mt:=$7E; Write (OutFile, mt); mt:=$40; Write (OutFile, mt);      // $407E0000 = 480
       mt:=0; for n := 0 to 3 do Write (OutFile, mt);
//       for n := tmp+$43 to tmp+$46 do Write (OutFile, Bufer[n]);        // величина по +X
//       for n := tmp+$43 to tmp+$45 do Write (OutFile, Bufer[n]);        // величина по +X
//       n := tmp+$46 Write (OutFile, (Bufer[n] or $40);        // величина по +X

       mt:=$00; Write (OutFile, mt); mt:=$20; Write (OutFile, mt);      //
       mt:=$BC; Write (OutFile, mt); mt:=$40; Write (OutFile, mt);      //  $40BB5800 = 7000
       mt:=$FF; Write (OutFile, mt);                                    //  $40BC2000 = 7200
       // запоонение параметров графика...

//       mt:=0; for n := 0 to 3 do Write (OutFile, mt);
//       for n := tmp+$4B to tmp+$4E do Write (OutFile, Bufer[n]);        // величина по -Y ??
       for n := tmp+$47 to tmp+$4E do Write (OutFile, Bufer[n]);        // величина по -Y ??
//       mt:=0; for n := 0 to 3 do Write (OutFile, mt);
//       mt:=0; for n := 0 to 3 do Write (OutFile, mt);
//       for n := tmp+$53 to tmp+$56 do Write (OutFile, Bufer[n]);        // величина по +Y ??
       for n := tmp+$4F to tmp+$56 do Write (OutFile, Bufer[n]);        // величина по +Y ??
       mt:=$FF; Write (OutFile, mt);

//       mt:=0; for n := 0 to 3 do Write (OutFile, mt);
//       for n := tmp+$5B to tmp+$5E do Write (OutFile, Bufer[n]);        // величина по -Z
       for n := tmp+$57 to tmp+$5E do Write (OutFile, Bufer[n]);        // величина по -Z
//       mt:=0; for n := 0 to 3 do Write (OutFile, mt);
//       for n := tmp+$63 to tmp+$66 do Write (OutFile, Bufer[n]);        // величина по +Z
       for n := tmp+$5F to tmp+$66 do Write (OutFile, Bufer[n]);        // величина по +Z
       mt:=$FF; Write (OutFile, mt);

       mt:=$04; Write (OutFile, mt); mt:=$00; Write (OutFile, mt);      // ??????????????
       mt:=$00; Write (OutFile, mt);
       
       mt:=$01; Write (OutFile, mt); mt:=$00; Write (OutFile, mt);      // знаков после запятой по X
       mt:=0; for n := 0 to 3 do Write (OutFile, mt);

       mt:=$00; Write (OutFile, mt); mt:=$00; Write (OutFile, mt);      //    ??   Y
       mt:=$F0; Write (OutFile, mt); mt:=$3F; Write (OutFile, mt);      //    ??   Y
       mt:=0; for n := 0 to 3 do Write (OutFile, mt);
       mt:=0; for n := 0 to $0F do Write (OutFile, mt);
       mt:=$00; Write (OutFile, mt); mt:=$00; Write (OutFile, mt);      //    ??   Y
//       mt:=$80; Write (OutFile, mt); mt:=$3F; Write (OutFile, mt);      //    ??   Y
       mt:=$70; Write (OutFile, mt); mt:=$3F; Write (OutFile, mt);      //    ??   Y

       mt:=0; for n := 0 to $0F do Write (OutFile, mt);

       inc(Dl_bl,(Bufer[tmp+3]*$100 + Bufer[tmp+2]+2));
      end;
    end;

  Write (OutFile, Bufer[SizeFile - 2]);
  Write (OutFile, Bufer[SizeFile - 1]);
  CloseFile (OutFile);
end;

//******************************************************************************

//******************************************************************************
procedure TForm1.Button1Click(Sender: TObject);
begin
  Form1.Button1.Enabled := false;
  kp:=1; pm:=0; gr_2d:=0; gr_3d:=0; gr_1d:=0; en_d:=0; id:=0; err_bl:=0;
  if Form1.OpenDialog1.Execute then FileToBufRead (OpenDialog1.FileName);
  if Form1.SaveDialog1.Execute then Conv5to3 (OpenDialog1.FileName);
  Form1.Caption := IntToStr(kp)+': '+IntToStr(id)+'-'+IntToStr(pm)+' - '+
                   IntToStr(gr_2d)+'-'+IntToStr(gr_3d)+'-'+IntToStr(gr_1d)+'-'+
                   IntToStr(en_d)+'-'+IntToStr(err_bl);
  Form1.Button1.Enabled := true;
end;

//******************************************************************************
procedure TForm1.Button2Click(Sender: TObject);
begin
  Form1.Button2.Enabled := false;
  err_T:=0; o_t:=0;
  kp:=1; pm:=0; gr_2d:=0; gr_3d:=0; gr_1d:=0; en_d:=0; id:=0; err_bl:=0;
  Form1.OpenDialog1.Filter := '  Файл прошивки  CTP 5';
  Form1.SaveDialog1.Filter := '  Файл прошивки  CTP 4';
  Form1.OpenDialog2.Filter := 'Лог Файл прошивки  CTP 5';
  if Form1.Edit1.Text <> '' then FileToBufRead (Form1.Edit1.Text);
  if Form1.Edit2.Text <> '' then
  if Form1.Edit3.Text <> '' then Conv5to4 (Form1.Edit3.Text);
  Form1.Caption := 'Тарировок: 1D-' + IntToStr(gr_1d)+';  2D-'+IntToStr(gr_2d)+
                   ';  3D-'+IntToStr(gr_3d)+';    Ошибок: '+ IntToStr(err_T);
  Form1.Button2.Enabled := true;
end;

//******************************************************************************
procedure TForm1.Button3Click(Sender: TObject);
begin
  gr_1d:=0;gr_2d:=0;gr_3d:=0;o_t:=0;err_T:=0;
  Form1.OpenDialog1.Filter := 'Исходный файл  карты    CTP   5';
  if Form1.OpenDialog1.Execute then
    begin
      Form1.Edit1.Text:=Form1.OpenDialog1.FileName;
      FileToBufRead (Form1.Edit1.Text);
      Form1.Caption := 'Найдено тарировок в этой карте: 1D-' + IntToStr(gr_1d)+';  2D-'+IntToStr(gr_2d)+
                   ';  3D-'+IntToStr(gr_3d)+';';
       Form2.ProgressBar1.Max := o_t;
       Form2.ProgressBar1.Position := 0;
    end;
end;

//******************************************************************************
procedure TForm1.Button4Click(Sender: TObject);
begin
  Form1.SaveDialog1.Filter := 'Выходной файл  карты    CTP   4';
  Form1.SaveDialog1.Execute;
  Form1.Edit2.Text:=Form1.SaveDialog1.FileName;
end;

//******************************************************************************
procedure TForm1.Button5Click(Sender: TObject);
begin
  Form1.OpenDialog2.Filter := 'Файл лога работы карты в  CTP 5';
  Form1.OpenDialog2.Execute;
  Form1.Edit3.Text:=Form1.OpenDialog2.FileName;
end;

//******************************************************************************

procedure TForm1.Edit1Change(Sender: TObject);
var  conf: TIniFile;
begin
  conf := TIniFile.Create('_soft.ini');
  conf.WriteString('0_Card', 'Card In', Form1.Edit1.Text);
  conf.Free;
end;

procedure TForm1.Edit2Change(Sender: TObject);
var  conf: TIniFile;
begin
  conf := TIniFile.Create('_soft.ini');
  conf.WriteString('0_Card', 'Card Out', Form1.Edit2.Text);
  conf.Free;
end;

procedure TForm1.Edit3Change(Sender: TObject);
var  conf: TIniFile;
begin
  conf := TIniFile.Create('_soft.ini');
  conf.WriteString('0_Card', 'Card Log', Form1.Edit3.Text);
  conf.Free;
end;

procedure TForm1.FormCreate(Sender: TObject);
var  conf: TIniFile;
begin
  Form1.Top := 0; Form1.Left := 0;
  conf := TIniFile.Create('_soft.ini');
  Form1.Edit1.Text:=conf.ReadString('0_Card', 'Card In', '');
  if Form1.Edit1.Text <> '' then
   begin  // записать в меню загрузки файла...
    Form1.N0011.Caption := Form1.Edit1.Text;
    Form1.OpenDialog1.FileName := Edit1.Text;
   end;

  Form1.P_Dir.Align := alClient;
  Form1.Flagi.Align := alClient;
  Form1.Edit2.Text:=conf.ReadString('0_Card', 'Card Out', '');
  Form1.Edit3.Text:=conf.ReadString('0_Card', 'Card Log', '');
  conf.Free;
end;

procedure TForm1.Button6Click(Sender: TObject);
begin
  Form1.Button6.Enabled := false;
  err_T:=0; o_t:=0;
  kp:=1; pm:=0; gr_2d:=0; gr_3d:=0; gr_1d:=0; en_d:=0; id:=0; err_bl:=0;
  Form1.OpenDialog1.Filter := '  Файл прошивки  CTP 5';
  Form1.SaveDialog1.Filter := '  Файл прошивки  CTP 4';
  Form1.OpenDialog2.Filter := 'Лог Файл прошивки  CTP 5';
  if Form1.Edit1.Text <> '' then FileToBufRead (Form1.Edit1.Text);
  if Form1.Edit2.Text <> '' then
  if Form1.Edit3.Text <> '' then Read_C4 (Form1.Edit3.Text);
  Form1.Caption := 'Тарировок: 1D-' + IntToStr(gr_1d)+';  2D-'+IntToStr(gr_2d)+
                   ';  3D-'+IntToStr(gr_3d)+';';
  Form1.Button6.Enabled := true;
end;

//******************************************************************************
procedure TForm1.Button7Click(Sender: TObject);
begin
  Form1.Button7.Enabled := false;
  err_T:=0; o_t:=0;
  kp:=1; pm:=0; gr_2d:=0; gr_3d:=0; gr_1d:=0; en_d:=0; id:=0; err_bl:=0;
  Form1.OpenDialog1.Filter := '  Файл прошивки  CTP 5';
  Form1.SaveDialog1.Filter := '  Файл прошивки  CTP 4';
  Form1.OpenDialog2.Filter := 'Лог Файл прошивки  CTP 5';
  if Form1.Edit1.Text <> '' then
    begin
      FileToBufRead (Form1.Edit1.Text);
      Read_C3 (0);
    end;
  Form1.Caption := 'Тарировок: 1D-' + IntToStr(gr_1d)+';  2D-'+IntToStr(gr_2d)+
                   ';  3D-'+IntToStr(gr_3d)+';';
  Form1.Button7.Enabled := true;
end;

//******************************************************************************
procedure TForm1.TreeView1Change(Sender: TObject; Node: TTreeNode);
begin
  Node := TreeView1.Selected;
//  if Node.Expand(false) then
//  if Node.ImageIndex = 0 then Node.SelectedIndex := 1
//  if Node.Expanded then Node.SelectedIndex := 1
//  else Node.SelectedIndex := 0;
  if Node.ImageIndex > 1 then Node.SelectedIndex := Node.ImageIndex;
//  Form1.Label1.Caption := ' Адрес в карте = ' + IntToHex(Integer( Node.Data ),4);
   GetPar_C3(node.ImageIndex-1, node.text, Integer( Node.Data ));
end;

//******************************************************************************
procedure OpenFile ();
begin
  Form1.OpenDialog1.Filter := 'Исходный файл  карты    CTP';
  if Form1.OpenDialog1.Execute then
    begin
      Form1.TreeView1.Items.Clear;
      Form1.Edit1.Text:=Form1.OpenDialog1.FileName;
      FileToBufRead (Form1.Edit1.Text);
    GetTar3 ();
      Form2.ProgressBar1.Max := o_t;
      Form2.ProgressBar1.Position := 0;
      Read_C3 (0);
    end;
end;

//******************************************************************************
procedure TForm1.N0011Click(Sender: TObject);
begin
  if Form1.N0011.Caption <> 'Выбери файл карты' then
    begin
      Form1.TreeView1.Items.Clear;
      Form1.Edit1.Text:=Form1.N0011.Caption;
      FileToBufRead (Form1.Edit1.Text);
    GetTar3 ();
      Form2.ProgressBar1.Max := o_t;
      Form2.ProgressBar1.Position := 0;
      Read_C3 (0);
    end;
end;

//******************************************************************************
procedure TForm1.ToolButton1Click(Sender: TObject);
begin
  OpenFile ();
end;

//******************************************************************************
procedure TForm1.N2Click(Sender: TObject);
begin
  OpenFile ();
end;

procedure TForm1.ToolButton20Click(Sender: TObject);
begin
  About.Form3.Show;
end;

//******************************************************************************
//  редактирование строк...
//******************************************************************************
Function SetText(si: string; ks: byte; Adr_c:integer) :TColor;
var I: integer; co: TColor;
begin
  co := clWindowText;
  Adr_c := Adr_c + temp_adr + $45;
  for I:=1 to ks do Bufer[Adr_c+I] := 0;
  I := Length(si);                             // количество символов в строке
  if I > ks then
    begin
      I := ks; co := clRed;
    end;
  Bufer[Adr_c]:=I;                             // количество символов в строке
  while I > 0 do
    begin
      Bufer[Adr_c+I] := Byte(si[I]); dec(I,1); // пишем строку в буфер
    end;
  SetText := co;
end;
//******************************************************************************
procedure TForm1.Edit30KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);                          // ascii размерность.
begin
end;

//******************************************************************************
//  редактирование байт...
//******************************************************************************
Function T_KeyH(In_Key: Char):Char;
begin
  case In_Key of '0'..'9': ;  #8: ; // забой
    'a', 'A', 'b', 'B', 'c', 'C', 'd', 'D', 'e', 'E', 'f', 'F': ;
    else  In_Key := #0;
  end;
  if byte(In_Key) > $39 then T_KeyH := chr(byte(In_Key) and $DF)
  else T_KeyH := In_Key;
end;

//******************************************************************************
Function T_KeyD(In_Key: Char):Char;
begin
  case In_Key of '0'..'9': ;  #8: ; // забой
    '-', ',': ;
    else  In_Key := #0;
  end;
  T_KeyD := In_Key;
end;

//******************************************************************************
Function T_KeyP(In_Key: Char):Char;
begin
  case In_Key of '0'..'9': ;  #8: ; // забой
    else  In_Key := #0;
  end;
  T_KeyP := In_Key;
end;

//******************************************************************************
Function WR_BufID(Adr_b: Integer; Data_b: string; ks: byte; Xor_: boolean):TColor;
var I: integer; n: byte; ww: Int64; co: TColor;
 begin
   Adr_b := Adr_b + temp_adr + $45;
   if Data_B <>'' then
     begin
       I := Length(Data_b);                     // количество символов в строке
       if I = (2 * ks) then  co := clWindowText
       else co := clBlue;
       ww := StrToInt('$'+Data_b);
       if Xor_ = true then ww := ww xor $28A6FBB8;
       for n:=0 to ks-1 do
         begin
           Bufer[Adr_b+ks-1-n] := lo(ww); ww := ww shr 8;
         end;
     end
   else co := clRed;
   WR_BufID := co;
 end;

//******************************************************************************
Function WR_Buf(Adr_b: Integer; Data_b: string; ks: byte; Xor_: boolean):TColor;
var I: integer; n: byte; ww: Int64; co: TColor;
 begin
   Adr_b := Adr_b + temp_adr + $45;
   if Data_B <>'' then
     begin
       I := Length(Data_b);                     // количество символов в строке
       if I = (2 * ks) then  co := clWindowText
       else co := clBlue;
       ww := StrToInt('$'+Data_b);
       if Xor_ = true then ww := ww xor $28A6FBB8;
       for n:=0 to ks-1 do
         begin
           Bufer[Adr_b+n] := lo(ww); ww := ww shr 8;
         end;
     end
   else co := clRed;
   WR_Buf := co;
 end;

//******************************************************************************
Function Wr_Double(Data_D: string; Adr_b: integer):TColor;
var n: integer;  co: TColor;
 b:  PByteArray; ww:  double;
 begin
   Adr_b := Adr_b + temp_adr + $45;
   if Data_D <>'' then
     begin
      co := clWindowText;
      ww := StrToFloat(Data_D);
      b := @ww;
      for n:=0 to 7 do Bufer[Adr_b+n] := b[n];
     end
   else  co := clRed;
   Wr_Double := co;
 end;

//******************************************************************************
procedure TForm1.Edit21KeyPress(Sender: TObject; var Key: Char);
begin
  Key := T_KeyH(Key);
end;

procedure TForm1.Edit21Click(Sender: TObject);
begin
 Form1.Edit21.SelectAll;
end;

procedure TForm1.Edit22Click(Sender: TObject);
begin
 Form1.Edit22.SelectAll;
end;

procedure TForm1.Edit23Click(Sender: TObject);
begin
 Form1.Edit23.SelectAll;
end;

procedure TForm1.Edit24Click(Sender: TObject);
begin
 Form1.Edit24.SelectAll;
end;

procedure TForm1.Edit25Click(Sender: TObject);
begin
 Form1.Edit25.SelectAll;
end;

procedure TForm1.Edit26Click(Sender: TObject);
begin
 Form1.Edit26.SelectAll;
end;

procedure TForm1.Edit27Click(Sender: TObject);
begin
 Form1.Edit27.SelectAll;
end;

procedure TForm1.Edit28Click(Sender: TObject);
begin
 Form1.Edit28.SelectAll;
end;

procedure TForm1.Edit12Click(Sender: TObject);
begin
 Form1.Edit12.SelectAll;
end;

procedure TForm1.Edit13Click(Sender: TObject);
begin
 Form1.Edit13.SelectAll;
end;

procedure TForm1.Edit14Click(Sender: TObject);
begin
 Form1.Edit14.SelectAll;
end;

procedure TForm1.Edit15Click(Sender: TObject);
begin
 Form1.Edit15.SelectAll;
end;

procedure TForm1.Edit16Click(Sender: TObject);
begin
 Form1.Edit16.SelectAll;
end;

procedure TForm1.Edit17Click(Sender: TObject);
begin
 Form1.Edit17.SelectAll;
end;

procedure TForm1.Edit18Click(Sender: TObject);
begin
 Form1.Edit18.SelectAll;
end;

procedure TForm1.Edit19Click(Sender: TObject);
begin
 Form1.Edit19.SelectAll;
end;

procedure TForm1.Edit12KeyPress(Sender: TObject; var Key: Char);
begin
  Key := T_KeyH(Key);
end;

procedure TForm1.Edit13KeyPress(Sender: TObject; var Key: Char);
begin
  Key := T_KeyH(Key);
end;

procedure TForm1.Edit14KeyPress(Sender: TObject; var Key: Char);
begin
  Key := T_KeyH(Key);
end;

procedure TForm1.Edit15KeyPress(Sender: TObject; var Key: Char);
begin
  Key := T_KeyH(Key);
end;

procedure TForm1.Edit16KeyPress(Sender: TObject; var Key: Char);
begin
  Key := T_KeyH(Key);
end;

procedure TForm1.Edit17KeyPress(Sender: TObject; var Key: Char);
begin
  Key := T_KeyH(Key);
end;

procedure TForm1.Edit18KeyPress(Sender: TObject; var Key: Char);
begin
  Key := T_KeyH(Key);
end;

procedure TForm1.Edit19KeyPress(Sender: TObject; var Key: Char);
begin
  Key := T_KeyH(Key);
end;

procedure TForm1.Edit22KeyPress(Sender: TObject; var Key: Char);
begin
  Key := T_KeyH(Key);
end;

procedure TForm1.Edit23KeyPress(Sender: TObject; var Key: Char);
begin
  Key := T_KeyH(Key);
end;

procedure TForm1.Edit24KeyPress(Sender: TObject; var Key: Char);
begin
  Key := T_KeyH(Key);
end;

procedure TForm1.Edit25KeyPress(Sender: TObject; var Key: Char);
begin
  Key := T_KeyH(Key);
end;

procedure TForm1.Edit26KeyPress(Sender: TObject; var Key: Char);
begin
  Key := T_KeyH(Key);
end;

procedure TForm1.Edit27KeyPress(Sender: TObject; var Key: Char);
begin
  Key := T_KeyH(Key);
end;

procedure TForm1.Edit28KeyPress(Sender: TObject; var Key: Char);
begin
  Key := T_KeyH(Key);
end;

//******************************************************************************
procedure TForm1.SpeedButton2Click(Sender: TObject);
begin
  GetPar_C3 (temp_id, temp_st, temp_adr);
end;

//******************************************************************************
procedure TForm1.SpeedButton1Click(Sender: TObject);
var AParent, node: TTreeNode;
begin
  Form1.Edit4.Font.Color := SetText(Form1.Edit4.Text,   40, $75);
  Form1.Edit5.Font.Color := SetText(Form1.Edit5.Text,   40, $B6);
  Form1.Edit6.Font.Color := SetText(Form1.Edit6.Text,   40, $F7);
  Form1.Edit7.Font.Color := SetText(Form1.Edit7.Text,   40, $138);
  Form1.Edit8.Font.Color := SetText(Form1.Edit8.Text,   40, $179);
  Form1.Edit9.Font.Color := SetText(Form1.Edit9.Text,   40, $1BA);
  Form1.Edit10.Font.Color := SetText(Form1.Edit10.Text, 40, $1FB);
  Form1.Edit11.Font.Color := SetText(Form1.Edit11.Text, 40, $23C);

  Form1.Edit20.Font.Color := SetText(Form1.Edit20.Text, 64, +4);
  Form1.Edit20.Font.Color := SetText(Form1.Edit20.Text, 64, -$45);

  edtIdent_ID.Font.Color := Wr_BufID(0, edtIdent_ID.Text, 4, false);

  Form1.Edit12.Font.Color := Wr_Buf($45,Form1.Edit12.Text,4,true);
  Form1.Edit13.Font.Color := Wr_Buf($49,Form1.Edit13.Text,4,false);
  Form1.Edit14.Font.Color := Wr_Buf($4D,Form1.Edit14.Text,4,false);
  Form1.Edit15.Font.Color := Wr_Buf($51,Form1.Edit15.Text,4,false);
  Form1.Edit16.Font.Color := Wr_Buf($55,Form1.Edit16.Text,4,false);
  Form1.Edit17.Font.Color := Wr_Buf($59,Form1.Edit17.Text,4,false);
  Form1.Edit18.Font.Color := Wr_Buf($5D,Form1.Edit18.Text,4,false);
  Form1.Edit19.Font.Color := Wr_Buf($61,Form1.Edit19.Text,4,false);
  Form1.Edit21.Font.Color := Wr_Buf($6D,Form1.Edit21.Text,1,false);
  Form1.Edit22.Font.Color := Wr_Buf($6E,Form1.Edit22.Text,1,false);
  Form1.Edit23.Font.Color := Wr_Buf($6F,Form1.Edit23.Text,1,false);
  Form1.Edit24.Font.Color := Wr_Buf($70,Form1.Edit24.Text,1,false);
  Form1.Edit25.Font.Color := Wr_Buf($71,Form1.Edit25.Text,1,false);
  Form1.Edit26.Font.Color := Wr_Buf($72,Form1.Edit26.Text,1,false);
  Form1.Edit27.Font.Color := Wr_Buf($73,Form1.Edit27.Text,1,false);
  Form1.Edit28.Font.Color := Wr_Buf($74,Form1.Edit28.Text,1,false);
  AParent := Form1.TreeView1.Selected;
  if ( AParent <> nil ) then AParent.Text := Form1.Edit20.Text;
  GetPar_C3 (temp_id, temp_st, temp_adr);
//******************************************************************************
end;
//******************************************************************************


procedure TForm1.SpeedButton3Click(Sender: TObject);
var AParent, node: TTreeNode;
begin
  Form1.Edit29.Font.Color := SetText(Form1.Edit29.Text, 64, -$45);
  Form1.Edit30.Font.Color := SetText(Form1.Edit30.Text,  16,  $10);
  Form1.Edit31.Font.Color := Wr_Buf($4,Form1.Edit31.Text,4,true);
  Form1.Edit32.Font.Color := Wr_Double(Form1.Edit32.Text, $21);
  Form1.Edit33.Font.Color := Wr_Double(Form1.Edit33.Text, $29);
//  Form1.Edit34.Font.Color := SetText(Form1.Edit34.Text, 1, $31);        // тип тарировки
  Bufer[temp_adr + $31 + $45] := StrToInt(Form1.Edit34.Text);
//  Form1.Edit34.Font.Color := Wr_Buf($31,Form1.Edit34.Text,1,false);
  Form1.Edit35.Font.Color := Wr_Double(Form1.Edit35.Text, $33);
  Form1.Edit36.Font.Color := Wr_Double(Form1.Edit36.Text, $3B);
  Form1.Edit37.Font.Color := Wr_Double(Form1.Edit37.Text, $43);
  Form1.Edit38.Font.Color := Wr_Double(Form1.Edit38.Text, $4B);
  Form1.Edit39.Font.Color := Wr_Double(Form1.Edit39.Text, $53);
  Form1.Edit42.Font.Color := Wr_Buf($63,Form1.Edit42.Text,2,false);     // KC ???
  Wr_Buf($32,Form1.edt1D_Offset32.Text, 2, false);
  edt1D_ID.Font.Color := Wr_BufID(0, edt1D_ID.Text, 4, false);
  AParent := Form1.TreeView1.Selected;
  if ( AParent <> nil ) then AParent.Text := Form1.Edit29.Text;
  GetPar_C3 (temp_id, temp_st, temp_adr);
end;

procedure TForm1.SpeedButton4Click(Sender: TObject);
begin
  GetPar_C3 (temp_id, temp_st, temp_adr);
end;

procedure TForm1.Edit31KeyPress(Sender: TObject; var Key: Char);
begin
  Key := T_KeyH(Key);
end;

procedure TForm1.Edit34KeyPress(Sender: TObject; var Key: Char);
begin
  Key := T_KeyD(Key);
end;

procedure TForm1.Edit42KeyPress(Sender: TObject; var Key: Char);
begin
  Key := T_KeyH(Key);
end;

procedure TForm1.Edit31Click(Sender: TObject);
begin
 Form1.Edit31.SelectAll;
end;

procedure TForm1.Edit34Click(Sender: TObject);
begin
 Form1.Edit34.SelectAll;
end;

procedure TForm1.Edit42Click(Sender: TObject);
begin
 Form1.Edit42.SelectAll;
end;

procedure TForm1.Edit32KeyPress(Sender: TObject; var Key: Char);
begin
  Key := T_KeyD(Key);
end;

procedure TForm1.Edit33KeyPress(Sender: TObject; var Key: Char);
begin
  Key := T_KeyD(Key);
end;

procedure TForm1.Edit35KeyPress(Sender: TObject; var Key: Char);
begin
  Key := T_KeyD(Key);
end;

procedure TForm1.Edit36KeyPress(Sender: TObject; var Key: Char);
begin
  Key := T_KeyD(Key);
end;

procedure TForm1.Edit37KeyPress(Sender: TObject; var Key: Char);
begin
  Key := T_KeyD(Key);
end;

procedure TForm1.Edit38KeyPress(Sender: TObject; var Key: Char);
begin
  Key := T_KeyD(Key);
end;

procedure TForm1.Edit39KeyPress(Sender: TObject; var Key: Char);
begin
  Key := T_KeyD(Key);
end;

//******************************************************************************
procedure TForm1.SpeedButton6Click(Sender: TObject);
var AParent, node: TTreeNode;
begin

  Edit47.Font.Color := SetText(Edit47.Text, 64, -$45);
  Edit43.Font.Color := Wr_BufID(0,Edit43.Text,4,false);  // ID
  Edit44.Font.Color := Wr_Buf($4,Edit44.Text,4,true);    // адрес тарировки
  Edit45.Font.Color := SetText(Edit45.Text,  32,  $10);
  Edit46.Font.Color := SetText(Edit46.Text,  32,  $31);
  if temp_id = 1 then   // 2D
    begin
      Edit61.Font.Color := SetText(Edit61.Text, $FF, $52);
      Wr_Buf($152,IntToHex(StrToInt(Edit48.Text),4),2,false);
      Edit60.Font.Color := Wr_Buf($154,Edit60.Text,2,false);
      Edit49.Font.Color := Wr_Double(Edit49.Text, $156);
      Edit50.Font.Color := Wr_Double(Edit50.Text, $15E);
      Edit51.Font.Color := Wr_Double(Edit51.Text, $167);
      Edit52.Font.Color := Wr_Double(Edit52.Text, $16F);
//      Edit53.Font.Color := SetText(Edit53.Text, 1, $178);       // тип тарировки
      Bufer[temp_adr + $178 + $45] := StrToInt(Form1.Edit53.Text);
//      Edit53.Font.Color := Wr_Buf($178,Edit53.Text,1,false); // тип тарировки
      Edit54.Font.Color := Wr_Double(Edit54.Text, $17C);
      Edit55.Font.Color := Wr_Double(Edit55.Text, $184);
      Edit56.Font.Color := Wr_Double(Edit56.Text, $18C);
      Edit57.Font.Color := Wr_Double(Edit57.Text, $194);
      Edit58.Font.Color := Wr_Double(Edit58.Text, $19C);
      Edit59.Font.Color := Wr_Buf($1AC,Edit59.Text,2,false);    // KC ???
    end
  else                  // 3D
    begin
      Edit62.Font.Color := SetText(Edit62.Text,  32,  $52);
      Edit61.Font.Color := SetText(Edit61.Text, $FF,  $73);
      Edit63.Font.Color := SetText(Edit63.Text, $FF, $173);
      Wr_Buf($273,IntToHex(StrToInt(Edit48.Text),4),2,false);
      Edit60.Font.Color := Wr_Buf($275,Edit60.Text,2,false);
      Wr_Buf($277,IntToHex(StrToInt(Edit64.Text),2),1,false);
      Edit49.Font.Color := Wr_Double(Edit49.Text, $278);
      Edit50.Font.Color := Wr_Double(Edit50.Text, $280);
      Edit51.Font.Color := Wr_Double(Edit51.Text, $289);
      Edit52.Font.Color := Wr_Double(Edit52.Text, $291);
      Edit65.Font.Color := Wr_Double(Edit65.Text, $29A);
      Edit66.Font.Color := Wr_Double(Edit66.Text, $2A2);
//      Edit53.Font.Color := SetText(Edit53.Text, 1, $2AB);       // тип тарировки
      Bufer[temp_adr + $2AB + $45] := StrToInt(Form1.Edit53.Text);
//      Edit53.Font.Color := Wr_Buf($2AB,Edit53.Text,1,false); // тип тарировки
      Edit67.Font.Color := Wr_Buf($2AD,Edit67.Text,1,false);
      Edit54.Font.Color := Wr_Double(Edit54.Text, $2B0);
      Edit55.Font.Color := Wr_Double(Edit55.Text, $2B8);
      Edit56.Font.Color := Wr_Double(Edit56.Text, $2C0);
      Edit57.Font.Color := Wr_Double(Edit57.Text, $2C8);
      Edit58.Font.Color := Wr_Double(Edit58.Text, $2D0);
      Edit59.Font.Color := Wr_Buf($2E0,Edit59.Text,2,false);    // KC  ???

      Wr_Buf($288,edtField1_3D.Text, 1, false);
      Wr_Buf($299,edtField2_3D.Text, 1, false);
      Wr_Buf($2AA,edtField3_3D.Text, 1, false);
      Wr_Buf($2AC,edtField4_3D.Text, 1, false);
      Wr_Buf($2AE,edtField5_3D.Text, 1, false);
      Wr_Buf($2AF,edtField6_3D.Text, 1, false);
    end;
  AParent := Form1.TreeView1.Selected;
  if ( AParent <> nil ) then AParent.Text := Form1.Edit47.Text;
  GetPar_C3 (temp_id, temp_st, temp_adr);
//  Read_C3 (0);
end;

//******************************************************************************
procedure TForm1.SpeedButton5Click(Sender: TObject);
begin
  GetPar_C3 (temp_id, temp_st, temp_adr);
end;

procedure TForm1.Edit48KeyPress(Sender: TObject; var Key: Char);
begin
  Key := T_KeyP(Key);
end;

procedure TForm1.Edit64KeyPress(Sender: TObject; var Key: Char);
begin
  Key := T_KeyP(Key);
end;

procedure TForm1.Edit43KeyPress(Sender: TObject; var Key: Char);
begin
  Key := T_KeyH(Key);
end;

procedure TForm1.Edit44KeyPress(Sender: TObject; var Key: Char);
begin
  Key := T_KeyH(Key);
end;

procedure TForm1.Edit60KeyPress(Sender: TObject; var Key: Char);
begin
  Key := T_KeyH(Key);
end;

procedure TForm1.Edit59KeyPress(Sender: TObject; var Key: Char);
begin
  Key := T_KeyH(Key);
end;

procedure TForm1.Edit53KeyPress(Sender: TObject; var Key: Char);
begin
  Key := T_KeyD(Key);
end;

procedure TForm1.Edit67KeyPress(Sender: TObject; var Key: Char);
begin
  Key := T_KeyH(Key);
end;

procedure TForm1.N4Click(Sender: TObject);
begin
  About.Form3.Show;
end;

//******************************************************************************
procedure BuferSave;
var
n: integer;
begin
//  MemoToBuf();
  AssignFile(OutFile, Form1.SaveDialog1.FileName);
  Rewrite (OutFile);
  for n := 0 to Num - 1 do
    begin
      Write (OutFile, Bufer[n]);
    end;
  CloseFile (OutFile);
end;

//******************************************************************************
procedure TForm1.ToolButton3Click(Sender: TObject);
begin
SaveDialog1.FileName := Edit1.Text;
if SaveDialog1.Execute then
  begin
   if FileExists(Form1.SaveDialog1.FileName) then
     begin
      if MessageDlg ('Файл "' + ExtractFileName (Form1.SaveDialog1.FileName) + '" существует. Перезаписать?', mtInformation, [mbOk, mbCancel], 0) = mrOk then
        BuferSave;
     end
     else
     BuferSave;
  end;
end;

//******************************************************************************
procedure TForm1.SpeedButton10Click(Sender: TObject);
begin
  GetPar_C3 (temp_id, temp_st, temp_adr);
end;

procedure TForm1.SpeedButton9Click(Sender: TObject);
var AParent, node: TTreeNode;
begin
  Form1.Edit40.Font.Color := SetText(Form1.Edit40.Text, 64, -$45);
  AParent := Form1.TreeView1.Selected;
  if ( AParent <> nil ) then AParent.Text := Form1.Edit40.Text;
  GetPar_C3 (temp_id, temp_st, temp_adr);
end;

procedure TForm1.N10Click(Sender: TObject);
begin
  Add_Tar_Dir_3 (0);
end;

procedure TForm1.N11Click(Sender: TObject);
begin
  Add_Tar_Dir_3 (1);
end;

procedure TForm1.N2D1Click(Sender: TObject);
begin
  Add_Tar_2D_3 ();
end;

procedure TForm1.N3D1Click(Sender: TObject);
begin
  Add_Tar_3D_3 ();
end;

procedure TForm1.N1D1Click(Sender: TObject);
begin
  Add_Tar_1D_3 ();
end;

procedure TForm1.RadioGroup3Click(Sender: TObject);
begin
  GetPar_C3 (temp_id, temp_st, temp_adr);
end;

procedure TForm1.N12Click(Sender: TObject);
begin
  Add_Tar_FM_3 ();
end;

procedure TForm1.SpeedButton11Click(Sender: TObject);
begin
  GetPar_C3 (temp_id, temp_st, temp_adr);
end;

procedure TForm1.SpeedButton12Click(Sender: TObject);
var AParent, node: TTreeNode;
    n,A_2: integer;
begin
  Form1.Edit77.Font.Color := SetText(Form1.Edit77.Text, 64, -$45);

  edtFlags_ID.Font.Color := Wr_BufID(0, edtFlags_ID.Text, 4, false);

  n:=Form1.RadioGroup3.ItemIndex;
  A_2:=$208 * n;
  Form1.Edit41.Font.Color := SetText(Form1.Edit41.Text,  64,  ($2C + $41 * n));

  if n = 0 then
    Form1.Edit68.Font.Color := Wr_Buf($4,Form1.Edit68.Text,4,true)
  else
    Form1.Edit68.Font.Color := Wr_Buf($4 + 4 * n,Form1.Edit68.Text,4,false);

  Form1.Edit69.Font.Color := SetText(Form1.Edit69.Text,  64,  ($234 + A_2));
  Form1.Edit70.Font.Color := SetText(Form1.Edit70.Text,  64,  ($275 + A_2));
  Form1.Edit71.Font.Color := SetText(Form1.Edit71.Text,  64,  ($2B6 + A_2));
  Form1.Edit72.Font.Color := SetText(Form1.Edit72.Text,  64,  ($2F7 + A_2));
  Form1.Edit73.Font.Color := SetText(Form1.Edit73.Text,  64,  ($338 + A_2));
  Form1.Edit74.Font.Color := SetText(Form1.Edit74.Text,  64,  ($379 + A_2));
  Form1.Edit75.Font.Color := SetText(Form1.Edit75.Text,  64,  ($3BA + A_2));
  Form1.Edit76.Font.Color := SetText(Form1.Edit76.Text,  64,  ($3FB + A_2));

  AParent := Form1.TreeView1.Selected;
  if ( AParent <> nil ) then AParent.Text := Form1.Edit77.Text;
  GetPar_C3 (temp_id, temp_st, temp_adr);
end;

procedure TForm1.N13Click(Sender: TObject);
begin
  Add_Tar_ID_3 ();
end;

procedure TForm1.N15Click(Sender: TObject);
begin
 Del_Tar_3 ();
end;

procedure TForm1.N6Click(Sender: TObject);
begin
  Add_New_Card_3 ();
end;

procedure TForm1.Chart1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
Var tmpX,tmpY:Double;
begin

  begin
  end;
  if PtInRect( Chart1.ChartRect, Point(X-Chart1.Width3D,Y+Chart1.Height3D)  ) then
  begin
    With Series2 do
    begin
      GetCursorValues(tmpX,tmpY);  // <-- get values under mouse cursor
      Form1.Caption:=GetVertAxis.LabelValue(tmpY)+
                      '       '+
                      GetHorizAxis.LabelValue(tmpX);
    end;
  end;

end;

end.
