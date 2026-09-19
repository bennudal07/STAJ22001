 unit BDMCEdinburghDepScale;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, byzMCBase, cxGraphics, cxLookAndFeels,
  cxLookAndFeelPainters, Vcl.Menus, cxControls, cxContainer, cxEdit, Data.DB,
  OracleData, Vcl.AppEvnts, cxTextEdit, dxGDIPlusClasses, cxImage, Vcl.ExtCtrls,
  cxMemo, cxLabel, cxGroupBox, Vcl.StdCtrls, cxButtons, cxStyles,
  dxScrollbarAnnotations, cxVGrid, cxDBVGrid, cxInplaceContainer,
  DtMdGeneral, DtMdMedCard, CommonConf, Oracle, cxImageComboBox, msgConst,
  cxCalendar, cxTimeEdit;

type
  TfrmBDMCEdinburghDepScale = class(TfrmbyzMCBase)
    vgBDEdinburghDepScale: TcxDBVerticalGrid;
    vgBDEdinburghDepScalePROCESS_TIME: TcxDBEditorRow;
    vgBDEdinburghDepScalePROCESS_TIME2: TcxDBEditorRow;
    vgBDEdinburghDepScaleCUSER: TcxDBEditorRow;
    vgBDEdinburghDepScaleDATE_BIRTH: TcxDBEditorRow;
    vgBDEdinburghDepScaleCategoryScoreTitle: TcxCategoryRow;
    vgBDEdinburghDepScaleLAUGH_FUNNY_THINGS: TcxDBEditorRow;
    vgBDEdinburghDepScaleLOOK_FUTURE_HOPEFULLY: TcxDBEditorRow;
    vgBDEdinburghDepScaleBAD_THINGS_BLAME_HERSELF: TcxDBEditorRow;
    vgBDEdinburghDepScaleFEEL_DISTRESSED_ANXIOUS: TcxDBEditorRow;
    vgBDEdinburghDepScaleFEEL_FEAR_PANIC: TcxDBEditorRow;
    vgBDEdinburghDepScaleEVERYTHING_GETTING_HARDER: TcxDBEditorRow;
    vgBDEdinburghDepScaleFEEL_SAD_HARD_SLEEP: TcxDBEditorRow;
    vgBDEdinburghDepScaleFEEL_SAD_DEPRESSED: TcxDBEditorRow;
    vgBDEdinburghDepScaleFEEL_SAD_CRY: TcxDBEditorRow;
    vgBDEdinburghDepScaleTHINK_HURT_MYSELF: TcxDBEditorRow;
    vgBDEdinburghDepScaleFEEL_SAD_WANT_CRY: TcxDBEditorRow;
    vgBDEdinburghDepScaleCategoryOTHER: TcxCategoryRow;
    vgBDEdinburghDepScaleEDINBURGH_SCORE: TcxDBEditorRow;
    vgBDEdinburghDepScaleNOTE: TcxDBEditorRow;
    pnlBottom: TPanel;

    procedure FormCreate(Sender: TObject); override;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnBaseAddClick(Sender: TObject); override;
    procedure btnBaseSaveClick(Sender: TObject); override;
    procedure btnBaseDeleteClick(Sender: TObject); override;
    procedure vgBDEdinburghDepScaleEditValueChanged(Sender: TObject;
      ARowProperties: TcxCustomEditorRowProperties);

  private
    { Private declarations }
    lgvOracleDataSet1: TOracleDataSet;
    procedure Scorecalculate;
    procedure SetRepositoryItems;

  public
    { Public declarations }
    procedure ArrangeEdinburghDepScaleForm(pOraDataset: TOracleDataset);
  end;

var
  frmBDMCEdinburghDepScale: TfrmBDMCEdinburghDepScale;

implementation
  uses PatientList;
{$R *.dfm}

{ TfrmBDMCEdinburghDepScale }

