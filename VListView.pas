unit VListView;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, StdCtrls, ToolWin, ShlObj, ImgList, Menus, XPMan, Registry;

type
  PShellItem = ^TShellItem;
  TShellItem = record
    FullID,
    ID: PItemIDList;
    Empty: Boolean;
    DisplayName,
    TypeName: string;
    ImageIndex,
    Size,
    Attributes: Integer;
    ModDate: string;
  end;

  TForm1 = class(TForm)
    XPManifest1: TXPManifest;
    Button1: TButton;
    GroupBox1: TGroupBox;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    CheckBox5: TCheckBox;
    Edit1: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    CheckBox6: TCheckBox;
    Button2: TButton;
    Button4: TButton;
    Button3: TButton;
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure CheckBox6Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses ShellAPI, ActiveX, ComObj, CommCtrl, FileCtrl, ABOUT;

procedure TForm1.FormCreate(Sender: TObject);
var
  FileInfo: TSHFileInfo;
  ImageListHandle: THandle;
  NewPIDL: PItemIDList;
  reg: TRegistry;
  A: integer;
   S: string;


begin
reg := TRegistry.Create;
reg.RootKey := HKEY_LOCAL_MACHINE;
reg.OpenKey('Software\Microsoft\Windows\CurrentVersion\',false);
S:=(reg.ReadString('MediaPath'));
A:=pos('Me',reg.ReadString('MediaPath'));
Delete(S,A,5);
Label2.Caption:=S;
reg.CloseKey;
reg.free;
end;

procedure TForm1.CheckBox6Click(Sender: TObject);
begin
if CheckBox6.Checked = True then Label2.Visible:= True;
if CheckBox6.Checked = False then Label2.Visible:= False;
end;

function GetPath(mes: string):string;
var
Root: string;
pwRoot : PWideChar; Dir: string;
begin
Root := '';
GetMem(pwRoot, (Length(Root)+1) * 2);
pwRoot := StringToWideChar(Root, pwRoot, MAX_PATH*2);
if SelectDirectory(mes, pwRoot, Dir) then
if length(Dir) =2
then GetPath := Dir+'\' else GetPath := Dir else
GetPath := '';
end;
procedure TForm1.Button1Click(Sender: TObject);
var
Path: string;
begin
if About.AboutBox.label3.Caption='1' then
Path := GetPath('Select Directory');
if Path <> ''
then Edit1.Text := Path;
Button4.SetFocus;

if About.AboutBox.label3.Caption='2' then
Path := GetPath('Выбор папки для сохранения файлов.');
if Path <> ''
then Edit1.Text := Path;
Button4.SetFocus;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
Form1.Close;
end;

procedure TForm1.Button4Click(Sender: TObject);
var
 OpStruc:TSHFileOpStruct;
 frombuf,tobuf:array[0..128] of Char;
 begin
if  About.AboutBox.label3.Caption='1' then
if Edit1.text=''  then
ShowMessage('Please select directory!');
Button1.SetFocus;
if edit1.text='Please select directory!' then
ShowMessage('Please select directory!');
Button1.SetFocus;

if  About.AboutBox.label3.Caption='2' then
if Edit1.text=''  then
ShowMessage('Пожалуйста выберите папку!');
Button1.SetFocus;
if edit1.text='Please select directory!' then
ShowMessage('Пожалуйста выберите папку!');
Button1.SetFocus;
if Edit1.text='' then exit;
if Edit1.text='Please select directory!' then exit;

 begin
 if CheckBox1.Checked = True then
 FillChar(frombuf, Sizeof(frombuf), 0);
 FillChar(tobuf, Sizeof(tobuf), 0);
 StrPCopy(frombuf, Label2.Caption+'\cursors');
 StrPCopy(tobuf, edit1.text);
 with OpStruc do
  begin
   Wnd:=Handle;
   wFunc:=FO_COPY;
   pFrom:=@frombuf;
   pTo:=@tobuf;
   fFlags:=FOF_NOCONFIRMATION or FOF_RENAMEONCOLLISION;
   fAnyOperationsAborted:=False;
   hNameMappings:=nil;
   lpszProgressTitle:=nil;
  end;
  if CheckBox1.Checked = True then
 ShFileOperation(OpStruc);
 end;

 begin
 if CheckBox2.Checked = True then
 FillChar(frombuf, Sizeof(frombuf), 0);
 FillChar(tobuf, Sizeof(tobuf), 0);
 StrPCopy(frombuf, Label2.Caption+'\Fonts');
 StrPCopy(tobuf, edit1.text);
 with OpStruc do
  begin
   Wnd:=Handle;
   wFunc:=FO_COPY;
   pFrom:=@frombuf;
   pTo:=@tobuf;
   fFlags:=FOF_NOCONFIRMATION or FOF_RENAMEONCOLLISION;
   fAnyOperationsAborted:=False;
   hNameMappings:=nil;
   lpszProgressTitle:=nil;
  end;
  if CheckBox2.Checked = True then
 ShFileOperation(OpStruc);
end;

begin
 if CheckBox3.Checked = True then
 FillChar(frombuf, Sizeof(frombuf), 0);
 FillChar(tobuf, Sizeof(tobuf), 0);
 StrPCopy(frombuf, Label2.Caption+'\icons');
 StrPCopy(tobuf, edit1.text);
 with OpStruc do
  begin
   Wnd:=Handle;
   wFunc:=FO_COPY;
   pFrom:=@frombuf;
   pTo:=@tobuf;
   fFlags:=FOF_NOCONFIRMATION or FOF_RENAMEONCOLLISION;
   fAnyOperationsAborted:=False;
   hNameMappings:=nil;
   lpszProgressTitle:=nil;
  end;
  if CheckBox3.Checked = True then
 ShFileOperation(OpStruc);
 end;

 begin
 if CheckBox4.Checked = True then
 FillChar(frombuf, Sizeof(frombuf), 0);
 FillChar(tobuf, Sizeof(tobuf), 0);
 StrPCopy(frombuf, Label2.Caption+'\Resources\Themes');
 StrPCopy(tobuf, edit1.text);
 with OpStruc do
  begin
   Wnd:=Handle;
   wFunc:=FO_COPY;
   pFrom:=@frombuf;
   pTo:=@tobuf;
   fFlags:=FOF_NOCONFIRMATION or FOF_RENAMEONCOLLISION;
   fAnyOperationsAborted:=False;
   hNameMappings:=nil;
   lpszProgressTitle:=nil;
  end;
  if CheckBox4.Checked = True then
 ShFileOperation(OpStruc);
 end;

begin
 if CheckBox5.Checked = True then
 FillChar(frombuf, Sizeof(frombuf), 0);
 FillChar(tobuf, Sizeof(tobuf), 0);
 StrPCopy(frombuf, Label2.Caption+'\Web\Wallpaper');
 StrPCopy(tobuf, edit1.text);
 with OpStruc do
  begin
   Wnd:=Handle;
   wFunc:=FO_COPY;
   pFrom:=@frombuf;
   pTo:=@tobuf;
   fFlags:=FOF_NOCONFIRMATION or FOF_RENAMEONCOLLISION;
   fAnyOperationsAborted:=False;
   hNameMappings:=nil;
   lpszProgressTitle:=nil;
  end;
  if CheckBox5.Checked = True then
 ShFileOperation(OpStruc);
 end;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
Aboutbox.ShowModal;
end;

end.
