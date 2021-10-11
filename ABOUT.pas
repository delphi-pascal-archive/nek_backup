unit About;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls,
  Buttons, ExtCtrls, Messages, Variants, Dialogs;

type
  TAboutBox = class(TForm)
    Panel1: TPanel;
    ProgramIcon: TImage;
    ProductName: TLabel;
    Version: TLabel;
    OKButton: TButton;
    Timer1: TTimer;
    Copyright: TLabel;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    Label3: TLabel;
    procedure RadioButton1Click(Sender: TObject);
    procedure RadioButton2Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure OKButtonClick(Sender: TObject);
    procedure ShowTime;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AboutBox: TAboutBox;

implementation

uses VListView;

{$R *.dfm}

procedure TAboutBox.OKButtonClick(Sender: TObject);
begin
Aboutbox.close;
end;

procedure TAboutBox.ShowTime;
var
Time: TDateTime;
begin
Time := Now();
Label2.Caption := FormatDateTime('hh:mm:ss',Time);
end;

procedure TAboutBox.FormPaint(Sender: TObject);
begin
ShowTime;
if label3.Caption='1' then RadioButton1.Checked:=True;
if label3.Caption='2' then RadioButton2.Checked:=True;
end;

procedure TAboutBox.Timer1Timer(Sender: TObject);
begin
ShowTime;
end;

procedure TAboutBox.RadioButton2Click(Sender: TObject);
begin
if RadioButton2.Checked=True then Copyright.Caption:='Автор: Nek Inc. 2006';
if RadioButton2.Checked=True then ProductName.Caption:='Имя: Nek Backup';
if RadioButton2.Checked=True then AboutBox.Caption:='О программе';
if RadioButton2.Checked=True then Version.Caption:='Версия: 0.96';
if RadioButton2.Checked=True then GroupBox2.Caption:='Копируемые папки:';
if RadioButton2.Checked=True then GroupBox3.Caption:='Язык:';
if RadioButton2.Checked=True then Label1.Caption:='Текущее время:';
if RadioButton2.Checked=True then VListView.Form1.Label1.Caption:='Папка:';
if RadioButton2.Checked=True then VListView.Form1.Button1.Caption:='Выбор';
if RadioButton2.Checked=True then VListView.Form1.Button2.Caption:='Выход';
if RadioButton2.Checked=True then VListView.Form1.Button3.Caption:='О программе';
if RadioButton2.Checked=True then VListView.Form1.CheckBox6.Caption:='Исходная папка:';
if RadioButton2.Checked=True then label3.Caption:='2';
if RadioButton2.Checked=True then VListView.Form1.Button4.Caption:='Копировать!';
end;

procedure TAboutBox.RadioButton1Click(Sender: TObject);
begin
if RadioButton1.Checked=True then Copyright.Caption:='Copyright: Nek Inc. 2006';
if RadioButton1.Checked=True then ProductName.Caption:='Name: Nek Backup';
if RadioButton1.Checked=True then AboutBox.Caption:='About';
if RadioButton1.Checked=True then Version.Caption:='Version: 0.96';
if RadioButton1.Checked=True then GroupBox2.Caption:='Copy Folders:';
if RadioButton1.Checked=True then GroupBox3.Caption:='Language:';
if RadioButton1.Checked=True then Label1.Caption:='Current Time:';
if RadioButton1.Checked=True then VListView.Form1.Label1.Caption:='Safe Folder:';
if RadioButton1.Checked=True then VListView.Form1.Button1.Caption:='Change';
if RadioButton1.Checked=True then VListView.Form1.Button2.Caption:='Exit';
if RadioButton1.Checked=True then VListView.Form1.Button3.Caption:='About';
if RadioButton1.Checked=True then VListView.Form1.CheckBox6.Caption:='Source Path:';
if RadioButton1.Checked=True then label3.Caption:='1';
if RadioButton1.Checked=True then VListView.Form1.Button4.Caption:='Go!';

end;

end.

