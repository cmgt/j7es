unit C_3;          // карты  3

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ImgList, StdCtrls, ComCtrls, ExtCtrls, IniFiles;

procedure GetTar3 ();
procedure Read_C3 (Adr_Sel: Integer);
procedure GetPar_C3 (id_par: integer; st_tr: string; Addr: integer);
procedure Add_Tar_1D_3 ();
procedure Add_Tar_2D_3 ();
procedure Add_Tar_3D_3 ();
procedure Add_Tar_Dir_3 (fl_nv: byte);
procedure Del_Tar_3 ();
procedure Add_Tar_FM_3 ();
procedure Add_Tar_ID_3 ();
procedure Add_New_Card_3 ();
var


//******************************************************************************
T3_New: array[0..$15] of Byte =(
$43,$54,$4D,$03,$01,$00,$0F,$51,$98,$04,$00,$00,$00,$00,$00,$00,
$00,$00,$00,$00,$00,$00);

//******************************************************************************
T3_Dir: array[0..$44] of Byte =(
$10,$CD,$EE,$E2,$E0,$FF,$20,$C4,$E8,$F0,$E5,$EA,$F2,$EE,$F0,$E8,
$FF,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,
$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,
$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,
$00,$01,$00,$00,$00);

//******************************************************************************
T3_Flg: array[0..$6F] of Byte =(
$13,$CD,$EE,$E2,$FB,$E5,$20,$D4,$EB,$E0,$E3,$E8,$20,$E8,$20,$CC,
$E0,$F1,$EA,$E8,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,
$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,
$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,
$00,$01,$04,$86,$12,
$00,$8E,$74,$26,$47,$04,$59,$D7,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,
$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,
$FF,$FF,$FF,$FF,$00,$00,$00,$00,$00,$00,$00);

//******************************************************************************
T3_ID: array[0..$A9] of Byte =(
$27,$CD,$EE,$E2,$FB,$E5,$20,$C8,$E4,$E5,$ED,$F2,$E8,$F4,$E8,$EA,
$E0,$F6,$E8,$EE,$ED,$ED,$FB,$E5,$20,$E4,$E0,$ED,$ED,$FB,$E5,$20,
$EF,$F0,$EE,$F8,$E8,$E2,$EA,$E8,$00,$00,$00,$00,$00,$00,$00,$00,
$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,
$00,$01,$05,$8F,$02,
$22,$FA,$49,$C9,$27,$CD,$EE,$E2,$FB,$E5,$20,$C8,$E4,$E5,$ED,$F2,
$E8,$F4,$E8,$EA,$E0,$F6,$E8,$EE,$ED,$ED,$FB,$E5,$20,$E4,$E0,$ED,
$ED,$FB,$E5,$20,$EF,$F0,$EE,$F8,$E8,$E2,$EA,$E8,$00,$00,$00,$00,
$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,
$00,$00,$00,$00,$00,$47,$04,$59,$D7,$FF,$FF,$FF,$FF,$FF,$FF,$FF,
$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,
$FF,$FF,$FF,$FF,$FF);

//******************************************************************************
T3_1D: array[0..$A9] of Byte =(
$2B,$CD,$EE,$E2,$E0,$FF,$20,$EE,$E4,$ED,$EE,$E1,$E0,$E9,$F2,$EE,
$E2,$E0,$FF,$20,$28,$EE,$E4,$ED,$EE,$F1,$EB,$EE,$E2,$ED,$E0,$FF,
$29,$20,$EF,$E5,$F0,$E5,$EC,$E5,$ED,$ED,$E0,$FF,$00,$00,$00,$00,
$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,
$00,$02,$03,$65,$00,
$3D,$8F,$A2,$83,$47,$04,$59,$D7,$00,$00,$00,$00,$00,$00,$00,$00,
$0B,$F0,$E0,$E7,$EC,$E5,$F0,$ED,$EE,$F1,$F2,$FC,$00,$00,$00,$00,
$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,
$00,$00,$01,$00,$00,$00,$00,$00,$00,$F0,$3F,$00,$00,$00,$00,$00,
$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,
$00,$F0,$3F,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,
$00,$00,$00,$01,$00);

//******************************************************************************
T3_2D: array[0..$1F2] of Byte =(
$1C,$CD,$EE,$E2,$E0,$FF,$20,$F2,$E0,$F0,$E8,$F0,$EE,$E2,$EA,$E0,
$20,$20,$32,$44,$20,$20,$E3,$F0,$E0,$F4,$E8,$EA,$E0,$00,$00,$00,
$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,
$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,
$00,$02,$01,$AE,$01,
$FF,$FF,$FF,$FF,$47,$04,$59,$D7,$00,$00,$00,$00,$00,$00,$00,$00,
$11,$CD,$E0,$E7,$E2,$E0,$ED,$E8,$E5,$20,$EE,$F1,$E8,$20,$20,$20,
$20,$58,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,
$00,$11,$CD,$E0,$E7,$E2,$E0,$ED,$E8,$E5,$20,$EE,$F1,$E8,$20,$20,
$20,$20,$59,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,
$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,
$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,
$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,
$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,
$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,
$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,
$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,
$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,
$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,
$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,
$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,
$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,
$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,
$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,
$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,
$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,
$00,$00,$00,$00,$00,$00,$06,$00,$00,$00,$00,$00,$00,$00,$00,$00,
$00,$00,$00,$00,$00,$00,$00,$00,$59,$40,$FF,$00,$00,$00,$00,$00,
$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$FF,$00,$00,$00,$02,
$00,$00,$00,$00,$00,$00,$F0,$3F,$00,$00,$00,$00,$00,$00,$00,$00,
$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$F0,$3F,
$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,
$2D,$00);

//******************************************************************************
T3_3D: array[0..$326] of Byte =(
$1C,$CD,$EE,$E2,$E0,$FF,$20,$F2,$E0,$F0,$E8,$F0,$EE,$E2,$EA,$E0,
$20,$20,$33,$44,$20,$20,$E3,$F0,$E0,$F4,$E8,$EA,$E0,$00,$00,$00,
$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,
$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,
$00,$02,$02,$E2,$02,
$FF,$FF,$FF,$FF,$47,$04,$59,$D7,$00,
$00,$00,$00,$00,$00,$00,$00,$11,$CD,$E0,$E7,$E2,$E0,$ED,$E8,$E5,
$20,$EE,$F1,$E8,$20,$20,$20,$20,$58,$00,$00,$00,$00,$00,$00,$00,
$00,$00,$00,$00,$00,$00,$00,$00,$11,$CD,$E0,$E7,$E2,$E0,$ED,$E8,
$E5,$20,$EE,$F1,$E8,$20,$20,$20,$20,$59,$00,$00,$00,$00,$00,$00,
$00,$00,$00,$00,$00,$00,$00,$00,$00,$11,$CD,$E0,$E7,$E2,$E0,$ED,
$E8,$E5,$20,$EE,$F1,$E8,$20,$20,$20,$20,$5A,$00,$00,$00,$00,$00,
$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,
$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,
$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,
$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,
$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,
$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,
$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,
$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,
$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,
$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,
$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,
$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,
$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,
$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,
$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,
$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,
$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,
$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,
$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,
$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,
$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,
$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,
$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,
$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,
$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,
$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,
$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,
$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,
$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,
$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,
$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,
$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,
$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$0A,$00,$FF,$FF,$0A,$00,
$00,$00,$00,$00,$00,$49,$C0,$00,$00,$00,$00,$00,$C0,$62,$40,$FF,
$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,
$FF,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$F0,
$3F,$FF,$00,$00,$00,$FF,$00,$00,$00,$00,$00,$00,$00,$F0,$3F,$00,
$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,
$00,$00,$00,$00,$00,$F0,$3F,$00,$00,$00,$00,$00,$00,$00,$00,$00,
$00,$00,$00,$00,$00,$00,$00,$3D,$00);

