unit OpenBusiness.Wizards.Forms;

interface

uses
  Forms, Classes, Controls, Graphics, Buttons,
  ExtCtrls, StdCtrls;

type
  TVisibleButton = (vbOk, vbYes, vbYesToAll, vbNo, vbIgnore, vbCancel,
    vbClose, vbHelp);
  TDisabledButton = (dbOk, dbYes, dbYesToAll, dbNo, dbIgnore, dbCancel,
    dbClose, dbHelp);
  TSelectedButton = (sbNone, sbOk, sbYes, sbYesToAll, sbNo, sbIgnore, sbCancel,
    sbClose, sbHelp);

  TVisibleButtons = set of TVisibleButton;
  TDisabledButtons = set of TDisabledButton;

  TButtonsPanel = class(TPersistent)
  private
    FPANEButtons: TPanel;
    FBBTNOK: TBitBtn;
    FBBTNCancel: TBitBtn;
    FVisibleButtons: TVisibleButtons;
    FDisabledButtons: TDisabledButtons;
    FBBTNYes: TBitBtn;
    FBBTNYesToAll: TBitBtn;
    FBBTNNo: TBitBtn;
    FBBTNIgnore: TBitBtn;
    FBBTNClose: TBitBtn;
    FBBTNHelp: TBitBtn;
    FSelectedButton: TSelectedButton;
    function GetVisible: Boolean;
    procedure SetVisible(const aValue: Boolean);
    procedure SetDisabledButtons(const Value: TDisabledButtons);
    procedure SetVisibleButtons(const Value: TVisibleButtons);
    procedure SetSelectedButton(const Value: TSelectedButton);
    procedure SetParent(const Value: TWinControl);
    function GetParent: TWinControl;
  public
    constructor Create;
    destructor Destroy; override;
    property Parent: TWinControl read GetParent write SetParent;
  published
    property Visible: Boolean read GetVisible write SetVisible default False;
    property VisibleButtons: TVisibleButtons read FVisibleButtons
      write SetVisibleButtons default [vbOk];
    property DisabledButtons: TDisabledButtons read FDisabledButtons
      write SetDisabledButtons default [];
    property SelectedButton: TSelectedButton read FSelectedButton
      write SetSelectedButton default sbOk;
  end;

  TOpenBusinessForm = class(TForm)
  private
    FButtonsPanel: TButtonsPanel;
    function GetOnCancelButtonClick: TNotifyEvent;
    function GetOnCloseButtonClick: TNotifyEvent;
    function GetOnHelpButtonClick: TNotifyEvent;
    function GetOnIgnoreButtonClick: TNotifyEvent;
    function GetOnNoButtonClick: TNotifyEvent;
    function GetOnOkButtonClick: TNotifyEvent;
    function GetOnYesButtonClick: TNotifyEvent;
    function GetOnYesToAllButtonClick: TNotifyEvent;
    procedure SetOnCancelButtonClick(const Value: TNotifyEvent);
    procedure SetOnCloseButtonClick(const Value: TNotifyEvent);
    procedure SetOnHelpButtonClick(const Value: TNotifyEvent);
    procedure SetOnIgnoreButtonClick(const Value: TNotifyEvent);
    procedure SetOnNoButtonClick(const Value: TNotifyEvent);
    procedure SetOnOkButtonClick(const Value: TNotifyEvent);
    procedure SetOnYesButtonClick(const Value: TNotifyEvent);
    procedure SetOnYesToAllButtonClick(const Value: TNotifyEvent);
  protected
    procedure DoClose(var Action: TCloseAction); override;
    procedure DoShow; override;
  public
    constructor Create(aOwner: TComponent); override;
    destructor Destroy; override;
  published
    property ButtonsPanel: TButtonsPanel read FButtonsPanel write FButtonsPanel;
    property OnOkButtonClick: TNotifyEvent read GetOnOkButtonClick
      write SetOnOkButtonClick;
    property OnCancelButtonClick: TNotifyEvent read GetOnCancelButtonClick
      write SetOnCancelButtonClick;
    property OnYesButtonClick: TNotifyEvent read GetOnYesButtonClick
      write SetOnYesButtonClick;
    property OnYesToAllButtonClick: TNotifyEvent read GetOnYesToAllButtonClick
      write SetOnYesToAllButtonClick;
    property OnNoButtonClick: TNotifyEvent read GetOnNoButtonClick
      write SetOnNoButtonClick;
    property OnIgnoreButtonClick: TNotifyEvent read GetOnIgnoreButtonClick
      write SetOnIgnoreButtonClick;
    property OnCloseButtonClick: TNotifyEvent read GetOnCloseButtonClick
      write SetOnCloseButtonClick;
    property OnHelpButtonClick: TNotifyEvent read GetOnHelpButtonClick
      write SetOnHelpButtonClick;
  end;
  TOpenBusinessFormClass = class of TOpenBusinessForm;

