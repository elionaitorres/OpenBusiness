unit OpenBusiness.Wizards.Informations;

interface

uses
  ToolsAPI, Windows, SysUtils, DesignIntf;

var
  AboutBoxServices: IOTAAboutBoxServices;
  AboutBoxIndex: Integer = 0;

resourcestring
  resPackageName = 'OpenBusiness IOTA Wizards';
  resLicense = 'GNU GENERAL PUBLIC LICENSE';
  resAboutCopyright = 'Copyright OpenBusiness Software.';
  resAboutTitle = 'OpenBusiness IOTA Wizards';
  resAboutDescription = '';

implementation

{$R OpenBusiness.Wizard.Information.res}

procedure RegisterSplashScreen;
begin
  SplashScreenServices.AddPluginBitmap(resPackageName, LoadBitmap(HInstance, 'SPLASHICON'), False, resLicense);
end;

procedure RegisterAboutBox;
begin
  if Supports(BorlandIDEServices,IOTAAboutBoxServices, AboutBoxServices) then
    AboutBoxIndex := AboutBoxServices.AddPluginInfo(resAboutTitle, resAboutCopyright + #13#10#13#10 + resAboutDescription, LoadBitmap(HInstance, 'ABOUTICON'), False, resLicense);
end;

procedure UnregisterAboutBox;
begin
  if (AboutBoxIndex <> 0) and Assigned(AboutBoxServices) then
  begin
    AboutBoxServices.RemovePluginInfo(AboutBoxIndex);
    AboutBoxIndex := 0;
    AboutBoxServices := nil;
  end;
end;

initialization
  RegisterAboutBox;
  RegisterSplashScreen;

finalization
  UnRegisterAboutBox;

end.
