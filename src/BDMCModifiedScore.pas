 unit BDMCModifiedScore;

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
  TfrmBDMCModifiedScore = class(TfrmbyzMCBase)
    vgModifiedScore: TcxDBVerticalGrid;
    vgBDMCModifiedScorePROCESS_TIME: TcxDBEditorRow;
    vgBDMCModifiedScorePROCESS_TIME2: TcxDBEditorRow;
    vgBDMCModifiedScoreCUSER: TcxDBEditorRow;
    vgBDMCModifiedScoreCategoryParameters: TcxCategoryRow;
    vgBDMCModifiedScoreLEVEL_CONSCIOUSNESS: TcxDBEditorRow;
    vgBDMCModifiedScoreACTIVITY: TcxDBEditorRow;
    vgBDMCModifiedScoreRESPIRATORY: TcxDBEditorRow;
    vgBDMCModifiedScoreSPO2: TcxDBEditorRow;
    vgBDMCModifiedScoreBLOOD_PRESSURE: TcxDBEditorRow;
    vgBDMCModifiedScorePULSE: TcxDBEditorRow;
    vgBDMCModifiedScoreCategoryOther: TcxCategoryRow;
    vgBDMCModifiedScoreMAS_SCORE: TcxDBEditorRow;

    procedure FormCreate(Sender: TObject); override;
    procedure btnBaseAddClick(Sender: TObject); override;
    procedure btnBaseSaveClick(Sender: TObject); override;
    procedure btnBaseDeleteClick(Sender: TObject); override;
    procedure vgModifiedScoreEditValueChanged(Sender: TObject;
      ARowProperties: TcxCustomEditorRowProperties);

  private
    { Private declarations }
    lgvOracleDataSet1: TOracleDataSet;
    procedure Scorecalculate;
    procedure SetRepositoryItems;

  public
    { Public declarations }
    procedure ArrangeModifiedScore(pOraDataset: TOracleDataset);
  end;

var
  frmBDMCModifiedScore: TfrmBDMCModifiedScore;

implementation

{$R *.dfm}

procedure TfrmBDMCModifiedScore.FormCreate(Sender: TObject);
begin
  inherited;
  btnBaseClose.Visible := True;
  btnBaseSave.Visible := True;
  btnBasePrint.Visible := True;
  btnBaseDelete.Visible := True;
  vgModifiedScore.Enabled := False;
end;

procedure TfrmBDMCModifiedScore.ArrangeModifiedScore(pOraDataset: TOracleDataset);
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

  vgModifiedScore.Enabled := not OracleDataSet1Det.IsEmpty;
  vgBDMCModifiedScoreMAS_SCORE.Properties.Options.Editing := False;
  SetRepositoryItems;
end;

procedure TfrmBDMCModifiedScore.btnBaseAddClick(Sender: TObject);
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

  // Yeni boþ kayýt açýlýr ama POST edilmez; kullanýcý doldurup Kaydet diyene kadar beklemede kalýr
  OracleDataSet1Det.Insert;
  OracleDataSet1Det.FieldByName('MS_ID').AsInteger := OracleDataSet1.FieldByName('ID').AsInteger;
  OracleDataSet1Det.FieldByName('PROCESS_TIME').AsDateTime := RealNow;
  OracleDataSet1Det.FieldByName('CTIME').AsDateTime := RealNow;
  OracleDataSet1Det.FieldByName('CUSER').AsString := UserName;

  vgModifiedScore.Enabled := True;
  vgModifiedScore.OptionsData.Editing := True;
end;

procedure TfrmBDMCModifiedScore.btnBaseSaveClick(Sender: TObject);
begin
  inherited;
  if OracleDataSet1.State in [dsInsert, dsEdit] then
    OracleDataSet1.Post;
  if OracleDataSet1Det.State in [dsInsert, dsEdit] then
    OracleDataSet1Det.Post;

  // Sadece kullanýcý kaydet butonuna bastýðýnda veritabanýna mühürlenir
  OracleDataSet1Det.Session.Commit;