implementation

uses Unit1,Bar;
//******************************************************************************
//******************************************************************************
procedure Del_Tar_3 ();
var AParent, node: TTreeNode; Adr_b, rtr, n: Integer;
begin
 AParent := Form1.TreeView1.Selected;
 if ( AParent <> nil ) then
  begin
    rtr:=0;
    if AParent.ImageIndex = 1 then rtr := $45;                      // Dir
    if AParent.ImageIndex = 2 then rtr := $1F3;                     // 2D
    if AParent.ImageIndex = 3 then rtr := $327;                     // 3D
    if AParent.ImageIndex = 4 then rtr := $AA;                      // 1D
    if AParent.ImageIndex = 5 then rtr := $12CB;                    // Fl
    if AParent.ImageIndex = 6 then rtr := $2D4;                     // ID

      dec(Num,rtr); SetLength (Tmp_B, Num);                         // новый размер буфера
      Adr_b := Integer(AParent.Data);
      for  n:=0 to Adr_b - 1 do Tmp_B[n] := Bufer[n];               // данные до удаляемой торировки
      for  n:=Adr_b+rtr to SizeFile -1 do Tmp_B[n-rtr] := Bufer[n]; // данные после вставки торировки
      SizeFile := Num; SetLength (Bufer, Num);
      for  n:=0 to Num - 1 do Bufer[n] := Tmp_B[n];
      GetTar3 (); Read_C3 (Adr_b);
  end;
end;

//******************************************************************************
procedure Add_Tar_Dir_3 (fl_nv: byte);
var AParent, node: TTreeNode; Adr_b, Adr_n, Adr_pl, n: Integer;
    fl_end: byte;
begin
 AParent := Form1.TreeView1.Selected;
 if ( AParent <> nil ) then
  begin
    Adr_b := $45;
    node := Form1.TreeView1.Items.AddChildObject( AParent, 'Новая Директория',
            Pointer(Integer(AParent.Data)+Adr_b));            // новая ветвь дерева
    node.ImageIndex := 1;                                     // image новой ветви дерева
    AParent.Expand(True);
    inc(Num,Adr_b);                                             // новый размер буфера
    SetLength (Tmp_B, Num);

    if num > 22 + $45 then
      begin
       fl_end := 0;
       Adr_b := Integer(AParent.Data) + Bufer[Integer(AParent.Data)+$44] * $100
              + Bufer[Integer(AParent.Data)+$43] + $45;
       if ((Adr_b = Integer(AParent.Data)+ $45)) then  // добавление к директории...
        begin
         if (fl_nv = 1) then      // директория в директории...
          begin
            T3_Dir[$41] := Bufer[Integer(AParent.Data)+$41]+1;         // место тарировки в директории
            Adr_b := Integer(AParent.Data) + Bufer[Integer(AParent.Data)+$44] * $100
                      + Bufer[Integer(AParent.Data)+$43] + $45;
          end
         else                    // директория ниже директории
          begin
           T3_Dir[$41] := Bufer[Integer(AParent.Data)+$41];          // место тарировки в директории
           Adr_n := Bufer[Integer(AParent.Data)+$44] * $100 + Bufer[Integer(AParent.Data)+$43];
           if Adr_n = 0 then    // это директория
            begin
              while (fl_end = 0) do
               begin
                 AParent.Data := Pointer(Bufer[Integer(AParent.Data)+$44] * $100
                                       + Bufer[Integer(AParent.Data)+$43]
                                       + Integer(AParent.Data) + $45);
                 if (Integer(AParent.Data) < (SizeFile - $45)) then
                   begin
                     Adr_n := Bufer[Integer(AParent.Data)+$44] * $100 + Bufer[Integer(AParent.Data)+$43];
//                     if (T3_Dir[$41] = Bufer[Integer(AParent.Data)+$41]) then
                     if (T3_Dir[$41] >= Bufer[Integer(AParent.Data)+$41]) then fl_end := 1;
                   end
                 else fl_end := 2;
               end;
            end;
           if fl_end = 2 then Adr_b := SizeFile
           else
           if Adr_n = 0 then Adr_b := Integer(AParent.Data) + Bufer[Integer(AParent.Data)+$44] * $100
                      + Bufer[Integer(AParent.Data)+$43]        // + $45;
           else  Adr_b := Integer(AParent.Data); // + Bufer[Integer(AParent.Data)+$44] * $100
//                      + Bufer[Integer(AParent.Data)+$43] + $45;
          end;
        end
       else
        begin
         T3_Dir[$41] := Bufer[Integer(AParent.Data)+$41];         // место тарировки в директории
         Adr_b := Integer(AParent.Data) + Bufer[Integer(AParent.Data)+$44] * $100
                   + Bufer[Integer(AParent.Data)+$43] + $45;
       end;
      end
    else
      begin
        T3_Dir[$41] := 1; Adr_b := 22;
      end;  
    for  n:=0 to Adr_b - 1 do Tmp_B[n] := Bufer[n];           // данные до вставки торировки
    for  n:=0 to $44 do Tmp_B[Adr_b+n] := T3_Dir[n];          // новые данные Dir
    for  n:=Adr_b to SizeFile -1 do Tmp_B[n+$45] := Bufer[n]; // данные после вставки торировки
    SizeFile := Num; SetLength (Bufer, Num);
    for  n:=0 to Num - 1 do Bufer[n] := Tmp_B[n];
    GetTar3 (); Read_C3 (Adr_b);
  end;
end;
//******************************************************************************
procedure Add_Tar_1D_3 ();
var AParent, node: TTreeNode; Adr_b, n: Integer;
begin
 AParent := Form1.TreeView1.Selected;
 if ( AParent <> nil ) then
  begin
    Adr_b := $45 + $65;
    node := Form1.TreeView1.Items.AddChildObject( AParent, 'Новая однобайтовая (однословная) переменная',
            Pointer(Integer(AParent.Data)+Adr_b));            // новая ветвь дерева
    node.ImageIndex := 4;                                     // image новой ветви дерева
    AParent.Expand(True);
    inc(Num,Adr_b);                                           // новый размер буфера
    SetLength (Tmp_B, Num);
    if num > 22 + $1F3 then
      begin
       Adr_b := Integer(AParent.Data) + Bufer[Integer(AParent.Data)+$44] * $100
                + Bufer[Integer(AParent.Data)+$43] + $45;
       if Adr_b = Integer(AParent.Data)+ $45 then
             T3_1D[$41] := Bufer[Integer(AParent.Data)+$41]+1    // место тарировки в директории
       else  T3_1D[$41] := Bufer[Integer(AParent.Data)+$41];     // место тарировки в директории
      end
    else
      begin
        T3_1D[$41] := 1; Adr_b := 22;
      end;   
    for  n:=0 to Adr_b - 1 do Tmp_B[n] := Bufer[n];           // данные до вставки торировки
    for  n:=0 to $A9 do Tmp_B[Adr_b+n] := T3_1D[n];           // новые данные 1D
    for  n:=Adr_b to SizeFile -1 do Tmp_B[n+$AA] := Bufer[n]; // данные после вставки торировки
    SizeFile := Num; SetLength (Bufer, Num);
    for  n:=0 to Num - 1 do Bufer[n] := Tmp_B[n];
    GetTar3 (); Read_C3 (Adr_b);
  end;
