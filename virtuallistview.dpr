program VirtualListView;

uses
  Forms,
  VListView in 'VListView.pas' {Form1},
  ABOUT in 'ABOUT.pas' {AboutBox};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := 'Nek Backup';
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TAboutBox, AboutBox);
  Application.Run;
end.
