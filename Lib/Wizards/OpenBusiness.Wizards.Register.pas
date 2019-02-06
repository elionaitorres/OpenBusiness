unit OpenBusiness.Wizards.Register;

interface

procedure Register;

implementation

uses
  ToolsApi,
  DesignIntf,
  DesignEditors,
  OpenBusiness.Wizards.Forms,
  OpenBusiness.Wizards.Forms.FormWizard;

procedure Register;
begin
  ForceDemandLoadState(dlDisable);
  RegisterCustomModule(TOpenBusinessForm, TCustomModule);
  RegisterPackageWizard(TOpenBusinessFormWizard.Create);
end;

end.