end;

//******************************************************************************
procedure Add_Tar_2D_3 ();
var AParent, node: TTreeNode; Adr_b, n: Integer;
begin
 AParent := Form1.TreeView1.Selected;
 if ( AParent <> nil ) then
  begin
    Adr_b := $45 + $1AE;
    node := Form1.TreeView1.Items.AddChildObject( AParent, 'Новая тарировка  2D  графика',
            Pointer(Integer(AParent.Data)+Adr_b));            // новая ветвь дерева
    node.ImageIndex := 2;                                     // image новой ветви дерева
    AParent.Expand(True);
    inc(Num,Adr_b);                                           // новый размер буфера
    SetLength (Tmp_B, Num);
    if num > 22 + $1F3 then
      begin
       Adr_b := Integer(AParent.Data) + Bufer[Integer(AParent.Data)+$44] * $100
                + Bufer[Integer(AParent.Data)+$43] + $45;
       if Adr_b = Integer(AParent.Data)+ $45 then
             T3_2D[$41] := Bufer[Integer(AParent.Data)+$41]+1    // место тарировки в директории
       else  T3_2D[$41] := Bufer[Integer(AParent.Data)+$41];     // место тарировки в директории
      end
    else
      begin
        T3_2D[$41] := 1; Adr_b := 22;
      end;
    for  n:=0 to Adr_b - 1 do Tmp_B[n] := Bufer[n];           // данные до вставки торировки
    for  n:=0 to $1F2 do Tmp_B[Adr_b+n] := T3_2D[n];           // новые данные 1D
    for  n:=Adr_b to SizeFile -1 do Tmp_B[n+$1F3] := Bufer[n]; // данные после вставки торировки
    SizeFile := Num; SetLength (Bufer, Num);
    for  n:=0 to Num - 1 do Bufer[n] := Tmp_B[n];
    GetTar3 (); Read_C3 (Adr_b);
  end;
end;

//******************************************************************************
procedure Add_Tar_3D_3 ();
var AParent, node: TTreeNode; Adr_b, n: Integer;
begin
 AParent := Form1.TreeView1.Selected;
 if ( AParent <> nil ) then
  begin
    Adr_b := $45 + $2E2;
    node := Form1.TreeView1.Items.AddChildObject( AParent, 'Новая тарировка  2D  графика',
            Pointer(Integer(AParent.Data)+Adr_b));            // новая ветвь дерева
    node.ImageIndex := 2;                                     // image новой ветви дерева
    AParent.Expand(True);
    inc(Num,Adr_b);                                           // новый размер буфера
    SetLength (Tmp_B, Num);
    if num > 22 + $327 then
      begin
       Adr_b := Integer(AParent.Data) + Bufer[Integer(AParent.Data)+$44] * $100
                + Bufer[Integer(AParent.Data)+$43] + $45;
       if Adr_b = Integer(AParent.Data)+ $45 then
             T3_3D[$41] := Bufer[Integer(AParent.Data)+$41]+1    // место тарировки в директории
       else  T3_3D[$41] := Bufer[Integer(AParent.Data)+$41];     // место тарировки в директории
      end
    else
      begin
        T3_3D[$41] := 1; Adr_b := 22;
      end;  
    for  n:=0 to Adr_b - 1 do Tmp_B[n] := Bufer[n];           // данные до вставки торировки
    for  n:=0 to $326 do Tmp_B[Adr_b+n] := T3_3D[n];           // новые данные 1D
    for  n:=Adr_b to SizeFile -1 do Tmp_B[n+$327] := Bufer[n]; // данные после вставки торировки
    SizeFile := Num; SetLength (Bufer, Num);
    for  n:=0 to Num - 1 do Bufer[n] := Tmp_B[n];
    GetTar3 (); Read_C3 (Adr_b);
  end;
end;

//******************************************************************************
procedure Add_Tar_FM_3 ();
var AParent, node: TTreeNode; Adr_b, n: Integer;
begin
 AParent := Form1.TreeView1.Selected;
 if ( AParent <> nil ) then
  begin
    Adr_b := $45 + $1286;
    node := Form1.TreeView1.Items.AddChildObject( AParent, 'Новые Флаги и Маски',
            Pointer(Integer(AParent.Data)+Adr_b));            // новая ветвь дерева
    node.ImageIndex := 5;                                     // image новой ветви дерева
    AParent.Expand(True);
    inc(Num,Adr_b);                                           // новый размер буфера
    SetLength (Tmp_B, Num);
//
    if num > 22 + $12CB then
      begin
        Adr_b := Integer(AParent.Data) + Bufer[Integer(AParent.Data)+$44] * $100
               + Bufer[Integer(AParent.Data)+$43] + $45;
        if Adr_b = Integer(AParent.Data)+ $45 then
              T3_Flg[$41] := Bufer[Integer(AParent.Data)+$41]+1    // место тарировки в директории
        else  T3_Flg[$41] := Bufer[Integer(AParent.Data)+$41];     // место тарировки в директории
      end
    else
      begin
        T3_Flg[$41] := 1; Adr_b := 22;
      end;
//
    for  n:=0 to Adr_b - 1 do Tmp_B[n] := Bufer[n];           // данные до вставки торировки
    for  n:=0 to $6F do Tmp_B[Adr_b+n] := T3_Flg[n];           // новые данные 1D
    for  n:=$70 to $12CA do Tmp_B[Adr_b+n] := 0;               // новые данные 1D
    Tmp_B[Adr_b+$12C9] := $2E;
    for  n:=Adr_b to SizeFile -1 do Tmp_B[n+$12CB] := Bufer[n]; // данные после вставки торировки

    SizeFile := Num; SetLength (Bufer, Num);
    for  n:=0 to Num - 1 do Bufer[n] := Tmp_B[n];
    GetTar3 (); Read_C3 (Adr_b);
  end;
end;

