unit BDMCTollnerSepsis;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, byzMCBase, cxGraphics, cxLookAndFeels,
  cxLookAndFeelPainters, Vcl.Menus, cxControls, cxContainer, cxEdit, Data.DB,
  OracleData, Vcl.AppEvnts, cxTextEdit, dxGDIPlusClasses, cxImage, Vcl.ExtCtrls,
  cxMemo, cxLabel, cxGroupBox, Vcl.StdCtrls, cxButtons, cxStyles,
  dxScrollbarAnnotations, cxVGrid, cxDBVGrid, cxInplaceContainer, cxRadioGroup,
  cxClasses, DtMdGeneral, DtMdMedCard, CommonConf, Oracle, byzTheBezier, msgConst,
  cxCalendar;

type
  TfrmBDMCTollnerSepsis = class(TfrmbyzMCBase)
    vgTollnerSepsis: TcxDBVerticalGrid;
    vgTollnerSepsisDBMultiEditorRow1: TcxDBMultiEditorRow;
    vgTollnerSepsisDBEditorRow1: TcxDBEditorRow;
    vgTollnerSepsisCategoryRow1: TcxCategoryRow;
    vgTollnerSepsisDBEditorRow2: TcxDBEditorRow;
    vgTollnerSepsisDBEditorRow3: TcxDBEditorRow;
    vgTollnerSepsisDBEditorRow4: TcxDBEditorRow;
    vgTollnerSepsisDBEditorRow5: TcxDBEditorRow;
    vgTollnerSepsisDBEditorRow6: TcxDBEditorRow;
    vgTollnerSepsisDBEditorRow7: TcxDBEditorRow;
    vgTollnerSepsisDBEditorRow8: TcxDBEditorRow;
    vgTollnerSepsisDBEditorRow9: TcxDBEditorRow;
    vgTollnerSepsisDBEditorRow10: TcxDBEditorRow;
    vgTollnerSepsisDBEditorRow11: TcxDBEditorRow;
    vgTollnerSepsisDBEditorRow12: TcxDBEditorRow;
    vgTollnerSepsisDBEditorRow13: TcxDBEditorRow;
    vgTollnerSepsisCategoryRow2: TcxCategoryRow;
    vgTollnerSepsisDBEditorRow14: TcxDBEditorRow;
    vgTollnerSepsisDBEditorRow15: TcxDBEditorRow;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    procedure FormCreate(Sender: TObject); override;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnBaseAddClick(Sender: TObject); override;
    procedure btnBaseSaveClick(Sender: TObject); override;
    procedure btnBaseDeleteClick(Sender: TObject); override;
    procedure vgTollnerSepsisEditValueChanged(Sender: TObject;
      ARowProperties: TcxCustomEditorRowProperties);
  private
    { Private declarations }
    lgvOracleDataSet1: TOracleDataSet;
  public
    { Public declarations }
    procedure ArrangeTollnerSepsis(pOraDataset: TOracleDataset);
  end;

var
  frmBDMCTollnerSepsis: TfrmBDMCTollnerSepsis;

implementation

{$R *.dfm}

procedure TfrmBDMCTollnerSepsis.FormCreate(Sender: TObject);
begin
  inherited;
  btnBaseClose.Visible := True;
  btnBaseSave.Visible := True;
  btnBasePrint.Visible := True;
  btnBaseDelete.Visible := True;
  vgTollnerSepsis.Enabled := False;
end;

procedure TfrmBDMCTollnerSepsis.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  // Kaydetmeden çýkýlýrsa bekleyen tüm Insert/Edit iþlemlerini geri alýr
  if OracleDataSet1Det.State in [dsEdit, dsInsert] then
    OracleDataSet1Det.Cancel;
  if OracleDataSet1.State in [dsEdit, dsInsert] then
    OracleDataSet1.Cancel;
  inherited;
end;

procedure TfrmBDMCTollnerSepsis.ArrangeTollnerSepsis(pOraDataset: TOracleDataset);
begin
  if pOraDataset = nil then
  begin
    OracleDataSet1Det.ReadOnly := False;
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
  vgTollnerSepsis.Enabled := not OracleDataSet1Det.IsEmpty;
end;