end;

procedure TfrmBDMCModifiedScore.btnBaseDeleteClick(Sender: TObject);
begin
  inherited;
  if OracleDataSet1Det.IsEmpty or OracleDataSet1Det.ReadOnly then
    Exit;

  if MessageCustom(msgMultiUsed169) then
  begin
    OracleDataSet1Det.Delete;
    OracleDataSet1Det.Session.Commit;

    if OracleDataSet1Det.IsEmpty then
    begin
      vgModifiedScore.Enabled := False;
      vgModifiedScore.OptionsData.Editing := False;
    end;
  end;
end;

procedure TfrmBDMCModifiedScore.SetRepositoryItems;
begin
  vgBDMCModifiedScoreLEVEL_CONSCIOUSNESS.Properties.RepositoryItem :=
    dmMedCard.CreateImgCmbBox('eriLEVEL_CONSCIOUSNESS', 90068, True);

  vgBDMCModifiedScoreACTIVITY.Properties.RepositoryItem :=
    dmMedCard.CreateImgCmbBox('eriACTIVITY', 90069, True);

  vgBDMCModifiedScoreRESPIRATORY.Properties.RepositoryItem :=
    dmMedCard.CreateImgCmbBox('eriRESPIRATORY', 90070, True);

  vgBDMCModifiedScoreSPO2.Properties.RepositoryItem :=
    dmMedCard.CreateImgCmbBox('eriSPO2', 90071, True);

  vgBDMCModifiedScoreBLOOD_PRESSURE.Properties.RepositoryItem :=
    dmMedCard.CreateImgCmbBox('eriBLOOD_PRESSURE', 90072, True);

  vgBDMCModifiedScorePULSE.Properties.RepositoryItem :=
    dmMedCard.CreateImgCmbBox('eriPULSE', 90073, True);
end;

procedure TfrmBDMCModifiedScore.Scorecalculate;
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

  ArrangeWhereSQL(OracleDataSet1Det.FieldByName('LEVEL_CONSCIOUSNESS').AsString);
  ArrangeWhereSQL(OracleDataSet1Det.FieldByName('ACTIVITY').AsString);
  ArrangeWhereSQL(OracleDataSet1Det.FieldByName('RESPIRATORY').AsString);
  ArrangeWhereSQL(OracleDataSet1Det.FieldByName('SPO2').AsString);
  ArrangeWhereSQL(OracleDataSet1Det.FieldByName('BLOOD_PRESSURE').AsString);
  ArrangeWhereSQL(OracleDataSet1Det.FieldByName('PULSE').AsString);

  if lvIds = '' then
  begin
    if OracleDataSet1Det.State = dsBrowse then
      OracleDataSet1Det.Edit;
    OracleDataSet1Det.FieldByName('MAS_SCORE').AsVariant := Null;
    Exit;
  end;

  lvOqGetContVal := GetNewOracleQuery(
    'SELECT NVL(SUM(PD.VALUE), 0) FROM MC_PARAMETERS_DETAIL PD WHERE PD.ID IN (' + lvIds + ')'
  );
  try
    lvOqGetContVal.Execute;

    if OracleDataSet1Det.State = dsBrowse then
      OracleDataSet1Det.Edit;

    OracleDataSet1Det.FieldByName('MAS_SCORE').AsInteger := lvOqGetContVal.FieldAsInteger(0);
  finally
    lvOqGetContVal.Free;
  end;
end;

procedure TfrmBDMCModifiedScore.vgModifiedScoreEditValueChanged(
  Sender: TObject; ARowProperties: TcxCustomEditorRowProperties);
begin
  if OracleDataSet1Det.ReadOnly or OracleDataSet1Det.IsEmpty then
    Exit;
vgModifiedScore.HideEdit;

Scorecalculate;
end;

end.