//******************************************************************************
procedure Add_Tar_ID_3 ();
var AParent, node: TTreeNode; Adr_b, n: Integer;
begin
 AParent := Form1.TreeView1.Selected;
 if ( AParent <> nil ) then
  begin
    Adr_b := $45 + $28F;
    node := Form1.TreeView1.Items.AddChildObject( AParent, 'Новые Идентификационные данные прошивки',
            Pointer(Integer(AParent.Data)+Adr_b));            // новая ветвь дерева
    node.ImageIndex := 5;                                     // image новой ветви дерева
    AParent.Expand(True);
    inc(Num,Adr_b);                                           // новый размер буфера
    SetLength (Tmp_B, Num);
    if num > 22 + $2D4 then
      begin
       Adr_b := Integer(AParent.Data) + Bufer[Integer(AParent.Data)+$44] * $100
                + Bufer[Integer(AParent.Data)+$43] + $45;
       if Adr_b = Integer(AParent.Data)+ $45 then
             T3_ID[$41] := Bufer[Integer(AParent.Data)+$41]+1    // место тарировки в директории
       else  T3_ID[$41] := Bufer[Integer(AParent.Data)+$41];     // место тарировки в директории
      end
    else
      begin
        T3_ID[$41] := 1; Adr_b := 22;
      end;
    for  n:=0 to Adr_b - 1 do Tmp_B[n] := Bufer[n];           // данные до вставки торировки

    for  n:=0 to $A9 do Tmp_B[Adr_b+n] := T3_ID[n];           // новые данные ID
    for  n:=$AA to $2D3 do Tmp_B[Adr_b+n] := 0;               // новые данные ID
    Tmp_B[Adr_b+$2D2] := $18;

    for  n:=Adr_b to SizeFile -1 do Tmp_B[n+$2D4] := Bufer[n]; // данные после вставки торировки
    SizeFile := Num; SetLength (Bufer, Num);
    for  n:=0 to Num - 1 do Bufer[n] := Tmp_B[n];
    GetTar3 (); Read_C3 (Adr_b);
  end;
end;

//******************************************************************************
procedure Add_New_Card_3 ();
var AParent, node: TTreeNode; Adr_b, n: Integer;
begin
// AParent := Form1.TreeView1.Selected;
// if ( AParent <> nil ) then
  begin
    Form1.Edit1.Text:='NewCard';
    Num := $16;
    SetLength (Tmp_B, Num);
    for  n:=0 to $15 do Tmp_B[n] := T3_New[n];                // новые данные заголовок карты
    SizeFile := Num; SetLength (Bufer, Num);
    for  n:=0 to Num - 1 do Bufer[n] := Tmp_B[n];

    GetTar3 (); Read_C3 (Adr_b);
  end;
end;

//******************************************************************************
procedure GetTar3 ();
var
Dl_bl, n, tmp,mt: integer;
fl_type: byte;
begin
  Form1.ToolButton3.Enabled := true;
  o_t := 0;
  fl_type:= $FF; Dl_bl := $16;
  while Dl_bl < SizeFile - $43 - $45 do
    begin
     tmp := Dl_bl;
//********************************************************************************************
     if fl_type = $FF then
      begin
       fl_type := Bufer[tmp+$42];
       inc(Dl_bl,$43); tmp := Dl_bl; inc(o_t,1);
      end;
//*******************************************************************************************
     if (fl_type = 0) then // директория...
      begin
       inc(Dl_bl,$45); fl_type := Bufer[tmp+$44];       // fl_type:= $FF;
       tmp := Dl_bl;
      end;
 //*******************************************************************************************
     if (fl_type = 1) then                                                      // график '2D'
      begin
       inc(Dl_bl, $1AE+2); fl_type:= $FF; inc(gr_2d,1);
      end;
//*******************************************************************************************
     if (fl_type = 2) then                                                      // график '3D'
      begin
       inc(Dl_bl, $2E2+2); fl_type:= $FF; inc(gr_3d,1);
      end;
//*******************************************************************************************
     if (fl_type = 3) then                                                      // график '1D'
      begin
       inc(Dl_bl, $65+2); fl_type:= $FF; inc(gr_1d,1);
      end;
//*******************************************************************************************
     if (fl_type = 4) then // битовые флаги...
      begin
       inc(Dl_bl,$1286+2); fl_type:= $FF;
      end;
//*******************************************************************************************
     if (fl_type = 5) then // калибровки...
      begin
       inc(Dl_bl,$28F+2); fl_type:= $FF;
      end;
//*******************************************************************************************
    end;
end;

//******************************************************************************
procedure Read_C3 (Adr_Sel: Integer);
var
  fl_tree: boolean;
  Paren : array[0..50] of TTreeNode;
  AParent, AParent_old  : TTreeNode;
  node: TTreeNode;
Dl_bl, n, tmp,mt, ntr: integer;
fl_type, t48, t48_old: byte;
S_f, S_z,S_Tr: string;
begin
  Form1.TreeView1.Items.Clear;
  o_t := 0;
  Form2.Label1.Caption:='    Загружается карта калибровок'; Form2.Show;
  Form1.TreeView1.Visible:=false;
  with Form1.TreeView1.Items do                  // старт построения дерева...
  begin
    Form1.Root1 := Add( nil, Form1.Edit1.Text ); // имя карты...
    Form1.Root1.ImageIndex:= 1; Paren[0]:= Form1.Root1;
    AParent := Paren[0]; ntr:=0; fl_tree := false;
    Form1.Root1.Expanded := true;
  end;
  fl_type:= $FF;
  Dl_bl := $16;
  while Dl_bl < SizeFile - 2 do
    begin
     tmp := Dl_bl;
//******************************************************************************
     if fl_type = $FF then
      begin
       fl_tree := true;
       fl_type := Bufer[tmp+$42];
       S_Tr:=''; for n := tmp+1 to tmp+Bufer[tmp] do S_Tr:=S_Tr + chr(Bufer[n]);
       inc(Dl_bl,$43); inc(o_t,1);
       Form2.ProgressBar1.Position := o_t; Application.ProcessMessages;
       t48 := Bufer[tmp+$41]; 
       with Form1.TreeView1.Items do                        //  строим дерево...
        begin
         ntr := t48;
         if t48 <= ntr then AParent := Paren[ntr-1];
         node:=AddChildObject( AParent, S_Tr, Pointer(tmp));
         AParent := node; Paren[ntr] := AParent;
         node.ImageIndex := fl_type+1;
         if Adr_Sel = tmp then Form1.TreeView1.Select(node);
        end;
       tmp := Dl_bl;
      end;
//******************************************************************************
     if ((fl_type = 0) and (tmp < Num - $45)) then                                                      // директория...
      begin
       S_Tr:=''; for n := tmp+3 to tmp+2+Bufer[tmp+2] do S_Tr:=S_Tr + chr(Bufer[n]);
       inc(Dl_bl,$45);
       fl_type := Bufer[tmp+$44];
       t48 := Bufer[tmp+$43];
       with Form1.TreeView1.Items do                        //  строим дерево...
        begin
         ntr := t48;
         if t48 <= ntr then AParent := Paren[ntr-1];
         node:=AddChildObject( AParent, S_Tr, Pointer(tmp+2));
         AParent := node; Paren[ntr] := AParent;
         node.ImageIndex := fl_type+1;
         if Adr_Sel = tmp+2 then Form1.TreeView1.Select(node);
        end;
       tmp := Dl_bl;
      end;
//******************************************************************************
     if (fl_type = 1) then                                                      // график '2D'
      begin
       inc(Dl_bl, $1AE + 2); fl_type:= $FF; inc(gr_2d,1);
      end;
