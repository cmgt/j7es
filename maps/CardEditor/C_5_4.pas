unit C_5_4;     // конвертируем карты 5 в карты 4...

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ImgList, StdCtrls, ComCtrls, ExtCtrls, IniFiles;

 procedure Conv5to4 (FileName: string);
 procedure GetTar5 ();

//******************************************************************************
implementation

uses Unit1;
//******************************************************************************
//******************************************************************************
//******************************************************************************
Function FindPar (S_find: string): string;
var
    S, Sp: string;
    ns: integer;
begin
  AssignFile(LogFile, Form1.Edit3.Text); Reset(LogFile);
  while not Eof(LogFile) do
    begin
      Readln(LogFile, S);         // Read line of file
      Sp:=copy(S,7,42);
      if Sp = S_Find then
        begin
          while ((copy(S, 2, 8) <> '61 A7 A7') and (not Eof(LogFile))) do Readln(LogFile, S);
          while ((copy(S, 1, 1) <> 'G') and (not Eof(LogFile))) do Readln(LogFile, S);
          if not Eof(LogFile) then
           begin
            Readln(LogFile, S);
            Sp:=copy(S,2,11);
            FindPar:= Sp;
            CloseFile(LogFile);
            exit;
           end;
        end;
    end;
  FindPar:='';
  CloseFile(LogFile);
end;

//******************************************************************************
Procedure Find_79D1 (tmp: integer);
var
    S, Sp, S_Find: string;
    n, ns: integer;
    fl_3s: byte;
begin
  S_Find:=''; for n:=0 to 23 do S_Find:=S_Find+' '+IntToHex(Bufer[tmp+n],2);
  fl_3s:=0;
  AssignFile(LogFile, Form1.Edit3.Text); Reset(LogFile);
  while not Eof(LogFile) do
    begin
      Readln(LogFile, S);         // Read line of file
      Sp:=copy(S,7,42);
      if Sp = copy(S_Find,1,42) then
        begin
          Readln(LogFile, S); Sp:=Sp+copy(S,1,30);
          if Sp = S_Find then
            begin
              while ((copy(S, 1, 1) <> 'G') and (not Eof(LogFile))) do Readln(LogFile, S);
              if not Eof(LogFile) then
               begin
                Readln(LogFile, S);
                Sp:=copy(S,2,47); Readln(LogFile, S); Sp:=Sp+copy(S,1,24);
                for n:=0 to 23 do Bufer[tmp+n]:= StrToInt('$'+ copy(Sp, 3*n+1,2));
                inc(tmp,24); inc(fl_3s,1);
                S_Find:=''; for n:=0 to 23 do S_Find:=S_Find+' '+IntToHex(Bufer[tmp+n],2);
               end; 
            end;
          if fl_3s > 2 then
            begin
              CloseFile(LogFile);
              exit;
            end;
        end;
    end;
  CloseFile(LogFile);
  inc(err_T,1);
end;

//******************************************************************************
Function Find_7BA0 (S_find: string): string;
var
    S, Sp: string;
    ns: integer;
begin
  AssignFile(LogFile, Form1.Edit3.Text); Reset(LogFile);
  while not Eof(LogFile) do
    begin
      Readln(LogFile, S);         // Read line of file
      Sp:=copy(S,7,12);
      if Sp = S_Find then
        begin
          while ((copy(S, 1, 1) <> 'G') and (not Eof(LogFile))) do Readln(LogFile, S);
          if not Eof(LogFile) then
           begin
            Readln(LogFile, S);
            Sp:=copy(S,2,11);
            Find_7BA0:= Sp;
            CloseFile(LogFile);
            exit;
           end;
        end;
    end;
  Find_7BA0:='';
  CloseFile(LogFile);
  inc(err_T,1);
end;

//******************************************************************************
procedure Conv5to4 (FileName: string);
var
  fl_tree: boolean;
  Paren : array[0..50] of TTreeNode;
  AParent, AParent_old  : TTreeNode;
  node: TTreeNode;
Dl_bl, n, tmp,mt, ntr: integer;
fl_type, t48, t48_old: byte;
S_f, S_z,S_Tr: string;
begin
  with Form1.TreeView1.Items do                  // старт построения дерева...
  begin
    Form1.Root1 := Add( nil, Form1.Edit2.Text ); // имя карты...
    Form1.Root1.ImageIndex:= 1;
    Paren[0]:= Form1.Root1;
    AParent := Paren[0];
    ntr:=0; fl_tree := false;
  end;
  Form1.TreeView1.FullExpand;


  AssignFile(OutFile, Form1.Edit2.Text);
  Rewrite (OutFile);
  for n := $00 to $15 do Write (OutFile, st_4[n]);   // заголовок карты
  fl_type:= $FF;
  Dl_bl := $16;
  while Dl_bl < SizeFile - 2 do
    begin
     tmp := Dl_bl;