procedure TfrmBDMCTollnerSepsis.btnBaseAddClick(Sender: TObject);
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
  OracleDataSet1Det.FieldByName('MTS_ID').AsInteger := OracleDataSet1.FieldByName('ID').AsInteger;
  OracleDataSet1Det.FieldByName('PROCESS_TIME').AsDateTime := Now;
  OracleDataSet1Det.FieldByName('CTIME').AsDateTime := RealNow;
  OracleDataSet1Det.FieldByName('CUSER').AsString := UserName;
  OracleDataSet1Det.FieldByName('NURSE_ID').AsInteger := UserId;
  OracleDataSet1Det.FieldByName('SEPSIS_SCORE').AsInteger := 0;
  OracleDataSet1Det.FieldByName('SEPSIS_STATUS').AsString := 'SEPSIS YOK';
  // Post kaldýrýldý: Kayýt arayüzde düzenleme modunda bekleyecek

  vgTollnerSepsis.Enabled := True;
  vgTollnerSepsis.OptionsData.Editing := True;
end;

procedure TfrmBDMCTollnerSepsis.btnBaseSaveClick(Sender: TObject);
begin
  inherited;
  if OracleDataSet1.State in [dsInsert, dsEdit] then
    OracleDataSet1.Post;
  if OracleDataSet1Det.State in [dsInsert, dsEdit] then
    OracleDataSet1Det.Post;

  OracleDataSet1Det.Session.Commit;
end;

procedure TfrmBDMCTollnerSepsis.btnBaseDeleteClick(Sender: TObject);
begin
  inherited;
  if (Sender <> btnBaseDelete) or (lgvOracleDataSet1 <> nil) then
    Exit;

  if OracleDataSet1Det.IsEmpty or OracleDataSet1Det.ReadOnly then
    Exit;

  if MessageCustom(msgMultiUsed169) then
  begin
    OracleDataSet1Det.Delete;
    OracleDataSet1Det.Session.Commit;

    if OracleDataSet1Det.IsEmpty then
    begin
      vgTollnerSepsis.Enabled := False;
      vgTollnerSepsis.OptionsData.Editing := False;
    end;
  end;
end;

procedure TfrmBDMCTollnerSepsis.vgTollnerSepsisEditValueChanged(
  Sender: TObject; ARowProperties: TcxCustomEditorRowProperties);
const
  lgcTollnerSepsisAreas: array of string =
  [
    'CHANGE_IN_SKIN_COLOR',
    'PERIPHERAL_CIRCULATION_DISORDE',
    'HYPOTONY',
    'BRADICARDY',
    'APNEA',
    'RESPIRATORY_DISTRESS',
    'HEPATOMEGALI',
    'GASTROINTESTINAL_SYMPTOM',
    'LEUKOCIDE_NUMBER',
    'LEFT_SHIFT',
    'THOMBOCYTOPENIA',
    'METABOLIC_ACIDOSIS'
  ];
var
  i, lvScore: Integer;
begin
  if OracleDataSet1Det.ReadOnly or OracleDataSet1Det.IsEmpty then
    Exit;

  vgTollnerSepsis.HideEdit;

  lvScore := 0;
  for i := 0 to Length(lgcTollnerSepsisAreas) - 1 do
  begin
    if not OracleDataSet1Det.FieldByName(lgcTollnerSepsisAreas[i]).IsNull then
      lvScore := lvScore + OracleDataSet1Det.FieldByName(lgcTollnerSepsisAreas[i]).AsInteger;
  end;

  if not (OracleDataSet1Det.State in [dsEdit, dsInsert]) then
    OracleDataSet1Det.Edit;

  OracleDataSet1Det.FieldByName('SEPSIS_SCORE').AsInteger := lvScore;

  if lvScore < 5 then
    OracleDataSet1Det.FieldByName('SEPSIS_STATUS').AsString := 'SEPSIS YOK'
  else if lvScore <= 10 then
    OracleDataSet1Det.FieldByName('SEPSIS_STATUS').AsString := 'SEPSIS OLASILIGI'
  else
    OracleDataSet1Det.FieldByName('SEPSIS_STATUS').AsString := 'SEPSIS TANISI';

  // Otomatik Post kaldýrýldý, ekranýn güncellenmesi için Invalidate çaðrýldý
  vgTollnerSepsis.Invalidate;
end;

end.