//******************************************************************************
     if (fl_type = 2) then                                                      // график '3D'
      begin
       inc(Dl_bl, $2E2 + 2); fl_type:= $FF; inc(gr_3d,1);
      end;
//******************************************************************************
     if (fl_type = 3) then                                                      // график '1D'
      begin
       inc(Dl_bl, $65 + 2 ); fl_type:= $FF; inc(gr_1d,1);
      end;

//******************************************************************************
     if (fl_type = 4) then                                                      // битовые флаги...
      begin
       inc(Dl_bl,$1286+2); fl_type:= $FF;
      end;

//******************************************************************************
     if (fl_type = 5) then                                                      // калибровки...
      begin
       inc(Dl_bl,$28F + 2); fl_type:= $FF;
      end;

//******************************************************************************
    end;

    Form1.Root1.Expanded := true;
    if ((Num > $16) and (Num < temp_adr)) then GetPar_C3 (temp_id, temp_st, temp_adr);
    Form2.Close;
    Form1.TreeView1.Visible:=true;
    Form1.Panel1.Visible:=true;
end;

//******************************************************************************
Function D_Word(Addr: integer; Xor_: boolean):dword;
var ww: dword;
 begin
   ww := Bufer[Addr+3];       ww := ww shl 8;
   ww := ww or Bufer[Addr+2]; ww := ww shl 8;
   ww := ww or Bufer[Addr+1]; ww := ww shl 8;
   ww := ww or Bufer[Addr];
   if Xor_ = true then D_Word := ww xor $28A6FBB8
   else D_Word := ww;
 end;

//******************************************************************************
Function D_Double(Addr: integer):double;
var n: integer;
 b:  PByteArray;
 ww:  double;
 begin
   b := @ww;
   for n:=0 to 7 do b[n]:=Bufer[Addr+n];
   D_Double := ww;
 end;

//******************************************************************************
Procedure En_Dis(En: boolean);
 begin
   Form1.Edit62.Visible:=En; Form1.Edit63.Visible:=En; Form1.Edit64.Visible:=En;
   Form1.Edit65.Visible:=En; Form1.Edit66.Visible:=En; Form1.Edit67.Visible:=En;
   Form1.Label34.Visible:=En;Form1.Label35.Visible:=En;Form1.Label37.Visible:=En;
   Form1.Label38.Visible:=En;Form1.Label39.Visible:=En;Form1.Label40.Visible:=En;
 end;

 //******************************************************************************
procedure GetPar_C3 (id_par: integer; st_tr: string; Addr: integer);
var S: string;
    n,m,nc,toX,A_0,A_1,A_2: integer;
    m_in, m_ax, rn: double;
    Ys, Ye, Ymn, Ymx, StepY, StepX: double;
begin
  temp_id:=id_par; temp_st:=st_tr; temp_adr:=Addr;
//******************************************************************************
  if (id_par = 0) then    //  директория...
    begin
     Form1.Card.Visible := false;
     Form1.Ident_5.Visible:=false;
     Form1.Gr__1D.Visible:=false;
     Form1.Gr__2D.Visible:=false;
     Form1.Flagi.Visible:=false;
     if Addr > 0 then
      begin
       S:=''; for n:=Addr+1 to Addr+Bufer[Addr] do S:=S+chr(Bufer[n]); Form1.edit40.Text := S;
       Form1.P_Dir.Visible := true;
      end; 
    end;
//******************************************************************************
  if id_par = 1 then    // график '2D'
    begin
     En_Dis(false);
     Form1.ChartTool2.Active := false;
     Form1.Chart1.View3D:=false;
     Form1.Card.Visible := false;
     Form1.Ident_5.Visible:=false;
     Form1.Gr__1D.Visible:=false;
     Form1.P_Dir.Visible :=false;
     Form1.Flagi.Visible:=false;
     S:=''; for n := Addr+1 to Addr+Bufer[Addr] do S:=S + chr(Bufer[n]);
     Form1.Edit47.Text := S;
     Form1.Chart1.Title.Text.Text := S;
     inc(Addr, $45);
     S:=''; for n := Addr to Addr+3 do S:=S + IntToHex(Bufer[n],2); Form1.edit43.Text:=S;      // 4 байта уникального ID для функции сравнения.
     Form1.Edit44.Text := IntToHex(D_Word(Addr+$4, true ),8);                                  //  адрес тарировки (заксорен).
     S:=''; for n := Addr+$11 to Addr+$11-1+Bufer[Addr+$10] do S:=S + chr(Bufer[n]); Form1.edit45.Text:=S;
     Form1.Chart1.BottomAxis.Title.Caption := S;  // до 32 байт - название оси X.
     S:=''; for n := Addr+$32 to Addr+$32-1+Bufer[Addr+$31] do S:=S + chr(Bufer[n]); Form1.edit46.Text:=S;
     Form1.Chart1.LeftAxis.Title.Caption := S;    // до 32 байт название оси Y.
     S:=''; for n := Addr+$53 to Addr+$53-1+Bufer[Addr+$52] do S:=S + chr(Bufer[n]);
     Form1.edit61.Text:=S;                        //  до ??? байт - ссылка на тарировку по другой таблце
     toX := Bufer[Addr+$153] * $100 + Bufer[Addr+$152];
     Form1.Edit48.Text:= IntToStr(toX);                      // точек по оси X
     Form1.Edit49.Text := FloatToStr(D_Double(Addr+$156));   // начало оси X
     Form1.Edit50.Text := FloatToStr(D_Double(Addr+$15E));   // конец  оси X
     StepX := (D_Double(Addr+$15E) - D_Double(Addr+$156))/ (toX -1);
     Form1.Chart1.BottomAxis.Increment := StepX;             // шаг по оси X
     Form1.Edit60.Text := IntToHex(Bufer[Addr+$155],2) + IntToHex(Bufer[Addr+$154],2); // сдвиг и маска для характеристики
     if Form1.Chart1.BottomAxis.Minimum <= D_Double(Addr+$15E) then
      begin
       Form1.Chart1.BottomAxis.Maximum := D_Double(Addr+$15E);
       Form1.Chart1.BottomAxis.Minimum := D_Double(Addr+$156);
      end
     else
      begin
       Form1.Chart1.BottomAxis.Minimum := D_Double(Addr+$156);
       Form1.Chart1.BottomAxis.Maximum := D_Double(Addr+$15E);
      end;
     Form1.Edit51.Text := FloatToStr(D_Double(Addr+$167));  //  ограничитель 1
     Form1.Edit52.Text := FloatToStr(D_Double(Addr+$16F));  //  ограничитель 2
     Form1.Edit53.Text := IntToStr(Bufer[Addr+$178]);       //  тип тарировки
     case Bufer[Addr+$178] of
     0: begin Ymn:=0; Ymx:=255; end;        // беззнаковый байт (0-255)
     1: begin Ymn:=-128; Ymx:=127; end;     // знаковый байт (-128 +127)
     2: begin Ymn:=0; Ymx:=65535; end;      // беззаковое слово, сначала младший потом старший.
     3: begin Ymn:=-32768; Ymx:=32767; end; // знаковое слово, сначала младший потом старший.
     4: begin Ymn:=0; Ymx:=65535; end;      // беззнаковое слово, сначала старший потом младший.
     5: begin Ymn:=-32768; Ymx:=32767; end; // знаковое слово, сначала старший потом младший.
     6: begin Ymn:=0; Ymx:=65535; end;      // беззнаковое слово. Младший mod 65535 cтарший...
     else begin Ymn:=0; Ymx:=255; end;      // беззнаковый байт (0-255)
     end;
     Form1.Edit54.Text := FloatToStr(D_Double(Addr+$17C));  // делитель шага Y   - 2-й мультипликативный
     Form1.Edit55.Text := FloatToStr(D_Double(Addr+$184));  //                   - 2-й аддитивный
     Form1.Edit56.Text := FloatToStr(D_Double(Addr+$18C));  //                   - обратный мультипликативный
     Form1.Edit57.Text := FloatToStr(D_Double(Addr+$194));  // шаг по Y          - 1-й мультипликативный
     Form1.Edit58.Text := FloatToStr(D_Double(Addr+$19C));  // смещение по оси Y - 1-й аддитивный
     StepY:=D_Double(Addr+$194)/D_Double(Addr+$17C);
     Ys := (Ymn - D_Double(Addr+$19C)) * StepY - D_Double(Addr+$184);
     Ye := (Ymx - D_Double(Addr+$19C)) * StepY - D_Double(Addr+$184);
     if Form1.Chart1.LeftAxis.Minimum <= Ye then
      begin
       Form1.Chart1.LeftAxis.Maximum := Ye;
       Form1.Chart1.LeftAxis.Minimum := Ys;
      end
     else
      begin
       Form1.Chart1.LeftAxis.Minimum := Ys;
       Form1.Chart1.LeftAxis.Maximum := Ye;
      end;
     for nc:=0 to 17 do Form1.Chart1.Series[nc].Clear;
     for nc:=0 to 17 do Form1.Chart1.Series[nc].Active:=false;
     Form1.Chart1.Series[0].Active:=true;
     Form1.Chart1.Series[1].Active:=true;
     m:=1; Randomize;
     for n:= 0 to tox-1 do                       // заполнение графика данными...
      begin
       m := random(100);
       rn := m * Ye / 100;
       Form1.Chart1.Series[0].AddXY(Form1.Chart1.BottomAxis.Minimum + n * StepX, rn);
       Form1.Chart1.Series[1].AddXY(Form1.Chart1.BottomAxis.Minimum + n * StepX, rn);
      end;
     Form1.Edit59.Text := IntToHex(Bufer[Addr+$1AD],2) + IntToHex(Bufer[Addr+$1AC],2); // КС
     Form1.Gr__2D.Align := alClient;
     Form1.Gr__2D.Visible := true;
    end;
