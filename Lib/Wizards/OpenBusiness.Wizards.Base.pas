unit OpenBusiness.Wizards.Base;

interface

uses
  ToolsApi;

type
  TOpenBusinessWizard = class(TNotifierObject,
                              IOTAWizard, IOTARepositoryWizard,
                              IOTARepositoryWizard80, IOTAFormWizard)
  protected
    // IOTAWizard
    function GetIDString: string; virtual; abstract;
    function GetName: string; virtual; abstract;
    function GetState: TWizardState; virtual;
    procedure Execute; virtual; abstract;
    // IOTARepositoryWizard
    function GetAuthor: string; virtual;
    function GetComment: string; virtual;
    function GetPage: string; virtual; abstract;
    function GetGlyph: Cardinal; virtual;
    // IOTARepositoryWizard60
    function GetDesigner: string; virtual;
    property Designer: string read GetDesigner;
    // IOTARepositoryWizard80
    function GetGalleryCategory: IOTAGalleryCategory; virtual; abstract;
    function GetPersonality: string; virtual;
    property GalleryCategory: IOTAGalleryCategory read GetGalleryCategory;
    property Personality: string read GetPersonality;
  end;

implementation

{$R OpenBusiness.Wizard.Images.res}

function TOpenBusinessWizard.GetAuthor: string;
begin
  Result := 'CarneiroDelphi';
end;

function TOpenBusinessWizard.GetComment: string;
begin
  Result := 'CarneiroDelphi Base Wizard';
end;

function TOpenBusinessWizard.GetDesigner: string;
begin
  Result := dVCL;
end;

function TOpenBusinessWizard.GetPersonality: string;
begin
  Result := sDelphiPersonality;
end;

function TOpenBusinessWizard.GetGlyph: Cardinal;
begin
  Result := 0;
end;

function TOpenBusinessWizard.GetState: TWizardState;
begin
  Result := [];
end;

end.
