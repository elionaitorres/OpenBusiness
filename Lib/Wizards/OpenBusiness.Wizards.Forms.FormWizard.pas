unit OpenBusiness.Wizards.Forms.FormWizard;

interface

uses
  ToolsApi,
  OpenBusiness.Lib.IOTA.Creators,
  OpenBusiness.Wizards.Base;

type
  TOpenBusinessFormWizard = class(TOpenBusinessWizard)
  protected
    function GetIDString: string; override;
    function GetName: string; override;
    procedure Execute; override;
    function GetComment: string; override;
    function GetPage: string; override;
    function GetGlyph: Cardinal; override;
    function GetGalleryCategory: IOTAGalleryCategory; override;
    property GalleryCategory: IOTAGalleryCategory read GetGalleryCategory;
    property Personality;
  end;

  TOpenBusinessSourceFileCreator = class(TModuleCreatorSourceFile)
  public
    function GetSource: string; override;
  end;

  TOpenBusinessFormModuleCreator = class(TFormCreatorModule)
  protected
    function GetAncestorName: string; override;
    function GetImplFile: TModuleCreatorSourceFileClass; override;
  end;

implementation

{$R OpenBusiness.WizardsResource.RES}

uses
  Windows,
  System.SysUtils;

var
  DelphiCategory: IOTAGalleryCategory;

procedure TOpenBusinessFormWizard.Execute;
begin
  inherited;
  (BorlandIDEServices as IOTAModuleServices).CreateModule(TOpenBusinessFormModuleCreator.Create);
end;

function TOpenBusinessFormWizard.GetComment: string;
begin
  Result := 'Form base com opções avançadas adicionais para o OpenBusiness.';
end;

function TOpenBusinessFormWizard.GetIDString: string;
begin
  Result := 'OpenBusiness.FORM';
end;

function TOpenBusinessFormWizard.GetName: string;
begin
  Result := 'OpenBusiness Form';
end;

function TOpenBusinessFormWizard.GetPage: string;
begin
  Result := 'OpenBusiness Forms';
end;

function TOpenBusinessFormWizard.GetGalleryCategory: IOTAGalleryCategory;
begin
  Result := DelphiCategory;
end;

function TOpenBusinessFormWizard.GetGlyph: Cardinal;
begin
  Result := LoadIcon(hInstance, 'OB_FORM_ICONS');
end;

function TOpenBusinessSourceFileCreator.GetSource: string;
var
  Text, ResName: AnsiString;
  ResInstance: THandle;
  HRes: HRSRC;
begin
  ResName := AnsiString('WIZ_EMPTY_FORM_SOURCE');
  ResInstance := FindResourceHInstance(HInstance);
  HRes := FindResourceA(ResInstance, PAnsiChar(ResName), PAnsiChar(10));
  Text := PAnsiChar(LockResource(LoadResource(ResInstance, HRes)));
  SetLength(Text, SizeOfResource(ResInstance, HRes));
  Result := StringReplace(String(Text), '<DEFINITIONUNIT>', 'OpenBusiness.Wizards.Forms', [rfIgnoreCase]);
  Result := inherited GetSource;
end;

function TOpenBusinessFormModuleCreator.GetAncestorName: string;
begin
  Result := 'OpenBusinessForm';
end;

function TOpenBusinessFormModuleCreator.GetImplFile: TModuleCreatorSourceFileClass;
begin
  Result := TOpenBusinessSourceFileCreator;
end;

initialization
  DelphiCategory := AddDelphiCategory('OpenBusiness.FORMS', 'OpenBusiness Forms');

finalization
  RemoveCategory(DelphiCategory);

end.