//******************************************************************************
  if id_par = 2 then    // график '3D'
    begin
     Form1.ChartTool2.Active := true;
     Form1.Chart1.View3D:=true;
     Form1.Chart1.View3DOptions.Orthogonal:=true;
     Form1.Card.Visible := false;
     Form1.Ident_5.Visible:=false;
     Form1.Gr__1D.Visible:=false;
     Form1.P_Dir.Visible :=false;
     Form1.Flagi.Visible:=false;
     S:=''; for n := Addr+1 to Addr+Bufer[Addr] do S:=S + chr(Bufer[n]);
     Form1.Edit47.Text := S;
     Form1.Chart1.Title.Text.Text := S;
     inc(Addr, $45);
     S:=''; for n := Addr to Addr+3 do S:=S + IntToHex(Bufer[n],2); Form1.edit43.Text:=S; // 4 байта уникального ID для функции сравнения.
     Form1.Edit44.Text := IntToHex(D_Word(Addr+$4, true ),8);                             //  адрес тарировки (заксорен).
     S:=''; for n := Addr+$11 to Addr+$11-1+Bufer[Addr+$10] do S:=S + chr(Bufer[n]); Form1.edit45.Text:=S;
     Form1.Chart1.BottomAxis.Title.Caption := S;  // до 32 байт - название оси X.
     S:=''; for n := Addr+$32 to Addr+$32-1+Bufer[Addr+$31] do S:=S + chr(Bufer[n]); Form1.edit46.Text:=S;
     Form1.Chart1.LeftAxis.Title.Caption := S;    // до 32 байт название оси Y.
     S:=''; for n := Addr+$53 to Addr+$53-1+Bufer[Addr+$52] do S:=S + chr(Bufer[n]); Form1.edit62.Text:=S;
     S:=''; for n := Addr+$74 to Addr+$74-1+Bufer[Addr+$73] do S:=S + chr(Bufer[n]);
     Form1.edit61.Text:=S;                        //  до ??? байт - ссылка на тарировку по другой таблце для оси X
     S:=''; for n := Addr+$174 to Addr+$174-1+Bufer[Addr+$173] do S:=S + chr(Bufer[n]);
     Form1.edit63.Text:=S;                        //  до ??? байт - ссылка на тарировку по другой таблце для оси Y
     toX := Bufer[Addr+$274] * $100 + Bufer[Addr+$273];
     Form1.Edit48.Text:= IntToStr(toX);                      // точек по оси X
     Form1.Edit60.Text := IntToHex(Bufer[Addr+$276],2) + IntToHex(Bufer[Addr+$275],2); // сдвиг и маска для характеристики
     Form1.Edit64.Text:= IntToStr(Bufer[Addr+$277]);         // графиков по оси Z
     Form1.Edit49.Text := FloatToStr(D_Double(Addr+$278));   // начало оси X
     Form1.Edit50.Text := FloatToStr(D_Double(Addr+$280));   // конец  оси X
     StepX := (D_Double(Addr+$280) - D_Double(Addr+$278))/ (toX -1);
     Form1.Chart1.BottomAxis.Increment := StepX;             // шаг по оси X
     if Form1.Chart1.BottomAxis.Minimum <= D_Double(Addr+$280) then
      begin
       Form1.Chart1.BottomAxis.Maximum := D_Double(Addr+$280);
       Form1.Chart1.BottomAxis.Minimum := D_Double(Addr+$278);
      end
     else
      begin
       Form1.Chart1.BottomAxis.Minimum := D_Double(Addr+$278);
       Form1.Chart1.BottomAxis.Maximum := D_Double(Addr+$280);
      end;
     Form1.Edit51.Text := FloatToStr(D_Double(Addr+$289));  //  ограничитель сверху
     Form1.Edit52.Text := FloatToStr(D_Double(Addr+$291));  //  ограничитель снизу
     Form1.Edit65.Text := FloatToStr(D_Double(Addr+$29A));   // начало оси Y
     Form1.Edit66.Text := FloatToStr(D_Double(Addr+$2A2));   // конец  оси Y
     Form1.Edit53.Text := IntToStr(Bufer[Addr+$2AB]);     //  тип тарировки
     case Bufer[Addr+$2AB] of
     0: begin Ymn:=0; Ymx:=255; end;        // беззнаковый байт (0-255)
     1: begin Ymn:=-128; Ymx:=127; end;     // знаковый байт (-128 +127)
     2: begin Ymn:=0; Ymx:=65535; end;      // беззаковое слово, сначала младший потом старший.
     3: begin Ymn:=-32768; Ymx:=32767; end; // знаковое слово, сначала младший потом старший.
     4: begin Ymn:=0; Ymx:=65535; end;      // беззнаковое слово, сначала старший потом младший.
     5: begin Ymn:=-32768; Ymx:=32767; end; // знаковое слово, сначала старший потом младший.
     6: begin Ymn:=0; Ymx:=65535; end;      // беззнаковое слово. Младший mod 65535 cтарший...
     else begin Ymn:=0; Ymx:=255; end;      // беззнаковый байт (0-255)
     end;
     Form1.Edit67.Text := IntToHex(Bufer[Addr+$2AD],2);       // 01=y-бцн 02=y-дроссель.
