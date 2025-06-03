object frmConcepts: TfrmConcepts
  Left = 0
  Top = 0
  Caption = 'frmConcepts'
  ClientHeight = 292
  ClientWidth = 861
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  TextHeight = 13
  object pgc1: TPageControl
    Left = 0
    Top = 0
    Width = 861
    Height = 292
    ActivePage = tsRTTI
    Align = alClient
    TabOrder = 0
    object tsThreads: TTabSheet
      Caption = 'Threads'
      object btnThreadStart: TButton
        AlignWithMargins = True
        Left = 60
        Top = 3
        Width = 733
        Height = 25
        Margins.Left = 60
        Margins.Right = 60
        Align = alTop
        Caption = 'Start'
        TabOrder = 0
        OnClick = btnThreadStartClick
      end
      object pnl1: TPanel
        Left = 0
        Top = 151
        Width = 853
        Height = 30
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 5
        object lbl1: TLabel
          AlignWithMargins = True
          Left = 773
          Top = 3
          Width = 77
          Height = 24
          Margins.Left = 10
          Align = alRight
          AutoSize = False
          Caption = 'Position: 111'
          Layout = tlCenter
        end
        object pb1: TProgressBar
          Left = 0
          Top = 0
          Width = 763
          Height = 30
          Align = alClient
          TabOrder = 0
        end
      end
      object Panel1: TPanel
        Left = 0
        Top = 121
        Width = 853
        Height = 30
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 4
        object lbl2: TLabel
          AlignWithMargins = True
          Left = 773
          Top = 3
          Width = 77
          Height = 24
          Margins.Left = 10
          Align = alRight
          AutoSize = False
          Caption = 'Position: 111'
          Layout = tlCenter
        end
        object pb2: TProgressBar
          Left = 0
          Top = 0
          Width = 763
          Height = 30
          Align = alClient
          TabOrder = 0
        end
      end
      object Panel2: TPanel
        Left = 0
        Top = 91
        Width = 853
        Height = 30
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 3
        object lbl3: TLabel
          AlignWithMargins = True
          Left = 773
          Top = 3
          Width = 77
          Height = 24
          Margins.Left = 10
          Align = alRight
          AutoSize = False
          Caption = 'Position: 111'
          Layout = tlCenter
        end
        object pb3: TProgressBar
          Left = 0
          Top = 0
          Width = 763
          Height = 30
          Align = alClient
          TabOrder = 0
        end
      end
      object Panel3: TPanel
        Left = 0
        Top = 61
        Width = 853
        Height = 30
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 2
        object lbl4: TLabel
          AlignWithMargins = True
          Left = 773
          Top = 3
          Width = 77
          Height = 24
          Margins.Left = 10
          Align = alRight
          AutoSize = False
          Caption = 'Position: 111'
          Layout = tlCenter
        end
        object pb4: TProgressBar
          Left = 0
          Top = 0
          Width = 763
          Height = 30
          Align = alClient
          TabOrder = 0
        end
      end
      object Panel4: TPanel
        Left = 0
        Top = 31
        Width = 853
        Height = 30
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 1
        object lbl5: TLabel
          AlignWithMargins = True
          Left = 773
          Top = 3
          Width = 77
          Height = 24
          Margins.Left = 10
          Align = alRight
          AutoSize = False
          Caption = 'Position: 111'
          Layout = tlCenter
        end
        object pb5: TProgressBar
          Left = 0
          Top = 0
          Width = 763
          Height = 30
          Align = alClient
          TabOrder = 0
        end
      end
    end
    object tsLeetCode: TTabSheet
      Caption = 'LeetCode'
      ImageIndex = 1
      object pgc2: TPageControl
        Left = 0
        Top = 0
        Width = 853
        Height = 264
        ActivePage = tsLC3
        Align = alClient
        TabOrder = 0
        object tsTwoSums: TTabSheet
          Caption = 'Two Sum'
          object redt1: TRichEdit
            Left = 0
            Top = 0
            Width = 845
            Height = 206
            Align = alClient
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            Lines.Strings = (
              
                'Given an array of integers nums and an integer target, return in' +
                'dices of the two numbers such that they add up to target.'
              ''
              
                'You may assume that each input would have exactly one solution, ' +
                'and you may not use the same element twice.'
              ''
              'You can return the answer in any order.')
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
          end
          object pnl2: TPanel
            Left = 0
            Top = 206
            Width = 845
            Height = 30
            Align = alBottom
            BevelOuter = bvNone
            TabOrder = 1
            object btnTwoSum: TButton
              Left = 640
              Top = 0
              Width = 205
              Height = 30
              Align = alRight
              Caption = 'Run Solution'
              TabOrder = 0
              OnClick = btnTwoSumClick
            end
            object edtInputTwoSum: TEdit
              AlignWithMargins = True
              Left = 71
              Top = 3
              Width = 273
              Height = 24
              Align = alLeft
              TabOrder = 2
              Text = 'Input'
              ExplicitHeight = 21
            end
            object edtOutputTwoSum: TEdit
              AlignWithMargins = True
              Left = 350
              Top = 3
              Width = 273
              Height = 24
              Align = alLeft
              TabOrder = 3
              Text = 'Output'
              ExplicitHeight = 21
            end
            object edtTargetTwoSum: TEdit
              AlignWithMargins = True
              Left = 3
              Top = 3
              Width = 62
              Height = 24
              Align = alLeft
              TabOrder = 1
              Text = 'Target'
              ExplicitHeight = 21
            end
          end
        end
        object tsLC3: TTabSheet
          Caption = 'tsLC3'
          ImageIndex = 1
          object Panel5: TPanel
            Left = 0
            Top = 206
            Width = 845
            Height = 30
            Align = alBottom
            BevelOuter = bvNone
            TabOrder = 0
            object btnLC3: TButton
              Left = 640
              Top = 0
              Width = 205
              Height = 30
              Align = alRight
              Caption = 'Run Solution'
              TabOrder = 0
              OnClick = btnLC3Click
            end
            object edtInputLC3: TEdit
              AlignWithMargins = True
              Left = 3
              Top = 3
              Width = 273
              Height = 24
              Align = alLeft
              TabOrder = 1
              Text = 'Input'
              ExplicitHeight = 21
            end
            object edtOutputLC3: TEdit
              AlignWithMargins = True
              Left = 282
              Top = 3
              Width = 273
              Height = 24
              Align = alLeft
              TabOrder = 2
              Text = 'Output'
              ExplicitHeight = 21
            end
          end
          object RichEdit1: TRichEdit
            Left = 0
            Top = 0
            Width = 845
            Height = 206
            Align = alClient
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            Lines.Strings = (
              'Given a string s, find the length of the longest'
              ''
              'without duplicate characters.'
              ''
              ' '
              ''
              'Example 1:'
              ''
              'Input: s = "abcabcbb"'
              'Output: 3'
              'Explanation: The answer is "abc", with the length of 3.'
              ''
              'Example 2:'
              ''
              'Input: s = "bbbbb"'
              'Output: 1'
              'Explanation: The answer is "b", with the length of 1.'
              ''
              'Example 3:'
              ''
              'Input: s = "pwwkew"'
              'Output: 3'
              'Explanation: The answer is "wke", with the length of 3.'
              
                'Notice that the answer must be a substring, "pwke" is a subseque' +
                'nce and not a substring.'
              ''
              ' '
              ''
              'Constraints:'
              ''
              '    0 <= s.length <= 5 * 104'
              '    s consists of English letters, digits, symbols and spaces.')
            ParentFont = False
            ReadOnly = True
            ScrollBars = ssVertical
            TabOrder = 1
          end
        end
      end
    end
    object tsRTTI: TTabSheet
      Caption = 'Rtti'
      ImageIndex = 2
      object pnlProductsList: TPanel
        Left = 0
        Top = 0
        Width = 305
        Height = 264
        Align = alLeft
        BevelOuter = bvNone
        TabOrder = 0
        ExplicitTop = 25
        ExplicitHeight = 239
        object mmoProducts: TMemo
          Left = 0
          Top = 25
          Width = 305
          Height = 239
          Margins.Top = 15
          Align = alClient
          TabOrder = 0
          ExplicitLeft = 305
          ExplicitWidth = 548
        end
        object btnLoadProductsRTTI: TButton
          Left = 0
          Top = 0
          Width = 305
          Height = 25
          Align = alTop
          Caption = 'Load Products'
          TabOrder = 1
          OnClick = btnLoadProductsRTTIClick
          ExplicitWidth = 853
        end
      end
      object pnlCrudProducts: TPanel
        Left = 305
        Top = 0
        Width = 548
        Height = 264
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 1
        ExplicitLeft = 311
        object lblID: TLabeledEdit
          AlignWithMargins = True
          Left = 3
          Top = 15
          Width = 542
          Height = 22
          Margins.Top = 15
          Align = alTop
          EditLabel.Width = 51
          EditLabel.Height = 13
          EditLabel.Caption = 'Product ID'
          EditLabel.Layout = tlTop
          TabOrder = 0
          Text = ''
          ExplicitTop = 3
        end
        object lblDescription: TLabeledEdit
          AlignWithMargins = True
          Left = 3
          Top = 55
          Width = 542
          Height = 22
          Margins.Top = 15
          Align = alTop
          EditLabel.Width = 53
          EditLabel.Height = 13
          EditLabel.Caption = 'Description'
          EditLabel.Layout = tlTop
          TabOrder = 1
          Text = ''
          ExplicitLeft = 6
          ExplicitTop = 122
        end
        object lblCost: TLabeledEdit
          AlignWithMargins = True
          Left = 3
          Top = 95
          Width = 542
          Height = 22
          Margins.Top = 15
          Align = alTop
          EditLabel.Width = 22
          EditLabel.Height = 13
          EditLabel.Caption = 'Cost'
          EditLabel.Layout = tlTop
          TabOrder = 2
          Text = ''
          ExplicitWidth = 541
        end
        object lblCategory: TLabeledEdit
          AlignWithMargins = True
          Left = 3
          Top = 135
          Width = 542
          Height = 22
          Margins.Top = 15
          Align = alTop
          EditLabel.Width = 45
          EditLabel.Height = 13
          EditLabel.Caption = 'Category'
          EditLabel.Layout = tlTop
          TabOrder = 3
          Text = ''
          ExplicitLeft = 6
          ExplicitTop = 175
        end
        object pnlProductButtons: TPanel
          Left = 0
          Top = 223
          Width = 548
          Height = 41
          Align = alBottom
          BevelOuter = bvNone
          TabOrder = 4
          ExplicitLeft = 184
          ExplicitTop = 112
          ExplicitWidth = 185
          object btnProductInsert: TButton
            AlignWithMargins = True
            Left = 3
            Top = 3
            Width = 75
            Height = 35
            Align = alLeft
            Caption = 'Insert'
            TabOrder = 0
            OnClick = btnProductInsertClick
            ExplicitLeft = 240
            ExplicitTop = 8
            ExplicitHeight = 25
          end
        end
      end
    end
  end
  object FDConnection1: TFDConnection
    ConnectionName = 'db-tests'
    Params.Strings = (
      'DriverID=FB'
      'Database=C:\Dados\DB-TESTS.FDB'
      'Password=carmofae'
      'User_Name=sysdba')
    Connected = True
    LoginPrompt = False
    Left = 600
    Top = 200
  end
  object fdqProducts: TFDQuery
    Connection = FDConnection1
    Left = 588
    Top = 120
  end
  object dsProducts: TDataSource
    DataSet = fdqProducts
    Left = 504
    Top = 112
  end
end