procedure TfrmBDMCEdinburghDepScale.FormCreate(Sender: TObject);
begin
  inherited;
  btnBaseClose.Visible := True;
  btnBaseSave.Visible := True;
  btnBasePrint.Visible := True;
  btnBaseDelete.Visible := True;
  vgBDEdinburghDepScale.Enabled := False;

  vgBDEdinburghDepScaleNOTE.Properties.Options.Editing := True;
  vgBDEdinburghDepScaleEDINBURGH_SCORE.Properties.Options.Editing := False;
end;

procedure TfrmBDMCEdinburghDepScale.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if OracleDataSet1Det.State in [dsEdit, dsInsert] then
    OracleDataSet1Det.Cancel;
  if OracleDataSet1.State in [dsEdit, dsInsert] then
    OracleDataSet1.Cancel;
  inherited;
end;

procedure TfrmBDMCEdinburghDepScale.ArrangeEdinburghDepScaleForm(pOraDataset: TOracleDataset);
begin
  if pOraDataset = nil then
  begin
    OracleDataSet1Det.ReadOnly := False;
    OracleDataSet1.Close;
    OracleDataSet1.SetVariable('COM_ID', FBPatientInfo.BConOfMedId);
    OracleDataSet1.Open;

    if OracleDataSet1.IsEmpty then
    begin
      OracleDataSet1.Insert;
      OracleDataSet1.FieldByName('COM_ID').AsInteger := FBPatientInfo.BConOfMedId;
      OracleDataSet1.Post;
      OracleDataSet1.Session.Commit;
    end;
  end
  else
  begin
    BorderStyle := bsNone;
    Align := alClient;
    BorderWidth := 10;
    lgvFrmOpenFromMedCard := True;

    gbBaseTop.Visible := False;
    pnlBaseBottom.Visible := False;
    OracleDataSet1Det.ReadOnly := False;

    lgvOracleDataSet1 := pOraDataset;
    OracleDataSet1Det.Master := lgvOracleDataSet1;
  end;

  if OracleDataSet1Det.SQL.Text <> '' then
  begin
    OracleDataSet1Det.Close;
    OracleDataSet1Det.Open;
  end;

  vgBDEdinburghDepScale.Enabled := not OracleDataSet1Det.IsEmpty;
  vgBDEdinburghDepScaleEDINBURGH_SCORE.Properties.Options.Editing := False;
  vgBDEdinburghDepScaleNOTE.Properties.Options.Editing := True;
  SetRepositoryItems;
end;

procedure TfrmBDMCEdinburghDepScale.btnBaseAddClick(Sender: TObject);
begin
  inherited;
  if (lgvOracleDataSet1 <> nil) then
    Exit;

  if OracleDataSet1.IsEmpty then
  begin
    OracleDataSet1.Insert;
    OracleDataSet1.FieldByName('COM_ID').AsInteger := FBPatientInfo.BConOfMedId;
    OracleDataSet1.Post;
    OracleDataSet1.Session.Commit;
  end;

  if OracleDataSet1Det.ReadOnly then
    OracleDataSet1Det.ReadOnly := False;

  OracleDataSet1Det.Insert;
  OracleDataSet1Det.FieldByName('EDS_ID').AsInteger := OracleDataSet1.FieldByName('ID').AsInteger;
  OracleDataSet1Det.FieldByName('PROCESS_TIME').AsDateTime := RealNow;
  OracleDataSet1Det.FieldByName('CTIME').AsDateTime := RealNow;
  OracleDataSet1Det.FieldByName('CUSER').AsString := UserName;
  OracleDataSet1Det.FieldByName('NURSE_ID').AsInteger := UserId;

  vgBDEdinburghDepScale.Enabled := True;
  vgBDEdinburghDepScale.OptionsData.Editing := True;
  vgBDEdinburghDepScaleNOTE.Properties.Options.Editing := True;
end;