//             +2afh byte  - ? 0 или не 0
     Form1.Edit54.Text := FloatToStr(D_Double(Addr+$2B0));  // делитель шага Y   - 2-й мультипликативный
     Form1.Edit55.Text := FloatToStr(D_Double(Addr+$2B8));  //                   - 2-й аддитивный
     Form1.Edit56.Text := FloatToStr(D_Double(Addr+$2C0));  //                   - обратный мультипликативный
     Form1.Edit57.Text := FloatToStr(D_Double(Addr+$2C8));  // шаг по Y          - 1-й мультипликативный
     Form1.Edit58.Text := FloatToStr(D_Double(Addr+$2D0));  // смещение по оси Y - 1-й аддитивный
     StepY:=D_Double(Addr+$2C8)/D_Double(Addr+$2B0);
     Ys := (Ymn - D_Double(Addr+$2D0)) * StepY - D_Double(Addr+$2B8);
     Ye := (Ymx - D_Double(Addr+$2D0)) * StepY - D_Double(Addr+$2B8);
     if Form1.Chart1.LeftAxis.Minimum <= Ye then
      begin
       Form1.Chart1.LeftAxis.Maximum := Ye;
       Form1.Chart1.LeftAxis.Minimum := Ys;
      end
     else
      begin
       Form1.Chart1.LeftAxis.Minimum := Ys;
       Form1.Chart1.LeftAxis.Maximum := Ye;
      end;
     for nc:=0 to 17 do Form1.Chart1.Series[nc].Clear;
     for nc:=0 to 17 do Form1.Chart1.Series[nc].Active:=false;
     for nc:=18-Bufer[Addr+$277] to 17 do Form1.Chart1.Series[nc].Active:=true;
     m:=1; Randomize;
     for n:= 0 to tox-1 do
      begin
       m := random(100);
       rn := m * Ye / 100;
       for nc:=1 to Bufer[Addr+$277] do                         // графиков по оси Z
       Form1.Chart1.Series[18 - nc].AddXY(Form1.Chart1.BottomAxis.Minimum + n * StepX, rn);
      end;
     Form1.Edit59.Text := IntToHex(Bufer[Addr+$2E1],2) + IntToHex(Bufer[Addr+$2E0],2); // КС
     En_Dis(true);
     Form1.Gr__2D.Align := alClient;
     Form1.Gr__2D.Visible := true;

     Form1.edtField1_3D.Text := IntToHex(Bufer[Addr + $288], 2);
     Form1.edtField2_3D.Text := IntToHex(Bufer[Addr + $299], 2);
     Form1.edtField3_3D.Text := IntToHex(Bufer[Addr + $2AA], 2);
     Form1.edtField4_3D.Text := IntToHex(Bufer[Addr + $2AC], 2);
     Form1.edtField5_3D.Text := IntToHex(Bufer[Addr + $2AE], 2);
     Form1.edtField6_3D.Text := IntToHex(Bufer[Addr + $2AF], 2);
    end;
//******************************************************************************
  if id_par = 3 then    // график '1D'
    begin
     Form1.Card.Visible := false;
     Form1.Ident_5.Visible:=false;
     Form1.Gr__2D.Visible:=false;
     Form1.P_Dir.Visible :=false;
     Form1.Flagi.Visible:=false;
     S:=''; for n := Addr+1 to Addr+Bufer[Addr] do S:=S + chr(Bufer[n]); Form1.edit29.Text:=S;
     inc(Addr, $45);
     S:=''; for n := Addr to Addr+3 do S:=S + IntToHex(Bufer[n],2); Form1.edt1D_ID.Text:=S;
     S:=''; for n := Addr+$11 to Addr+$11-1 +Bufer[Addr+$10] do S:=S+chr(Bufer[n]); Form1.Edit30.Text :=S;
     Form1.Edit31.Text := IntToHex(D_Word(Addr+$4, true ),8);  //  адрес тарировки (заксорен).
     S := FloatToStr(D_Double(Addr+$21));
//     if S = '0' then Form1.Edit32.Text := 'Автомат' else
     Form1.Edit32.Text := S;
     S := FloatToStr(D_Double(Addr+$29));
//     if S = '0' then Form1.Edit33.Text := 'Автомат' else
     Form1.Edit33.Text := S;
     Form1.Edit34.Text := IntToStr(Bufer[Addr+$31]);
     case Bufer[Addr+$31] of                // определение типа таритовки
     0: begin Ymn:=0; Ymx:=255; end;        // беззнаковый байт (0-255)
     1: begin Ymn:=-128; Ymx:=127; end;     // знаковый байт (-128 +127)
     2: begin Ymn:=0; Ymx:=65535; end;      // беззаковое слово, сначала младший потом старший.
     3: begin Ymn:=-32768; Ymx:=32767; end; // знаковое слово, сначала младший потом старший.
     4: begin Ymn:=0; Ymx:=65535; end;      // беззнаковое слово, сначала старший потом младший.
     5: begin Ymn:=-32768; Ymx:=32767; end; // знаковое слово, сначала старший потом младший.
     6: begin Ymn:=0; Ymx:=65535; end;      // беззнаковое слово. Младший mod 65535 cтарший...
     else begin Ymn:=0; Ymx:=255; end;      // беззнаковый байт (0-255)
     end;
     Form1.edt1D_Offset32.Text := IntToHex(Bufer[Addr+$32],2);
     Form1.Edit35.Text := FloatToStr(D_Double(Addr+$33));  // Делитель для шага
     Form1.Edit36.Text := FloatToStr(D_Double(Addr+$3B));  // смещение ...
     Form1.Edit37.Text := FloatToStr(D_Double(Addr+$43));
     Form1.Edit38.Text := FloatToStr(D_Double(Addr+$4B));  // Шаг...
     Form1.Edit39.Text := FloatToStr(D_Double(Addr+$53)); // смещение ...
     if D_Double(Addr+$43) = 0 then
      begin
       StepY:=D_Double(Addr+$4B)/D_Double(Addr+$33);
       m_in := (Ymn - D_Double(Addr+$53)) * StepY - D_Double(Addr+$3B);
       m_ax := (Ymx - D_Double(Addr+$53)) * StepY - D_Double(Addr+$3B);
      end
     else
      begin
        m_in := 0; m_ax := D_Double(Addr+$43);
      end;

     Form1.StaticText1.Caption := FloatToStrF(m_ax, ffGeneral, 8, 3);
     Form1.StaticText2.Caption := FloatToStrF(m_in, ffGeneral, 8, 3);

     Form1.Edit42.Text := IntToHex(Bufer[Addr+$64],2) + IntToHex(Bufer[Addr+$63],2);
     Form1.Gr__1D.Align := alCustom;
     Form1.Gr__1D.Visible := true;
    end;