implementation

constructor TButtonsPanel.Create;
begin
  FSelectedButton := sbOk;
  FVisibleButtons := [vbOk];
  FPANEButtons := TPanel.Create(nil);
  FPANEButtons.Height := 39;
  FPANEButtons.Parent := nil;
  FPANEButtons.Align := alBottom;
  FPANEButtons.Visible := False;
  FPANEButtons.BevelEdges := [beTop, beBottom];
  FPANEButtons.Color := clInfoBk;
  FPANEButtons.ParentBackground := False;
  FBBTNOK := TBitBtn.Create(nil);
  FBBTNOK.Parent := FPANEButtons;
  FBBTNOK.Align := alRight;
  FBBTNOK.Margins.Right := 6;
  FBBTNOK.Margins.Top := 6;
  FBBTNOK.Margins.Bottom := 6;
  FBBTNOK.Margins.Left := 0;
  FBBTNOK.AlignWithMargins := True;
  FBBTNOK.Caption := 'OK';
  FBBTNOK.Left := 0;
  FBBTNYes := TBitBtn.Create(nil);
  FBBTNYes.Parent := FPANEButtons;
  FBBTNYes.Align := alRight;
  FBBTNYes.Margins.Right := 6;
  FBBTNYes.Margins.Top := 6;
  FBBTNYes.Margins.Bottom := 6;
  FBBTNYes.Margins.Left := 0;
  FBBTNYes.AlignWithMargins := True;
  FBBTNYes.Caption := 'Sim';
  FBBTNYes.Hide;
  FBBTNYes.Left := 0;
  FBBTNYesToAll := TBitBtn.Create(nil);
  FBBTNYesToAll.Parent := FPANEButtons;
  FBBTNYesToAll.Align := alRight;
  FBBTNYesToAll.Margins.Right := 6;
  FBBTNYesToAll.Margins.Top := 6;
  FBBTNYesToAll.Margins.Bottom := 6;
  FBBTNYesToAll.Margins.Left := 0;
  FBBTNYesToAll.AlignWithMargins := True;
  FBBTNYesToAll.Caption := 'Sim para tudo';
  FBBTNYesToAll.Hide;
  FBBTNYesToAll.Left := 0;
  FBBTNNo := TBitBtn.Create(nil);
  FBBTNNo.Parent := FPANEButtons;
  FBBTNNo.Align := alRight;
  FBBTNNo.Margins.Right := 6;
  FBBTNNo.Margins.Top := 6;
  FBBTNNo.Margins.Bottom := 6;
  FBBTNNo.Margins.Left := 0;
  FBBTNNo.AlignWithMargins := True;
  FBBTNNo.Caption := 'Não';
  FBBTNNo.Hide;
  FBBTNNo.Left := 0;
  FBBTNIgnore := TBitBtn.Create(nil);
  FBBTNIgnore.Parent := FPANEButtons;
  FBBTNIgnore.Align := alRight;
  FBBTNIgnore.Margins.Right := 6;
  FBBTNIgnore.Margins.Top := 6;
  FBBTNIgnore.Margins.Bottom := 6;
  FBBTNIgnore.Margins.Left := 0;
  FBBTNIgnore.AlignWithMargins := True;
  FBBTNIgnore.Caption := 'Ignorar';
  FBBTNIgnore.Hide;
  FBBTNIgnore.Left := 0;
  FBBTNCancel := TBitBtn.Create(nil);
  FBBTNCancel.Parent := FPANEButtons;
  FBBTNCancel.Align := alRight;
  FBBTNCancel.Margins.Right := 6;
  FBBTNCancel.Margins.Top := 6;
  FBBTNCancel.Margins.Bottom := 6;
  FBBTNCancel.Margins.Left := 0;
  FBBTNCancel.AlignWithMargins := True;
  FBBTNCancel.Caption := 'Cancelar';
  FBBTNCancel.Hide;
  FBBTNCancel.Left := 0;
  FBBTNClose := TBitBtn.Create(nil);
  FBBTNClose.Parent := FPANEButtons;
  FBBTNClose.Align := alRight;
  FBBTNClose.Margins.Right := 6;
  FBBTNClose.Margins.Top := 6;
  FBBTNClose.Margins.Bottom := 6;
  FBBTNClose.Margins.Left := 0;
  FBBTNClose.AlignWithMargins := True;
  FBBTNClose.Caption := 'Fechar';
  FBBTNClose.Hide;
  FBBTNClose.Left := 0;
  FBBTNHelp := TBitBtn.Create(nil);
  FBBTNHelp.Parent := FPANEButtons;
  FBBTNHelp.Align := alRight;
  FBBTNHelp.Margins.Right := 6;
  FBBTNHelp.Margins.Top := 6;
  FBBTNHelp.Margins.Bottom := 6;
  FBBTNHelp.Margins.Left := 0;
  FBBTNHelp.AlignWithMargins := True;
  FBBTNHelp.Caption := 'Ajuda';
  FBBTNHelp.Hide;
  FBBTNHelp.Left := 0;
