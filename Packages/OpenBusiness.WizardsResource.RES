        ��  ��                  �   <   ��
 W I Z _ E M P T Y _ F O R M         0         object <FORM_IDENT>: T<ANCESTOR_ID>
  Left = 0
  Top = 0
  Caption = '<FORM_IDENT>'
  ClientHeight = 480
  ClientWidth = 640
  FormFactor.Width = 320
  FormFactor.Height = 480
  FormFactor.Devices = [Desktop]
  DesignerMasterStyle = 0
end�  H   ��
 W I Z _ E M P T Y _ F O R M _ S O U R C E       0         unit <UNITNAME>;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, <DEFINITIONUNIT>;

type
  T<CLASS_ID> = class(T<ANCESTOR_ID>)
  private
    { Private declarations }
  public
    { Public declarations }
  end;
  T<ANCESTOR_ID>Class = class of T<CLASS_ID>;

var
  <CLASS_ID>: T<CLASS_ID>;

implementation

{$R *.fmx}

end.   