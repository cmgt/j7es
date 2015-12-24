program Card_01;

uses
  Forms,
  Unit1 in 'Unit1.pas' {Form1},
  C_5_4 in 'C_5_4.pas',
  C_4 in 'C_4.pas',
  C_3 in 'C_3.pas',
  Bar in 'Bar.pas' {Form2},
  About in 'About.pas' {Form3};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TForm3, Form3);
  Application.Run;
end.