//******************************************************************************
     if fl_type = $FF then
      begin
       fl_tree := true;
       fl_type := Bufer[tmp+$49];
       Find_79D1 (tmp);
       S_Tr:=''; for n := tmp+1 to tmp+Bufer[tmp] do S_Tr:=S_Tr + chr(Bufer[n]);
       for n := tmp to tmp+$49 do Write (OutFile, Bufer[n]);
       inc(Dl_bl,$4A); inc(o_t,1);
       Form1.ProgressBar1.Position := o_t;
       t48 := Bufer[tmp+$48]; tmp := Dl_bl;
       with Form1.TreeView1.Items do                        //  строим дерево...
        begin
         ntr := t48;
         if t48 <= ntr then AParent := Paren[ntr-1];
         node:=AddChild( AParent, S_Tr);
         AParent := node; Paren[ntr] := AParent;
         node.ImageIndex := fl_type+1;
        end;
       Form1.TreeView1.FullExpand; Application.ProcessMessages; // end дерева...
      end;

//******************************************************************************
     if (fl_type = 0) then                                                      // директория...
      begin
       Find_79D1 (tmp+2);
       S_Tr:=''; for n := tmp+3 to tmp+2+Bufer[tmp+2] do S_Tr:=S_Tr + chr(Bufer[n]);
       for n := tmp to tmp+$4B do Write (OutFile, Bufer[n]);
       inc(Dl_bl,$4C);
       fl_type := Bufer[tmp+$4B];
       t48 := Bufer[tmp+$4A]; tmp := Dl_bl;
       with Form1.TreeView1.Items do                        //  строим дерево...
        begin
         ntr := t48;
         if t48 <= ntr then AParent := Paren[ntr-1];
         node:=AddChild( AParent, S_Tr);
         AParent := node; Paren[ntr] := AParent;
         node.ImageIndex := fl_type+1;
        end;
       Form1.TreeView1.FullExpand; Application.ProcessMessages; // end дерева...
      end;
//******************************************************************************
     if (fl_type = 1) then                                                      // график '2D'
      begin
       S_f:=''; for n:=$10 to $13 do S_f:=S_f+' '+IntToHex(Bufer[tmp+n],2);
       S_z := Find_7BA0 (S_f);
       S_f:=''; for n:=$10 to $1D do S_f:=S_f+' '+IntToHex(Bufer[tmp+n],2);
       if S_z <> '' then for n:=0 to 3 do Bufer[tmp+$10+n]:= StrToInt('$'+ copy(S_z, 3*n+1,2));
       // строим график
       mt:=$8F; Write (OutFile, mt); mt:=$01; Write (OutFile, mt); // длина блока для версии 410
       for n := tmp+2 to tmp+5 do Write (OutFile, Bufer[n]);       // уникальный ID для сравнения
       if Form1.RadioGroup1.ItemIndex = 0 then                                                           // адрес тарировки в прошивке
       Bufer[tmp+$11] := Bufer[tmp+$11] and $7F;                 // для VS56  !!!!
       for n := tmp+$10 to tmp+$13 do Write (OutFile, Bufer[n]);   // адрес тарировки в прошивке
//       S_f:=IntToHex(Bufer[tmp+$10],2)+' '+IntToHex(Bufer[tmp+$11],2)+' '+
//            IntToHex(Bufer[tmp+$12],2)+' '+IntToHex(Bufer[tmp+$13],2);
       mt:=$00; Write (OutFile, mt); mt:=$00; Write (OutFile, mt); //       'Y'
       mt:=$80; Write (OutFile, mt); mt:=$3F; Write (OutFile, mt); //       'Y'
       mt:=$00; Write (OutFile, mt); mt:=$00; Write (OutFile, mt); //   'Y'
       mt:=$00; Write (OutFile, mt); mt:=$00; Write (OutFile, mt); //   'Y'
       mt:=$00; Write (OutFile, mt); mt:=$00; Write (OutFile, mt); //   'Y'
       mt:=$00; Write (OutFile, mt); mt:=$00; Write (OutFile, mt); //   'Y'

       S_f := FindPar (S_f);
       if S_f = '' then
        begin
         mt:=$00; Write (OutFile, mt); mt:=$00; Write (OutFile, mt); //       'Y'   !
         mt:=$40; Write (OutFile, mt); mt:=$3F; Write (OutFile, mt); //       'Y'   !
        end
       else
        begin
          mt:=StrToInt('$'+ copy(S_f, 1,2)); Write (OutFile, mt);
          mt:=StrToInt('$'+ copy(S_f, 4,2)); Write (OutFile, mt);
          mt:=StrToInt('$'+ copy(S_f, 7,2)); Write (OutFile, mt);
          mt:=StrToInt('$'+ copy(S_f,10,2)); Write (OutFile, mt);
        end;
       mt:=$00; Write (OutFile, mt); mt:=$00; Write (OutFile, mt); //   'Y'
       mt:=$00; Write (OutFile, mt); mt:=$00; Write (OutFile, mt); //   'Y'

       mt:=$4B; Write (OutFile, mt); mt:=$75; Write (OutFile, mt); // Какой-то ID  ???

       for n := tmp+$2E to tmp+$51 do Write (OutFile, Bufer[n]);

       mt:=$00; for n := 0 to 10 do Write (OutFile, mt);

       for n := tmp+$52 to tmp+$193 do Write (OutFile, Bufer[n]);