end;

destructor TButtonsPanel.Destroy;
begin
  FBBTNHelp.Free;
  FBBTNClose.Free;
  FBBTNIgnore.Free;
  FBBTNNo.Free;
  FBBTNYesToAll.Free;
  FBBTNYes.Free;
  FBBTNCancel.Free;
  FBBTNOK.Free;
  FPANEButtons.Free;
  inherited;
end;

function TButtonsPanel.GetParent: TWinControl;
begin
  Result := FPANEButtons.Parent;
end;

function TButtonsPanel.GetVisible: Boolean;
begin
  Result := FPANEButtons.Visible;
end;

procedure TButtonsPanel.SetDisabledButtons(const Value: TDisabledButtons);
begin
  FDisabledButtons := Value;
  FBBTNOK.Enabled := not(dbOk in FDisabledButtons);
  FBBTNYes.Enabled := not(dbYes in FDisabledButtons);
  FBBTNYesToAll.Enabled := not(dbYesToAll in FDisabledButtons);
  FBBTNNo.Enabled := not(dbNo in FDisabledButtons);
  FBBTNIgnore.Enabled := not(dbIgnore in FDisabledButtons);
  FBBTNCancel.Enabled := not(dbCancel in FDisabledButtons);
  FBBTNClose.Enabled := not(dbClose in FDisabledButtons);
  FBBTNHelp.Enabled := not(dbHelp in FDisabledButtons);
end;

procedure TButtonsPanel.SetParent(const Value: TWinControl);
begin
  FPANEButtons.Parent := Value;
end;

procedure TButtonsPanel.SetSelectedButton(const Value: TSelectedButton);
begin
  FSelectedButton := Value;
  if (not Assigned(FPANEButtons.Parent)) or
    (csDesigning in FPANEButtons.Parent.ComponentState) then
    Exit;
  case FSelectedButton of
    sbOk:
      if FBBTNOK.Enabled and FBBTNOK.Showing then
        FBBTNOK.SetFocus;
    sbYes:
      if FBBTNYes.Enabled and FBBTNYes.Showing then
        FBBTNYes.SetFocus;
    sbYesToAll:
      if FBBTNYesToAll.Enabled and FBBTNYesToAll.Showing then
        FBBTNYesToAll.SetFocus;
    sbNo:
      if FBBTNNo.Enabled and FBBTNNo.Showing then
        FBBTNNo.SetFocus;
    sbIgnore:
      if FBBTNIgnore.Enabled and FBBTNIgnore.Showing then
        FBBTNIgnore.SetFocus;
    sbCancel:
      if FBBTNCancel.Enabled and FBBTNCancel.Showing then
        FBBTNCancel.SetFocus;
    sbClose:
      if FBBTNClose.Enabled and FBBTNClose.Showing then
        FBBTNClose.SetFocus;
    sbHelp:
      if FBBTNHelp.Enabled and FBBTNHelp.Showing then
        FBBTNHelp.SetFocus;
  end;
end;

procedure TButtonsPanel.SetVisible(const aValue: Boolean);
begin
  FPANEButtons.Visible := aValue;
end;

procedure TButtonsPanel.SetVisibleButtons(const Value: TVisibleButtons);
begin
  FVisibleButtons := Value;
  FBBTNOK.Visible := False;
  FBBTNYes.Visible := False;
  FBBTNYesToAll.Visible := False;
  FBBTNNo.Visible := False;
  FBBTNIgnore.Visible := False;
  FBBTNCancel.Visible := False;
  FBBTNClose.Visible := False;
  FBBTNHelp.Visible := False;
  FBBTNHelp.Visible := vbHelp in FVisibleButtons;
  FBBTNClose.Visible := vbClose in FVisibleButtons;
  FBBTNCancel.Visible := vbCancel in FVisibleButtons;
  FBBTNIgnore.Visible := vbIgnore in FVisibleButtons;
  FBBTNNo.Visible := vbNo in FVisibleButtons;
  FBBTNYesToAll.Visible := vbYesToAll in FVisibleButtons;
  FBBTNYes.Visible := vbYes in FVisibleButtons;
  FBBTNOK.Visible := vbOk in FVisibleButtons;
