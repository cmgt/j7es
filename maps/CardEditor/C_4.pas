unit C_4;          // �����  4

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ImgList, StdCtrls, ComCtrls, ExtCtrls, IniFiles;

procedure Read_C4 (FileName: string);  

implementation

uses Unit1;
//******************************************************************************
//******************************************************************************
procedure Read_C4 (FileName: string);
var
  fl_tree: boolean;
  Paren : array[0..50] of TTreeNode;
  AParent, AParent_old  : TTreeNode;
  node: TTreeNode;
Dl_bl, n, tmp,mt, ntr: integer;
fl_type, t48, t48_old: byte;
S_f, S_z,S_Tr: string;
begin
  with Form1.TreeView1.Items do                  // ����� ���������� ������...
  begin
    Form1.Root1 := Add( nil, Form1.Edit1.Text ); // ��� �����...
    Form1.Root1.ImageIndex:= 1; Paren[0]:= Form1.Root1;
    AParent := Paren[0]; ntr:=0; fl_tree := false;
  end;
  Form1.TreeView1.FullExpand;

//  AssignFile(OutFile, Form1.Edit2.Text);
//  Rewrite (OutFile);
//  for n := $00 to $15 do Write (OutFile, st_4[n]);   // ��������� �����
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
       S_Tr:=''; for n := tmp+1 to tmp+Bufer[tmp] do S_Tr:=S_Tr + chr(Bufer[n]);
       inc(Dl_bl,$4A); inc(o_t,1);
       Form1.ProgressBar1.Position := o_t;
       t48 := Bufer[tmp+$48]; tmp := Dl_bl;
       with Form1.TreeView1.Items do                        //  ������ ������...
        begin
         ntr := t48;
         if t48 <= ntr then AParent := Paren[ntr-1];
         node:=AddChild( AParent, S_Tr);
         AParent := node; Paren[ntr] := AParent;
         node.ImageIndex := fl_type+1;
        end;
       Form1.TreeView1.FullExpand; Application.ProcessMessages; // end ������...
      end;

//******************************************************************************
     if (fl_type = 0) then                                                      // ����������...
      begin
       S_Tr:=''; for n := tmp+3 to tmp+2+Bufer[tmp+2] do S_Tr:=S_Tr + chr(Bufer[n]);
       inc(Dl_bl,$4C);
       fl_type := Bufer[tmp+$4B];
       t48 := Bufer[tmp+$4A]; tmp := Dl_bl;
       with Form1.TreeView1.Items do                        //  ������ ������...
        begin
         ntr := t48;
         if t48 <= ntr then AParent := Paren[ntr-1];
         node:=AddChild( AParent, S_Tr);
         AParent := node; Paren[ntr] := AParent;
         node.ImageIndex := fl_type+1;
        end;
       Form1.TreeView1.FullExpand; Application.ProcessMessages; // end ������...
      end;
//******************************************************************************
     if (fl_type = 1) then                                                      // ������ '2D'
      begin
       inc(Dl_bl, $18F + 2); fl_type:= $FF; inc(gr_2d,1);
      end;
//******************************************************************************
     if (fl_type = 2) then                                                      // ������ '3D'
      begin
       inc(Dl_bl, $2C2 + 2); fl_type:= $FF; inc(gr_3d,1);
      end;
//******************************************************************************
     if (fl_type = 3) then                                                      // ������ '1D'
      begin
       inc(Dl_bl, $4A + 2 ); fl_type:= $FF; inc(gr_1d,1);
      end;

//******************************************************************************
     if (fl_type = 4) then                                                      // ������� �����...
      begin
       inc(Dl_bl,$1240); fl_type:= $FF;
      end;

//******************************************************************************
     if (fl_type = 5) then                                                      // ����������...
      begin
       inc(Dl_bl,$286 + 2); fl_type:= $FF;
      end;

//******************************************************************************
    end;
//  CloseFile (OutFile);
end;




end.
