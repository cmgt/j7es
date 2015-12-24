unit About;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, ExtCtrls, StdCtrls;

type
  TForm3 = class(TForm)
    Image1: TImage;
    procedure sbAddClick(Sender: TObject);
    procedure LabelSMSClick(Sender: TObject);
    procedure LabelSMSMouseEnter(Sender: TObject);
    procedure LabelSMSMouseLeave(Sender: TObject);
    procedure Image1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;
  m: Integer;
implementation

{$R *.dfm}

procedure TForm3.sbAddClick(Sender: TObject);
begin
 m:=1;
end;

procedure TForm3.LabelSMSClick(Sender: TObject);
begin
 m:=1
end;

procedure TForm3.LabelSMSMouseEnter(Sender: TObject);
begin
m:=1
end;

procedure TForm3.LabelSMSMouseLeave(Sender: TObject);
begin
m:=1;
end;

procedure TForm3.Image1Click(Sender: TObject);
begin
  Form3.Close;
end;

end.
