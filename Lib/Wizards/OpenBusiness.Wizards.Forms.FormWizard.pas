unit OpenBusiness.Wizards.Forms.FormWizard;

interface

uses
  Windows,
  ToolsApi,
  OpenBusiness.Lib.IOTA.Creators,
  OpenBusiness.Wizards.Base;

const
  OBJECT_REPOSITORY_CATEGORY_ID = 'OpenBusiness.WIZARD';
  OBJECT_REPOSITORY_CATEGORY_NAME = 'OpenBusiness Wizards';
  OBJECT_REPOSITORY_PAGE_NAME = OBJECT_REPOSITORY_CATEGORY_NAME;

  WIZARD_ID = 'OpenBusiness.WIZARD.FORM';
  WIZARD_NAME = 'OpenBusiness Form';
  WIZARD_COMMENT = 'Form com opções avançadas adicionais para o OpenBusiness.';

  WIZARD_ICONS = 'OB_FORM_ICONS';

  DEFINITIONUNIT = 'OpenBusiness.Wizards.Forms';
  ANCESTOR_ID = 'OpenBusinessForm';

  FILE_CONTENT =
      'unit <UNITNAME>;'#13#10#13#10 +

      '{ OpenBusiness Form. Copyright <COPYRIGHTYEAR> CarneiroDelphi. }'#13#10#13#10 +

      'interface'#13#10#13#10 +

      'uses'#13#10 +
      '  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,'#13#10 +
      '  Dialogs, <DEFINITIONUNIT>;'#13#10#13#10 +

      'type'#13#10 +
      '  T<CLASS_ID> = class(T<ANCESTOR_ID>)'#13#10 +
      '  private'#13#10 +
      '    { Declarações privadas }'#13#10 +
      '  protected'#13#10 +
      '    { Declarações protegidas }'#13#10 +
      '  public'#13#10 +
      '    { Declarações públicas }'#13#10 +
      '  end;'#13#10#13#10 +

      'implementation'#13#10#13#10 +

      '{$R *.dfm}'#13#10#13#10 +

  //    'initialization'#13#10 +   #13#10 +

  //    '  RegisterClass(T<CLASS_ID>)'#13#10#13#10 +

      'end.';

var
  DelphiCategory: IOTAGalleryCategory;

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

  TOpenBusinessFormFileCreator = class(TModuleCreatorFile)
  public
    function GetSource: string; override;
  end;

  TOpenBusinessFormModuleCreator = class(TFormCreatorModule)
  public
    function GetAncestorName: string; override;
    function GetImplFile: TModuleCreatorFileClass; override;
  end;

implementation

uses
  SysUtils, DateUtils;

procedure TOpenBusinessFormWizard.Execute;
begin
  inherited;
  (BorlandIDEServices as IOTAModuleServices).CreateModule(TOpenBusinessFormModuleCreator.Create);
end;

function TOpenBusinessFormWizard.GetComment: string;
begin
  Result := WIZARD_COMMENT;
end;

function TOpenBusinessFormWizard.GetIDString: string;
begin
  Result := WIZARD_ID;
end;

function TOpenBusinessFormWizard.GetName: string;
begin
  Result := WIZARD_NAME;
end;

function TOpenBusinessFormWizard.GetPage: string;
begin
  Result := OBJECT_REPOSITORY_PAGE_NAME;
end;

function TOpenBusinessFormWizard.GetGalleryCategory: IOTAGalleryCategory;
begin
  Result := DelphiCategory;
end;

function TOpenBusinessFormWizard.GetGlyph: Cardinal;
begin
  Result := LoadIcon(hInstance, WIZARD_ICONS);
end;

function TOpenBusinessFormFileCreator.GetSource: string;
begin
  Result := StringReplace(FILE_CONTENT, '<DEFINITIONUNIT>', DEFINITIONUNIT, [rfIgnoreCase]);
  Result := StringReplace(Result, '<COPYRIGHTYEAR>', IntToStr(YearOf(Now)) + ' / ' + IntToStr(YearOf(Now) + 1), [rfIgnoreCase]);
  Result := inherited GetSource;
end;

function TOpenBusinessFormModuleCreator.GetAncestorName: string;
begin
  Result := ANCESTOR_ID; // O form registrado
end;

function TOpenBusinessFormModuleCreator.GetImplFile: TModuleCreatorFileClass;
begin
  Result := TOpenBusinessFormFileCreator;
end;

initialization
  DelphiCategory := AddDelphiCategory(OBJECT_REPOSITORY_CATEGORY_ID, OBJECT_REPOSITORY_CATEGORY_NAME);

finalization
  RemoveCategory(DelphiCategory);

end.