procedure TfrmBDMCEdinburghDepScale.btnBaseSaveClick(Sender: TObject);
begin
  inherited;
  if OracleDataSet1.State in [dsInsert, dsEdit] then
    OracleDataSet1.Post;
  if OracleDataSet1Det.State in [dsInsert, dsEdit] then
    OracleDataSet1Det.Post;

  OracleDataSet1Det.Session.Commit;
end;

procedure TfrmBDMCEdinburghDepScale.btnBaseDeleteClick(Sender: TObject);
begin
  // Sadece kullanýcý bizzat Sil butonuna bastýðýnda çalýþmasýný garantiye al
  if (Sender <> btnBaseDelete) then
    Exit;

  if (lgvOracleDataSet1 <> nil) then
    Exit;

  if OracleDataSet1Det.IsEmpty or OracleDataSet1Det.ReadOnly then
    Exit;

  if MessageCustom(msgMultiUsed169) then
  begin
    OracleDataSet1Det.Delete;
    OracleDataSet1Det.Session.Commit;

    if OracleDataSet1Det.IsEmpty then
    begin
      vgBDEdinburghDepScale.Enabled := False;
      vgBDEdinburghDepScale.OptionsData.Editing := False;
    end;
  end;
end;

procedure TfrmBDMCEdinburghDepScale.SetRepositoryItems;
begin
  vgBDEdinburghDepScaleLAUGH_FUNNY_THINGS.Properties.RepositoryItem :=
    dmMedCard.CreateImgCmbBox('eriLAUGH_FUNNY_THINGS_BDMCEdinburgh', 90098, True);

  vgBDEdinburghDepScaleLOOK_FUTURE_HOPEFULLY.Properties.RepositoryItem :=
    dmMedCard.CreateImgCmbBox('eriLOOK_FUTURE_HOPEFULLY_BDMCEdinburgh', 90099, True);

  vgBDEdinburghDepScaleBAD_THINGS_BLAME_HERSELF.Properties.RepositoryItem :=
    dmMedCard.CreateImgCmbBox('eriBAD_THINGS_BLAME_HERSELF_BDMCEdinburgh', 90100, True);

  vgBDEdinburghDepScaleFEEL_DISTRESSED_ANXIOUS.Properties.RepositoryItem :=
    dmMedCard.CreateImgCmbBox('eriFEEL_DISTRESSED_ANXIOUS_BDMCEdinburgh', 90101, True);

  vgBDEdinburghDepScaleFEEL_FEAR_PANIC.Properties.RepositoryItem :=
    dmMedCard.CreateImgCmbBox('eriFEEL_FEAR_PANIC_BDMCEdinburgh', 90102, True);

  vgBDEdinburghDepScaleEVERYTHING_GETTING_HARDER.Properties.RepositoryItem :=
    dmMedCard.CreateImgCmbBox('eriEVERYTHING_GETTING_HARDER_BDMCEdinburgh', 90103, True);

  vgBDEdinburghDepScaleFEEL_SAD_HARD_SLEEP.Properties.RepositoryItem :=
    dmMedCard.CreateImgCmbBox('eriFEEL_SAD_HARD_SLEEP_BDMCEdinburgh', 90104, True);

  vgBDEdinburghDepScaleFEEL_SAD_DEPRESSED.Properties.RepositoryItem :=
    dmMedCard.CreateImgCmbBox('eriFEEL_SAD_DEPRESSED_BDMCEdinburgh', 90105, True);

  vgBDEdinburghDepScaleFEEL_SAD_CRY.Properties.RepositoryItem :=
    dmMedCard.CreateImgCmbBox('eriFEEL_SAD_CRY_BDMCEdinburgh', 90106, True);

  vgBDEdinburghDepScaleTHINK_HURT_MYSELF.Properties.RepositoryItem :=
    dmMedCard.CreateImgCmbBox('eriTHINK_HURT_MYSELF_BDMCEdinburgh', 90107, True);

  vgBDEdinburghDepScaleFEEL_SAD_WANT_CRY.Properties.RepositoryItem :=
    dmMedCard.CreateImgCmbBox('eriFEEL_SAD_WANT_CRY_BDMCEdinburgh', 90108, True);