//       mt:=$00; Write (OutFile, mt);
       inc(Dl_bl, $192 +2); fl_type:= $FF;
       inc(gr_2d,1);
      end;
//******************************************************************************
     if (fl_type = 2) then                                                      // график '3D'
      begin
       S_f:=''; for n:=$10 to $13 do S_f:=S_f+' '+IntToHex(Bufer[tmp+n],2);
       S_z := Find_7BA0 (S_f);
       S_f:=''; for n:=$10 to $1D do S_f:=S_f+' '+IntToHex(Bufer[tmp+n],2);
       if S_z <> '' then for n:=0 to 3 do Bufer[tmp+$10+n]:= StrToInt('$'+ copy(S_z, 3*n+1,2));
       // строим график
       mt:=$C2; Write (OutFile, mt); Write (OutFile, Bufer[tmp+1]);     // 'xx 02 C2 02'
       for n := tmp+2 to tmp+5 do Write (OutFile, Bufer[n]);            // ID для функции сравнения

       if Form1.RadioGroup1.ItemIndex = 0 then                                                           // адрес тарировки в прошивке
       Bufer[tmp+$11] := Bufer[tmp+$11] and $7F;                  // для VS56  !!!!
       for n := tmp+$10 to tmp+$13 do Write (OutFile, Bufer[n]);  // !!!  это ксорится   !!!
//       S_f:=IntToHex(Bufer[tmp+$10],2)+' '+IntToHex(Bufer[tmp+$11],2)+' '+
//            IntToHex(Bufer[tmp+$12],2)+' '+IntToHex(Bufer[tmp+$13],2);
       mt:=$00; for n := 0 to 3 do Write (OutFile, mt);
       mt:=$00; for n := 0 to 3 do Write (OutFile, mt);
       mt:=$00; Write (OutFile, mt); mt:=$00; Write (OutFile, mt);
       mt:=$80; Write (OutFile, mt); mt:=$3F; Write (OutFile, mt);
       mt:=$00; for n := 0 to 3 do Write (OutFile, mt);

       S_f := FindPar (S_f);
       if S_f = '' then
        begin
         mt:=$00; Write (OutFile, mt); mt:=$00; Write (OutFile, mt); //
         mt:=$80; Write (OutFile, mt); mt:=$3F; Write (OutFile, mt); //
        end
       else
        begin
          mt:=StrToInt('$'+ copy(S_f, 1,2)); Write (OutFile, mt);
          mt:=StrToInt('$'+ copy(S_f, 4,2)); Write (OutFile, mt);
          mt:=StrToInt('$'+ copy(S_f, 7,2)); Write (OutFile, mt);
          mt:=StrToInt('$'+ copy(S_f,10,2)); Write (OutFile, mt);
        end;
       mt:=$6B; Write (OutFile, mt); mt:=$75; Write (OutFile, mt);

       for n := tmp+$2E to tmp+$64 do Write (OutFile, Bufer[n]);
       mt:=$00; for n := 0 to 7 do Write (OutFile, mt);
       mt:=$FF; Write (OutFile, mt); mt:=$FF; Write (OutFile, mt);
       mt:=$00; Write (OutFile, mt);
       for n := tmp+$65 to tmp+$2C6 do Write (OutFile, Bufer[n]);
//       mt:=$00;  Write (OutFile, mt);

       inc(Dl_bl, $2C5+2); fl_type:= $FF;
       inc(gr_3d,1);
      end;
