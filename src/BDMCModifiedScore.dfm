inherited frmBDMCModifiedScore: TfrmBDMCModifiedScore
  Left = 726
  Caption = 'frmBDMCModifiedScore'
  ClientHeight = 536
  ClientWidth = 956
  Position = poDesigned
  ExplicitWidth = 968
  TextHeight = 13
  inherited pnlBaseBottom: TPanel
    Width = 956
    ExplicitWidth = 950
    inherited btnBaseClose: TcxButton
      Left = 877
      ExplicitLeft = 871
    end
  end
  inherited pnlMain: TPanel
    Width = 956
    Height = 424
    ExplicitWidth = 950
    ExplicitHeight = 415
    object vgModifiedScore: TcxDBVerticalGrid
      AlignWithMargins = True
      Left = 3
      Top = 3
      Width = 950
      Height = 418
      Align = alClient
      FindPanel.DisplayMode = fpdmManual
      LayoutStyle = lsMultiRecordView
      OptionsView.CellEndEllipsis = True
      OptionsView.RowHeaderWidth = 199
      OptionsView.RowHeight = 18
      OptionsView.ValueWidth = 118
      OptionsView.MultiRecordEvenOddContentStyle = mrcsByRecord
      OptionsBehavior.RowFiltering = bTrue
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Inserting = False
      Navigator.Buttons.CustomButtons = <>
      ScrollbarAnnotations.CustomAnnotations = <>
      TabOrder = 0
      OnEditValueChanged = vgModifiedScoreEditValueChanged
      DataController.DataSource = DataSource2
      ExplicitLeft = 4
      ExplicitTop = 6
      Version = 1
      object vgBDMCModifiedScorePROCESS_TIME: TcxDBEditorRow
        Properties.Caption = 'Tarih'
        Properties.EditPropertiesClassName = 'TcxDateEditProperties'
        Properties.EditProperties.DisplayFormat = 'dd.mm.yyyy'
        Properties.DataBinding.FieldName = 'PROCESS_TIME'
        Properties.Options.Editing = False
        ID = 0
        ParentID = -1
        Index = 0
        Version = 1
      end
      object vgBDMCModifiedScorePROCESS_TIME2: TcxDBEditorRow
        Properties.Caption = 'Saat'
        Properties.EditPropertiesClassName = 'TcxTimeEditProperties'
        Properties.DataBinding.FieldName = 'PROCESS_TIME'
        Properties.Options.Editing = False
        ID = 1
        ParentID = -1
        Index = 1
        Version = 1
      end
      object vgBDMCModifiedScoreCUSER: TcxDBEditorRow
        Properties.Caption = 'Kay'#305't Yapan Kullan'#305'c'#305
        Properties.DataBinding.FieldName = 'CUSER'
        Properties.Options.Editing = False
        ID = 2
        ParentID = -1
        Index = 2
        Version = 1
      end
      object vgBDMCModifiedScoreCategoryParameters: TcxCategoryRow
        Properties.Caption = 'Parametreler'
        ID = 3
        ParentID = -1
        Index = 3
        Version = 1
      end
      object vgBDMCModifiedScoreLEVEL_CONSCIOUSNESS: TcxDBEditorRow
        Properties.Caption = 'Bilin'#231' D'#252'zeyi'
        Properties.DataBinding.FieldName = 'LEVEL_CONSCIOUSNESS'
        ID = 4
        ParentID = -1
        Index = 4
        Version = 1
      end
      object vgBDMCModifiedScoreACTIVITY: TcxDBEditorRow
        Properties.Caption = 'Aktivite'
        Properties.DataBinding.FieldName = 'ACTIVITY'
        ID = 5
        ParentID = -1
        Index = 5
        Version = 1
      end
      object vgBDMCModifiedScoreRESPIRATORY: TcxDBEditorRow
        Properties.Caption = 'Solunum'
        Properties.DataBinding.FieldName = 'RESPIRATORY'
        ID = 6
        ParentID = -1
        Index = 6
        Version = 1
      end
      object vgBDMCModifiedScoreSPO2: TcxDBEditorRow
        Properties.Caption = 'SpO2'
        Properties.DataBinding.FieldName = 'SPO2'
        ID = 7
        ParentID = -1
        Index = 7
        Version = 1
      end
      object vgBDMCModifiedScoreBLOOD_PRESSURE: TcxDBEditorRow
        Properties.Caption = 'Kan Bas'#305'nc'#305
        Properties.DataBinding.FieldName = 'BLOOD_PRESSURE'
        ID = 8
        ParentID = -1
        Index = 8
        Version = 1
      end
      object vgBDMCModifiedScorePULSE: TcxDBEditorRow
        Properties.Caption = 'Nab'#305'z'
        Properties.DataBinding.FieldName = 'PULSE'
        ID = 9
        ParentID = -1
        Index = 9
        Version = 1
      end
      object vgBDMCModifiedScoreCategoryOther: TcxCategoryRow
        Properties.Caption = 'Skor'
        ID = 10
        ParentID = -1
        Index = 10
        Version = 1
      end
      object vgBDMCModifiedScoreMAS_SCORE: TcxDBEditorRow
        Properties.Caption = 'MAS Skoru'
        Properties.DataBinding.FieldName = 'MAS_SCORE'
        Properties.Options.Editing = False
        ID = 11
        ParentID = -1
        Index = 11
        Version = 1
      end
    end
  end
  inherited gbBaseTop: TcxGroupBox
    ExplicitWidth = 950
    Width = 956
    inherited pnlGenLeft: TPanel
      inherited pnlPatientDetail: TPanel
        inherited Panel7: TPanel
          inherited cxLabel6: TcxLabel
            AnchorY = 8
          end
          inherited lblDoctor: TcxLabel
            AnchorY = 25
          end
        end
        inherited Panel8: TPanel
          inherited lblAssCaption: TcxLabel
            AnchorY = 8
          end
          inherited lblAss: TcxLabel
            AnchorY = 25
          end
        end
        inherited pnlIsPregnant: TPanel
          inherited cxLabel7: TcxLabel
            AnchorY = 8
          end
        end
        inherited Panel17: TPanel
          inherited cxLabel12: TcxLabel
            AnchorY = 8
          end
          inherited lblSecAss: TcxLabel
            AnchorY = 25
          end
        end
        inherited Panel1: TPanel
          inherited lblLength: TcxLabel
            AnchorY = 35
          end
        end
        inherited Panel2: TPanel
          inherited lblWeight: TcxLabel
            AnchorY = 35
          end
        end
        inherited Panel3: TPanel
          inherited cxLabel13: TcxLabel
            AnchorY = 8
          end
          inherited teUPN: TcxTextEdit
            ExplicitHeight = 20
          end
        end
      end
      inherited pnlPatientInfo: TPanel
        inherited lblPatName: TcxLabel
          AnchorX = 124
          AnchorY = 18
        end
        inherited pnlProt: TPanel
          inherited cxLabel1: TcxLabel
            AnchorY = 8
          end
          inherited teProt: TcxTextEdit
            ExplicitHeight = 20
          end
        end
        inherited pnlPatInfoAge: TPanel
          inherited lblAge: TcxLabel
            AnchorY = 35
          end
        end
        inherited pnlPatInfoBirthDate: TPanel
          inherited lblBirth: TcxLabel
            AnchorY = 35
          end
        end
        inherited pnlPatInfoSexuality: TPanel
          inherited lblGender: TcxLabel
            AnchorY = 35
          end
        end
      end
    end
  end
  inherited AppEvntsBase: TApplicationEvents
    Left = 648
  end
  inherited OracleDataSet1: TOracleDataSet
    SQL.Strings = (
      'SELECT MS.*, MS.ROWID '
      'FROM BD_MC_MODIFIED_SCORE MS '
      'WHERE MS.COM_ID = :COM_ID')
    Variables.Data = {
      04000000010000000E0000003A0043004F004D005F0049004400030000000000
      000000000000}
    SequenceField.Field = 'ID'
    SequenceField.Sequence = 'BD_MC_MODIFIED_SCORE_SEQ'
    SequenceField.ApplyMoment = amOnNewRecord
    Left = 528
    Top = 232
  end
  inherited DataSource1: TDataSource
    Left = 544
    Top = 312
  end
  inherited OracleDataSet1Det: TOracleDataSet
    SQL.Strings = (
      'SELECT MSD.*, MSD.ROWID '
      'FROM BD_MC_MODIFIED_SCORE_DETAIL MSD '
      'WHERE MSD.MS_ID = :MS_ID '
      'ORDER BY MSD.PROCESS_TIME DESC')
    Variables.Data = {
      04000000010000000C0000003A004D0053005F00490044000300000000000000
      00000000}
    SequenceField.Field = 'ID'
    SequenceField.Sequence = 'BD_MC_MODIFIED_SCORE_DET_SEQ'
    SequenceField.ApplyMoment = amOnNewRecord
    DetailFields = 'MS_ID'
    Left = 648
    Top = 232
  end
  inherited DataSource2: TDataSource
    Left = 656
    Top = 312
  end
end