end;

constructor TOpenBusinessForm.Create(aOwner: TComponent);
begin
  FButtonsPanel := TButtonsPanel.Create;
  inherited;
  FButtonsPanel.Parent := Self;
end;

destructor TOpenBusinessForm.Destroy;
begin
  FButtonsPanel.Free;
  inherited;
end;

procedure TOpenBusinessForm.DoClose(var Action: TCloseAction);
begin
  inherited;
  { Se o meu dono é um descendente de TZOOWDataModule e se este form foi criado
    automaticamente por ele, então devemos destruir nosso datamodule }
  {
    if Assigned(Owner) and Owner.InheritsFrom(TZOOWDataModule) and Self.ClassNameIs(TZOOWDataModule(Owner).MyFormClass) then
    begin
    if (fsModal in FormState) then
    TZOOWDataModule(Owner).DestroyMe(500)
    else
    TZOOWDataModule(Owner).DestroyMe;
    end;
  }
end;

procedure TOpenBusinessForm.DoShow;
begin
  inherited;
  FButtonsPanel.SetSelectedButton(FButtonsPanel.FSelectedButton);
end;

function TOpenBusinessForm.GetOnCancelButtonClick: TNotifyEvent;
begin
  Result := FButtonsPanel.FBBTNCancel.OnClick;
end;

function TOpenBusinessForm.GetOnCloseButtonClick: TNotifyEvent;
begin
  Result := FButtonsPanel.FBBTNClose.OnClick;
end;

function TOpenBusinessForm.GetOnHelpButtonClick: TNotifyEvent;
begin
  Result := FButtonsPanel.FBBTNHelp.OnClick;
end;

function TOpenBusinessForm.GetOnIgnoreButtonClick: TNotifyEvent;
begin
  Result := FButtonsPanel.FBBTNIgnore.OnClick;
end;

function TOpenBusinessForm.GetOnNoButtonClick: TNotifyEvent;
begin
  Result := FButtonsPanel.FBBTNNo.OnClick;
end;

function TOpenBusinessForm.GetOnOkButtonClick: TNotifyEvent;
begin
  Result := FButtonsPanel.FBBTNOK.OnClick;
end;

function TOpenBusinessForm.GetOnYesButtonClick: TNotifyEvent;
begin
  Result := FButtonsPanel.FBBTNYes.OnClick;
end;

function TOpenBusinessForm.GetOnYesToAllButtonClick: TNotifyEvent;
begin
  Result := FButtonsPanel.FBBTNYesToAll.OnClick;
end;

procedure TOpenBusinessForm.SetOnCancelButtonClick(const Value: TNotifyEvent);
begin
  FButtonsPanel.FBBTNCancel.OnClick := Value;
end;

procedure TOpenBusinessForm.SetOnCloseButtonClick(const Value: TNotifyEvent);
begin
  FButtonsPanel.FBBTNClose.OnClick := Value;
end;

procedure TOpenBusinessForm.SetOnHelpButtonClick(const Value: TNotifyEvent);
begin
  FButtonsPanel.FBBTNHelp.OnClick := Value;
end;

procedure TOpenBusinessForm.SetOnIgnoreButtonClick(const Value: TNotifyEvent);
begin
  FButtonsPanel.FBBTNIgnore.OnClick := Value;
end;

procedure TOpenBusinessForm.SetOnNoButtonClick(const Value: TNotifyEvent);
begin
  FButtonsPanel.FBBTNNo.OnClick := Value;
end;

procedure TOpenBusinessForm.SetOnOkButtonClick(const Value: TNotifyEvent);
begin
  FButtonsPanel.FBBTNOK.OnClick := Value;
end;

procedure TOpenBusinessForm.SetOnYesButtonClick(const Value: TNotifyEvent);
begin
  FButtonsPanel.FBBTNYes.OnClick := Value;
end;

procedure TOpenBusinessForm.SetOnYesToAllButtonClick(const Value: TNotifyEvent);
begin
  FButtonsPanel.FBBTNYesToAll.OnClick := Value;
end;

end.
