inherited frmBDMCTollnerSepsis: TfrmBDMCTollnerSepsis
  Caption = 'frmMCTollnerSepsis'
  ClientHeight = 780
  ClientWidth = 1130
  ExplicitWidth = 1142
  ExplicitHeight = 818
  TextHeight = 13
  inherited pnlBaseBottom: TPanel
    Width = 1130
    ExplicitWidth = 1124
    inherited btnBaseClose: TcxButton
      Left = 1051
      ExplicitLeft = 1045
    end
  end
  inherited pnlMain: TPanel
    Width = 1130
    Height = 668
    ExplicitWidth = 1124
    ExplicitHeight = 659
    object vgTollnerSepsis: TcxDBVerticalGrid
      Left = 0
      Top = 0
      Width = 1130
      Height = 513
      Align = alClient
      FindPanel.DisplayMode = fpdmManual
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      LayoutStyle = lsMultiRecordView
      OptionsView.CellEndEllipsis = True
      OptionsView.GridLineColor = clWhite
      OptionsView.RowHeaderWidth = 210
      OptionsView.RowHeight = 18
      OptionsView.ValueWidth = 325
      OptionsView.MultiRecordEvenOddContentStyle = mrcsByRecord
      OptionsBehavior.RowFiltering = bTrue
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      Navigator.Buttons.CustomButtons = <>
      ParentFont = False
      ScrollbarAnnotations.CustomAnnotations = <>
      TabOrder = 0
      OnEditValueChanged = vgTollnerSepsisEditValueChanged
      DataController.DataSource = DataSource2
      ExplicitWidth = 1124
      ExplicitHeight = 504
      Version = 1
      object vgTollnerSepsisDBMultiEditorRow1: TcxDBMultiEditorRow
        Properties.Editors = <
          item
            Caption = 'Tarih'
            EditPropertiesClassName = 'TcxDateEditProperties'
            EditProperties.DisplayFormat = 'dd.mm.yyyy'
            DataBinding.FieldName = 'PROCESS_TIME'
          end
          item
            Caption = 'Saat'
            DataBinding.FieldName = 'PROCESS_TIME'
          end>
        Styles.Header = cxStyle1
        ID = 0
        ParentID = -1
        Index = 0
        Version = 1
      end
      object vgTollnerSepsisDBEditorRow1: TcxDBEditorRow
        Properties.Caption = 'Hem'#351'ire'
        Properties.DataBinding.FieldName = 'CUSER'
        Styles.Header = cxStyle1
        Styles.Content = cxStyle1
        ID = 1
        ParentID = -1
        Index = 1
        Version = 1
      end
      object vgTollnerSepsisCategoryRow1: TcxCategoryRow
        Properties.Caption = 'T'#246'llner Sepsis'
        Styles.Header = cxStyle1
        ID = 2
        ParentID = -1
        Index = 2
        Version = 1
      end
      object vgTollnerSepsisDBEditorRow2: TcxDBEditorRow
        Properties.Caption = 'Deri Renginde De'#287'i'#351'iklik'
        Properties.EditPropertiesClassName = 'TcxRadioGroupProperties'
        Properties.EditProperties.Columns = 3
        Properties.EditProperties.Items = <
          item
            Caption = 'Yok'
            Value = '0'
          end
          item
            Caption = 'Orta'
            Value = '2'
          end
          item
            Caption = 'Belirgin'
            Value = '4'
          end>
        Properties.DataBinding.FieldName = 'CHANGE_IN_SKIN_COLOR'
        Styles.Header = cxStyle1
        ID = 3
        ParentID = -1
        Index = 3
        Version = 1
      end
      object vgTollnerSepsisDBEditorRow3: TcxDBEditorRow
        Properties.Caption = 'Periferik Dolan'#305'm Bozuklu'#287'u'
        Properties.EditPropertiesClassName = 'TcxRadioGroupProperties'
        Properties.EditProperties.Columns = 3
        Properties.EditProperties.Items = <
          item
            Caption = 'Yok'
            Value = '0'
          end
          item
            Caption = 'Bozuk'
            Value = '2'
          end
          item
            Caption = 'Belirgin'
            Value = '3'
          end>
        Properties.DataBinding.FieldName = 'PERIPHERAL_CIRCULATION_DISORDE'
        Styles.Header = cxStyle1
        ID = 4
        ParentID = -1
        Index = 4
        Version = 1
      end
      object vgTollnerSepsisDBEditorRow4: TcxDBEditorRow
        Properties.Caption = 'Hipotoni'
        Properties.EditPropertiesClassName = 'TcxRadioGroupProperties'
        Properties.EditProperties.Columns = 3
        Properties.EditProperties.Items = <
          item
            Caption = 'Yok'
            Value = '0'
          end
          item
            Caption = 'Orta'
            Value = '1'
          end
          item
            Caption = 'Belirgin'
            Value = '2'
          end>
        Properties.DataBinding.FieldName = 'HYPOTONY'
        Styles.Header = cxStyle1
        ID = 5
        ParentID = -1
        Index = 5
        Version = 1
      end
      object vgTollnerSepsisDBEditorRow5: TcxDBEditorRow
        Properties.Caption = 'Bradikardi'
        Properties.EditPropertiesClassName = 'TcxRadioGroupProperties'
        Properties.EditProperties.Columns = 2
        Properties.EditProperties.Items = <
          item
            Caption = 'Yok'
            Value = '0'
          end
          item
            Caption = 'Var'
            Value = '1'
          end>
        Properties.DataBinding.FieldName = 'BRADICARDY'
        Styles.Header = cxStyle1
        ID = 6
        ParentID = -1
        Index = 6
        Version = 1
      end
      object vgTollnerSepsisDBEditorRow6: TcxDBEditorRow
        Properties.Caption = 'Apne'
        Properties.EditPropertiesClassName = 'TcxRadioGroupProperties'
        Properties.EditProperties.Columns = 2
        Properties.EditProperties.Items = <
          item
            Caption = 'Yok'
            Value = '0'
          end
          item
            Caption = 'Var'
            Value = '1'
          end>
        Properties.DataBinding.FieldName = 'APNEA'
        Styles.Header = cxStyle1
        ID = 7
        ParentID = -1
        Index = 7
        Version = 1
      end
      object vgTollnerSepsisDBEditorRow7: TcxDBEditorRow
        Properties.Caption = 'Respiratuar distres'
        Properties.EditPropertiesClassName = 'TcxRadioGroupProperties'
        Properties.EditProperties.Columns = 2
        Properties.EditProperties.Items = <
          item
            Caption = 'Yok'
            Value = '0'
          end
          item
            Caption = 'Var'
            Value = '1'
          end>
        Properties.DataBinding.FieldName = 'RESPIRATORY_DISTRESS'
        Styles.Header = cxStyle1
        ID = 8
        ParentID = -1
        Index = 8
        Version = 1
      end
      object vgTollnerSepsisDBEditorRow8: TcxDBEditorRow
        Properties.Caption = 'Hepatomegali'
        Properties.EditPropertiesClassName = 'TcxRadioGroupProperties'
        Properties.EditProperties.Columns = 2
        Properties.EditProperties.Items = <
          item
            Caption = 'Yok'
            Value = '0'
          end
          item
            Caption = '>4cm'
            Value = '1'
          end>
        Properties.DataBinding.FieldName = 'HEPATOMEGALI'
        Styles.Header = cxStyle1
        ID = 9
        ParentID = -1
        Index = 9
        Version = 1
      end
      object vgTollnerSepsisDBEditorRow9: TcxDBEditorRow
        Properties.Caption = 'Gastrointestinal Bulgu'
        Properties.EditPropertiesClassName = 'TcxRadioGroupProperties'
        Properties.EditProperties.Columns = 2
        Properties.EditProperties.Items = <
          item
            Caption = 'Yok'
            Value = '0'
          end
          item
            Caption = 'Var'
            Value = '1'
          end>
        Properties.DataBinding.FieldName = 'GASTROINTESTINAL_SYMPTOM'
        Styles.Header = cxStyle1
        ID = 10
        ParentID = -1
        Index = 10
        Version = 1
      end
      object vgTollnerSepsisDBEditorRow10: TcxDBEditorRow
        Properties.Caption = 'L'#246'kosit Say'#305's'#305
        Properties.EditPropertiesClassName = 'TcxRadioGroupProperties'
        Properties.EditProperties.Columns = 3
        Properties.EditProperties.Items = <
          item
            Caption = 'Normal'
            Value = '0'
          end
          item
            Caption = 'L'#246'kositoz'
            Value = '1'
          end
          item
            Caption = 'L'#246'kopeni'
            Value = '3'
          end>
        Properties.DataBinding.FieldName = 'LEUKOCIDE_NUMBER'
        Styles.Header = cxStyle1
        ID = 11
        ParentID = -1
        Index = 11
        Version = 1
      end
      object vgTollnerSepsisDBEditorRow11: TcxDBEditorRow
        Properties.Caption = 'Sola Kayma'
        Properties.EditPropertiesClassName = 'TcxRadioGroupProperties'
        Properties.EditProperties.Columns = 3
        Properties.EditProperties.Items = <
          item
            Caption = 'Yok'
            Value = '0'
          end
          item
            Caption = 'Orta'
            Value = '2'
          end
          item
            Caption = 'Belirgin'
            Value = '3'
          end>
        Properties.DataBinding.FieldName = 'LEFT_SHIFT'
        Styles.Header = cxStyle1
        ID = 12
        ParentID = -1
        Index = 12
        Version = 1
      end
      object vgTollnerSepsisDBEditorRow12: TcxDBEditorRow
        Properties.Caption = 'Trombositopeni'
        Properties.EditPropertiesClassName = 'TcxRadioGroupProperties'
        Properties.EditProperties.Columns = 2
        Properties.EditProperties.Items = <
          item
            Caption = 'Yok'
            Value = '0'
          end
          item
            Caption = 'Var'
            Value = '2'
          end>
        Properties.DataBinding.FieldName = 'THOMBOCYTOPENIA'
        Styles.Header = cxStyle1
        ID = 13
        ParentID = -1
        Index = 13
        Version = 1
      end
      object vgTollnerSepsisDBEditorRow13: TcxDBEditorRow
        Properties.Caption = 'Metabolik Asidoz'
        Properties.EditPropertiesClassName = 'TcxRadioGroupProperties'
        Properties.EditProperties.Columns = 3
        Properties.EditProperties.Items = <
          item
            Caption = 'Yok'
            Value = '0'
          end
          item
            Caption = '>7.2'
            Value = '1'
          end
          item
            Caption = '<7.2'
            Value = '2'
          end>
        Properties.DataBinding.FieldName = 'METABOLIC_ACIDOSIS'
        Styles.Header = cxStyle1
        ID = 14
        ParentID = -1
        Index = 14
        Version = 1
      end
      object vgTollnerSepsisCategoryRow2: TcxCategoryRow
        ID = 15
        ParentID = -1
        Index = 15
        Version = 1
      end
      object vgTollnerSepsisDBEditorRow14: TcxDBEditorRow
        Properties.Caption = 'Sepsis Durumu'
        Properties.EditPropertiesClassName = 'TcxTextEditProperties'
        Properties.EditProperties.ReadOnly = True
        Properties.DataBinding.FieldName = 'SEPSIS_STATUS'
        Styles.Header = cxStyle1
        ID = 16
        ParentID = -1
        Index = 16
        Version = 1
      end
      object vgTollnerSepsisDBEditorRow15: TcxDBEditorRow
        Properties.Caption = 'Toplam Sepsis Skoru'
        Properties.EditPropertiesClassName = 'TcxTextEditProperties'
        Properties.EditProperties.ReadOnly = True
        Properties.DataBinding.FieldName = 'SEPSIS_SCORE'
        Styles.Header = cxStyle1
        ID = 17
        ParentID = -1
        Index = 17
        Version = 1
      end
    end
    object pnlFooter: TPanel
      Left = 0
      Top = 513
      Width = 1130
      Height = 155
      Align = alBottom
      TabOrder = 1
      ExplicitTop = 504
      ExplicitWidth = 1124
      object mmNote: TcxMemo
        Left = 1
        Top = 1
        TabStop = False
        Align = alLeft
        Enabled = False
        Lines.Strings = (
          '(Toplam Skor < 5) = Sepsis Yok'
          '(Toplam Skor 5-10) = Sepsis Olas'#305'l'#305#287#305
          '(Toplam Skor > 10) = Sepsis Teh'#351'isi ')
        ParentFont = False
        Properties.ReadOnly = True
        Style.BorderStyle = ebsNone
        Style.Color = clBtnFace
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clRed
        Style.Font.Height = -11
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.LookAndFeel.NativeStyle = True
        Style.IsFontAssigned = True
        StyleDisabled.Color = clBtnFace
        StyleDisabled.LookAndFeel.NativeStyle = True
        StyleDisabled.TextColor = clRed
        StyleFocused.LookAndFeel.NativeStyle = True
        StyleHot.LookAndFeel.NativeStyle = True
        TabOrder = 0
        Height = 153
        Width = 200
      end
    end
  end
  inherited gbBaseTop: TcxGroupBox
    ExplicitWidth = 1124
    Width = 1130
    inherited pnlDiag: TPanel
      ExplicitLeft = 565
      ExplicitTop = 4
      ExplicitHeight = 69
      inherited mmDiag: TcxMemo
        ExplicitHeight = 54
      end
    end
    inherited pnlGenLeft: TPanel
      ExplicitLeft = 4
      ExplicitTop = 4
      ExplicitHeight = 69
      inherited pnlPatientDetail: TPanel
        ExplicitTop = 32
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
    Left = 728
  end
  inherited OracleDataSet1: TOracleDataSet
    SQL.Strings = (
      'SELECT BMS.*, BMS.ROWID'
      'FROM BD_MC_TOLLNER_SEPSIS BMS'
      'WHERE BMS.COM_ID = :COM_ID')
    Variables.Data = {
      04000000010000000E0000003A0043004F004D005F0049004400030000000000
      000000000000}
    SequenceField.Field = 'ID'
    SequenceField.Sequence = 'BD_MC_TOLLNER_SEPSIS_SEQ'
    SequenceField.ApplyMoment = amOnNewRecord
    Left = 600
    Top = 248
  end
  inherited DataSource1: TDataSource
    Left = 616
    Top = 360
  end
  inherited OracleDataSet1Det: TOracleDataSet
    SQL.Strings = (
      'SELECT BMSD.*,'
      '       BMSD.ROWID,'
      '       SUBSTR(GET_USER_NAME(BMSD.NURSE_ID), 1, 50) AS NURSE_NAME'
      'FROM STAJER.BD_MC_TOLLNER_SEPSIS_DET BMSD'
      'WHERE BMSD.MTS_ID = :MTS_ID'
      'ORDER BY BMSD.CTIME DESC')
    Variables.Data = {
      04000000010000000E0000003A004D00540053005F0049004400030000000000
      000000000000}
    SequenceField.Field = 'ID'
    SequenceField.Sequence = 'BD_MC_TOLLNER_SEPSIS_DET_SEQ'
    SequenceField.ApplyMoment = amOnNewRecord
    DetailFields = 'MTS_ID'
    Left = 744
    Top = 232
  end
  inherited DataSource2: TDataSource
    Left = 768
    Top = 320
  end
  object cxStyleRepository1: TcxStyleRepository
    Left = 784
    Top = 184
    PixelsPerInch = 96
    object cxStyle1: TcxStyle
      AssignedValues = [svFont, svTextColor]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      TextColor = clMenuText
    end
  end
end