//******************************************************************************
     if (fl_type = 3) then                                                      // график '1D'
      begin
       S_f:=''; for n:=$0E to $11 do S_f:=S_f+' '+IntToHex(Bufer[tmp+n],2);
       S_z := Find_7BA0 (S_f);
       S_f:=''; for n:=$0E to $1B do S_f:=S_f+' '+IntToHex(Bufer[tmp+n],2);
       if S_z <> '' then for n:=0 to 3 do Bufer[tmp+$0E+n]:= StrToInt('$'+ copy(S_z, 3*n+1,2));
       mt:=$4A; Write (OutFile, mt);
       for n := tmp+1 to tmp+5 do Write (OutFile, Bufer[n]);
       for n := tmp+$0E to tmp+$11 do Write (OutFile, Bufer[n]);     // адрес тарировки в прошивке

       S_f := FindPar (S_f);
       if S_f = '' then
        begin
         mt:=$00; Write (OutFile, mt); mt:=$00; Write (OutFile, mt); //       'Y'   !
         mt:=$40; Write (OutFile, mt); mt:=$3F; Write (OutFile, mt); //       'Y'   !
        end
       else
        begin
          mt:=StrToInt('$'+ copy(S_f, 1,2)); Write (OutFile, mt);
          mt:=StrToInt('$'+ copy(S_f, 4,2)); Write (OutFile, mt);
          mt:=StrToInt('$'+ copy(S_f, 7,2)); Write (OutFile, mt);
          mt:=StrToInt('$'+ copy(S_f,10,2)); Write (OutFile, mt);
        end;
//       mt:=$00; Write (OutFile, mt); mt:=$00; Write (OutFile, mt);
//       mt:=$40; Write (OutFile, mt); mt:=$3F; Write (OutFile, mt);

       mt:=$00; Write (OutFile, mt); mt:=$00; Write (OutFile, mt);
       mt:=$80; Write (OutFile, mt); mt:=$3F; Write (OutFile, mt);

       mt:=$00; for n := 0 to 3 do Write (OutFile, mt);

       mt:=$00; for n := 0 to 3 do Write (OutFile, mt);                         //  ????? 

       mt:=$00; for n := 0 to 3 do Write (OutFile, mt);

       mt:=$4B; Write (OutFile, mt); mt:=$55; Write (OutFile, mt);

       for n :=tmp+$2C to tmp+$3D do Write (OutFile, Bufer[n]);
       mt:=$00; for n := 0 to 3 do Write (OutFile, mt);
       mt:=$00; for n := 0 to 3 do Write (OutFile, mt);

       for n :=tmp+$3E to tmp+$4F do Write (OutFile, Bufer[n]);

       inc(Dl_bl, $4E+2); fl_type:= $FF;
       inc(gr_1d,1);
      end;

//******************************************************************************
     if (fl_type = 4) then                                                      // битовые флаги...
      begin
       for n := tmp to tmp+$123F do Write (OutFile, Bufer[n]);
       inc(Dl_bl,$1240); fl_type:= $FF;
      end;

//******************************************************************************
     if (fl_type = 5) then                                                      // калибровки...
      begin
       for n := tmp to tmp+$287 do Write (OutFile, Bufer[n]);
       inc(Dl_bl,$288); fl_type:= $FF;
      end;

//******************************************************************************
    end;
  CloseFile (OutFile);
end;

//******************************************************************************
procedure GetTar5 ();
var
Dl_bl, n, tmp,mt: integer;
fl_type: byte;
begin
  fl_type:= $FF; Dl_bl := $16;
  while Dl_bl < SizeFile - 2 do
    begin
     tmp := Dl_bl;
//********************************************************************************************
     if fl_type = $FF then
      begin
       fl_type := Bufer[tmp+$49];
       inc(Dl_bl,$4A); tmp := Dl_bl; inc(o_t,1);
      end;
//*******************************************************************************************
     if (fl_type = 0) then // директория...
      begin
       inc(Dl_bl,$4C); fl_type := Bufer[tmp+$4B];       // fl_type:= $FF;
       tmp := Dl_bl;
      end;
 //*******************************************************************************************
     if (fl_type = 1) then                                                      // график '2D'
      begin
       inc(Dl_bl, $192 +2); fl_type:= $FF; inc(gr_2d,1);
      end;
//*******************************************************************************************
     if (fl_type = 2) then                                                      // график '3D'
      begin
       inc(Dl_bl, $2C5+2); fl_type:= $FF; inc(gr_3d,1);
      end;
//*******************************************************************************************
     if (fl_type = 3) then                                                      // график '1D'
      begin
       inc(Dl_bl, $4E+2); fl_type:= $FF; inc(gr_1d,1);
      end;
//*******************************************************************************************
     if (fl_type = 4) then // битовые флаги...
      begin
       inc(Dl_bl,$1240); fl_type:= $FF;
      end;
//*******************************************************************************************
     if (fl_type = 5) then // калибровки...
      begin
       inc(Dl_bl,$288); fl_type:= $FF;
      end;
//*******************************************************************************************
    end;
end;
//*******************************************************************************************
//*******************************************************************************************
//*******************************************************************************************


end.