end;

procedure TfrmBDMCEdinburghDepScale.Scorecalculate;
var
  lvOqGetContVal: TOracleQuery;
  lvIds: String;

  procedure ArrangeWhereSQL(pVal: String);
  begin
    pVal := Trim(pVal);
    if (pVal = '') or (pVal = '0') then
      Exit;
    if lvIds = '' then
      lvIds := pVal
    else
      lvIds := lvIds + ',' + pVal;
  end;
begin
  lvIds := '';

  ArrangeWhereSQL(OracleDataSet1Det.FieldByName('LAUGH_FUNNY_THINGS').AsString);
  ArrangeWhereSQL(OracleDataSet1Det.FieldByName('LOOK_FUTURE_HOPEFULLY').AsString);
  ArrangeWhereSQL(OracleDataSet1Det.FieldByName('BAD_THINGS_BLAME_HERSELF').AsString);
  ArrangeWhereSQL(OracleDataSet1Det.FieldByName('FEEL_DISTRESSED_ANXIOUS').AsString);
  ArrangeWhereSQL(OracleDataSet1Det.FieldByName('FEEL_FEAR_PANIC').AsString);
  ArrangeWhereSQL(OracleDataSet1Det.FieldByName('EVERYTHING_GETTING_HARDER').AsString);
  ArrangeWhereSQL(OracleDataSet1Det.FieldByName('FEEL_SAD_HARD_SLEEP').AsString);
  ArrangeWhereSQL(OracleDataSet1Det.FieldByName('FEEL_SAD_DEPRESSED').AsString);
  ArrangeWhereSQL(OracleDataSet1Det.FieldByName('FEEL_SAD_CRY').AsString);
  ArrangeWhereSQL(OracleDataSet1Det.FieldByName('THINK_HURT_MYSELF').AsString);
  ArrangeWhereSQL(OracleDataSet1Det.FieldByName('FEEL_SAD_WANT_CRY').AsString);

  if lvIds = '' then
  begin
    if OracleDataSet1Det.State = dsBrowse then
      OracleDataSet1Det.Edit;
    OracleDataSet1Det.FieldByName('EDINBURGH_SCORE').AsVariant := Null;
    vgBDEdinburghDepScale.Invalidate;
    Exit;
  end;

  lvOqGetContVal := GetNewOracleQuery(
    'SELECT NVL(SUM(NVL(PD.VALUE, 0)), 0) FROM MC_PARAMETERS_DETAIL PD WHERE PD.ID IN (' + lvIds + ')'
  );
  try
    lvOqGetContVal.Execute;

    if OracleDataSet1Det.State = dsBrowse then
      OracleDataSet1Det.Edit;

    OracleDataSet1Det.FieldByName('EDINBURGH_SCORE').AsInteger := lvOqGetContVal.FieldAsInteger(0);
    vgBDEdinburghDepScale.Invalidate;
  finally
    lvOqGetContVal.Free;
  end;
end;

procedure TfrmBDMCEdinburghDepScale.vgBDEdinburghDepScaleEditValueChanged(
  Sender: TObject; ARowProperties: TcxCustomEditorRowProperties);
begin
  if OracleDataSet1Det.ReadOnly or OracleDataSet1Det.IsEmpty then
    Exit;

  // Not alanýna metin yazýlýrken skor hesaplanmasýn
  if (ARowProperties <> nil) and (ARowProperties.Row = vgBDEdinburghDepScaleNOTE) then
    Exit;

  vgBDEdinburghDepScale.HideEdit;
  Scorecalculate;
end;

initialization
  RegisterClass(TLabel);

end.