//******************************************************************************
  if id_par = 4 then              // БИТОВЫЕ ФЛАГИ КОМПЛЕКТАЦИИ или МАСКИ ОШИБОК
    begin
     Form1.Card.Visible := false;
     Form1.Gr__1D.Visible := false;
     Form1.Gr__2D.Visible := false;
     Form1.P_Dir.Visible :=false;
     Form1.Ident_5.Visible:=false;

     S:=''; for n := Addr+1 to Addr+Bufer[Addr] do S:=S + chr(Bufer[n]); Form1.edit77.Text:=S;
     inc(Addr, $45);
     S:=''; for n := Addr to Addr+3 do S:=S + IntToHex(Bufer[n],2); Form1.edtFlags_ID.Text:=S;
     n:=Form1.RadioGroup3.ItemIndex;
     A_0:=Addr + $4 * n; A_1:=Addr + $41 * n; A_2:=Addr + $208 * n;

     if n = 0 then
       Form1.Edit68.Text := IntToHex(D_Word(A_0+$4,true ),8)   // пдрес 1-го байта флагов (заксорен).
     else
       Form1.Edit68.Text := IntToHex(D_Word(A_0+$4,false ),8); // пдрес 2-го - 8-го байта флагов (заксорен).
     S:=''; for n := A_1+$2D to A_1+$2D-1 +Bufer[A_1+$2C] do S:=S+chr(Bufer[n]); Form1.Edit41.Text :=S;

     S:=''; for n := A_2+$235 to A_2+$234+Bufer[A_2+$234] do S:=S+chr(Bufer[n]); Form1.Edit69.Text :=S;
     S:=''; for n := A_2+$276 to A_2+$275+Bufer[A_2+$275] do S:=S+chr(Bufer[n]); Form1.Edit70.Text :=S;
     S:=''; for n := A_2+$2B7 to A_2+$2B6+Bufer[A_2+$2B6] do S:=S+chr(Bufer[n]); Form1.Edit71.Text :=S;
     S:=''; for n := A_2+$2F8 to A_2+$2F7+Bufer[A_2+$2F7] do S:=S+chr(Bufer[n]); Form1.Edit72.Text :=S;
     S:=''; for n := A_2+$339 to A_2+$338+Bufer[A_2+$338] do S:=S+chr(Bufer[n]); Form1.Edit73.Text :=S;
     S:=''; for n := A_2+$37A to A_2+$379+Bufer[A_2+$379] do S:=S+chr(Bufer[n]); Form1.Edit74.Text :=S;
     S:=''; for n := A_2+$3BB to A_2+$3BA+Bufer[A_2+$3BA] do S:=S+chr(Bufer[n]); Form1.Edit75.Text :=S;
     S:=''; for n := A_2+$3FC to A_2+$3FB+Bufer[A_2+$3FB] do S:=S+chr(Bufer[n]); Form1.Edit76.Text :=S;
     Form1.Flagi.Visible:=true;
    end;
//******************************************************************************
  if id_par = 5 then                              // идентификационные данные...
    begin
     SetLength (Tmp_B, $28F);
     inc(Addr, $45);
       S:=''; for n := Addr to Addr+3 do S:=S + IntToHex(Bufer[n],2); Form1.edtIdent_ID.Text:=S;
     Form1.Card.Visible := false;
     Form1.Gr__1D.Visible := false;
     Form1.Gr__2D.Visible := false;
     Form1.P_Dir.Visible :=false;
     Form1.Flagi.Visible:=false;
     S:=''; for n:=Addr+5 to Addr+4+Bufer[Addr+4] do S:=S+chr(Bufer[n]); Form1.edit20.Text := S;
     Form1.Edit12.Text := IntToHex(D_Word(Addr+$45,true ),8);  // 1-й адрес тарировки (заксорен).
     Form1.Edit13.Text := IntToHex(D_Word(Addr+$49,false),8);  // 2-й адрес тарировки
     Form1.Edit14.Text := IntToHex(D_Word(Addr+$4D,false),8);  // 3-й адрес тарировки (заксорен).
     Form1.Edit15.Text := IntToHex(D_Word(Addr+$51,false),8);  // 4-й адрес тарировки (заксорен).
     Form1.Edit16.Text := IntToHex(D_Word(Addr+$55,false),8);  // 5-й адрес тарировки (заксорен).
     Form1.Edit17.Text := IntToHex(D_Word(Addr+$59,false),8);  // 6-й адрес тарировки (заксорен).
     Form1.Edit18.Text := IntToHex(D_Word(Addr+$5D,false),8);  // 7-й адрес тарировки (заксорен).
     Form1.Edit19.Text := IntToHex(D_Word(Addr+$61,false),8);  // 8-й адрес тарировки (заксорен).
     S:=''; for n := Addr+$76 to Addr+$76-1 +Bufer[Addr+$75] do S:=S+chr(Bufer[n]); Form1.Edit4.Text :=S;
     S:=''; for n := Addr+$B7 to Addr+$B7-1 +Bufer[Addr+$B6] do S:=S+chr(Bufer[n]); Form1.Edit5.Text :=S;
     S:=''; for n := Addr+$F8 to Addr+$F8-1 +Bufer[Addr+$F7] do S:=S+chr(Bufer[n]); Form1.Edit6.Text :=S;
     S:=''; for n := Addr+$139to Addr+$139-1+Bufer[Addr+$138]do S:=S+chr(Bufer[n]); Form1.Edit7.Text :=S;
     S:=''; for n := Addr+$17Ato Addr+$17A-1+Bufer[Addr+$179]do S:=S+chr(Bufer[n]); Form1.Edit8.Text :=S;
     S:=''; for n := Addr+$1BBto Addr+$1BB-1+Bufer[Addr+$1BA]do S:=S+chr(Bufer[n]); Form1.Edit9.Text :=S;
     S:=''; for n := Addr+$1FCto Addr+$1FC-1+Bufer[Addr+$1FB]do S:=S+chr(Bufer[n]); Form1.Edit10.Text:=S;
     S:=''; for n := Addr+$23Dto Addr+$23D-1+Bufer[Addr+$23C]do S:=S+chr(Bufer[n]); Form1.Edit11.Text:=S;
     Form1.Edit21.Text := IntToHex(Bufer[Addr+$6D],2);
     Form1.Edit22.Text := IntToHex(Bufer[Addr+$6E],2);
     Form1.Edit23.Text := IntToHex(Bufer[Addr+$6F],2);
     Form1.Edit24.Text := IntToHex(Bufer[Addr+$70],2);
     Form1.Edit25.Text := IntToHex(Bufer[Addr+$71],2);
     Form1.Edit26.Text := IntToHex(Bufer[Addr+$72],2);
     Form1.Edit27.Text := IntToHex(Bufer[Addr+$73],2);
     Form1.Edit28.Text := IntToHex(Bufer[Addr+$74],2);
     Form1.Ident_5.Visible:=true;
   end;
end;


end.
