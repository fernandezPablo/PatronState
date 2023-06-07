object f_LanzadorServidorImpresion: Tf_LanzadorServidorImpresion
  Left = 0
  Top = 0
  Hint = 'Limpiar el log'
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Servidor de Impresi'#243'n'
  ClientHeight = 487
  ClientWidth = 510
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 15
  object gb_Acciones: TcxGroupBox
    Left = 8
    Top = 8
    Caption = '   Acciones   '
    TabOrder = 2
    Height = 186
    Width = 135
    object b_Iniciar: TcxButton
      Left = 24
      Top = 32
      Width = 75
      Height = 25
      Caption = 'Iniciar'
      TabOrder = 0
      OnClick = b_IniciarClick
    end
    object b_Imprimir: TcxButton
      Left = 24
      Top = 72
      Width = 75
      Height = 25
      Caption = 'Imprimir'
      TabOrder = 1
      OnClick = b_ImprimirClick
    end
    object b_Detener: TcxButton
      Left = 24
      Top = 112
      Width = 75
      Height = 25
      Caption = 'Detener'
      TabOrder = 2
      OnClick = b_DetenerClick
    end
  end
  object gb_Estados: TcxGroupBox
    Left = 149
    Top = 8
    Caption = '   Estado del Servidor de Impresi'#243'n  '
    TabOrder = 0
    Height = 185
    Width = 353
    object s_EstadoDetenido: TShape
      Left = 24
      Top = 24
      Width = 25
      Height = 25
      Brush.Color = clRed
      Shape = stCircle
    end
    object s_EstadoIniciando: TShape
      Left = 24
      Top = 64
      Width = 25
      Height = 25
      Brush.Color = clYellow
      Enabled = False
      Shape = stCircle
    end
    object s_EstadoPreparado: TShape
      Left = 24
      Top = 104
      Width = 25
      Height = 25
      Brush.Color = clLime
      Enabled = False
      Shape = stCircle
    end
    object s_EstadoImprimiendo: TShape
      Left = 24
      Top = 144
      Width = 25
      Height = 25
      Brush.Color = clBlue
      Enabled = False
      Shape = stCircle
    end
    object l_EstadoDetenido: TcxLabel
      Left = 55
      Top = 27
      Caption = 'Detenido'
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -12
      Style.Font.Name = 'Segoe UI'
      Style.Font.Style = [fsBold]
      Style.IsFontAssigned = True
    end
    object l_EstadoIniciando: TcxLabel
      Left = 55
      Top = 67
      Caption = 'Iniciando'
      Enabled = False
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -12
      Style.Font.Name = 'Segoe UI'
      Style.Font.Style = [fsBold]
      Style.IsFontAssigned = True
    end
    object l_EstadoPreparado: TcxLabel
      Left = 55
      Top = 107
      Caption = 'Preparado'
      Enabled = False
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -12
      Style.Font.Name = 'Segoe UI'
      Style.Font.Style = [fsBold]
      Style.IsFontAssigned = True
    end
    object l_EstadoImprimiendo: TcxLabel
      Left = 55
      Top = 147
      Caption = 'Imprimiendo'
      Enabled = False
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -12
      Style.Font.Name = 'Segoe UI'
      Style.Font.Style = [fsBold]
      Style.IsFontAssigned = True
    end
  end
  object gb_Mensajes: TcxGroupBox
    Left = 7
    Top = 202
    Caption = '   Mensajes del Servidor   '
    TabOrder = 1
    Height = 277
    Width = 494
    object e_MensajesServidor: TcxRichEdit
      Left = 3
      Top = 30
      ParentFont = False
      Properties.ReadOnly = True
      Properties.ScrollBars = ssVertical
      Style.Color = clBackground
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -12
      Style.Font.Name = 'Segoe UI'
      Style.Font.Style = [fsBold]
      Style.TextColor = clRed
      Style.IsFontAssigned = True
      TabOrder = 0
      Height = 234
      Width = 470
    end
    object b_LimpiarConsola: TcxButton
      Left = 446
      Top = 9
      Width = 23
      Height = 21
      Hint = 'Limpiar el log'
      Margins.Left = 0
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 0
      LookAndFeel.Kind = lfStandard
      LookAndFeel.NativeStyle = False
      OptionsImage.Glyph.SourceDPI = 96
      OptionsImage.Glyph.Data = {
        89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
        6100000023744558745469746C650043616E63656C3B53746F703B457869743B
        426172733B526962626F6E3B4C9696B20000038849444154785E1D906B4C5367
        18C7FF3DBD40CB1A2E32B55C9D598B4CA675D8D13836652E9B0359B67D589665
        3259E644A52571644474CB4CB6ECC23770C4449DD38D2885005E4683AB69C616
        8DA12384264EC8AAAC0C9149A1175ACEE9E939CFDE9EE7E477F2CBFFB924E720
        E6E943CC3B8895D12B00A0FEE3D08167A75A5BBAEEB71D9D081E6B4DA549FBDD
        A3CEEFDD1F3658016818AA98A71FD1915E202DE980A19D741E3EF6E0F8A7FC7F
        673B6979E002C5BC43B4C2581EB8480BE7BA68E6441BEF3B72F03300990C8E1D
        5016554E7B55D6C1ED9543C6C2B5BB739FDF025988838424E4240F10A0D2EAA0
        D26540AD37203CFE17C2C187A3EDBFDE7CF3DAD4748403A06EA8A8E830AC5FB3
        3B7BAB1901B717AE23DFE1CEC5EBEC90A0E0EB71A3CFD981C0B017C6F252180B
        D6BD74BCFA856E003A0CBDFD966DF250532AD4FF038DB734D18557DF21CFB08F
        2E37B5D370ED5E72D7D52BEEF9654CE9F91C1FD392EB0C4D3A0E4BE7F6ECD909
        CFDEFAD381AF4ED0A3D35FD399E272BA3F3D478F971234FD2044BDCE930AF798
        CF2FAED0DF5373CACCFCA92F2970B29DDCAFD7F56B48945E918201C41738945A
        2D581C7461ADA3192AB50AD64F9A010272730CC8D4AA313BE44289D58CF85D3F
        2411504BB28D93845489145E041F9CC1863C09A11BD7E1EFEA86240339463DB2
        B3F59025C0DFD98DD0C83594E6886C360831F408523265D208BC0021B20A35A7
        82B8BC0429C2239A10D812417988007088B14C8A8421EA75A094044A8A48F200
        17E78587629220B370E69F2884EA3750F07E23245946868E43A64EA3B8695F23
        F8EA7A046763EC780AC9640AF155FEB1269AE0BD91AC8CFDF910108E26F15A5B
        33788D1E860CF6CDE7CF225D45FB3F02A0C7CE36076E5CBD84825C3562A20E4B
        097E0CAD051B5FFCA97C9BE4ABAEA05B2FDBE9E6BE0F880F8568FCDB0E1AA9AA
        646C579C654AEF564D15FDB96333FDBCC94A8E751B6A0140DF5168B9E42A7B86
        266AB6D2ED1A1BF559CAC853B58DFCB576F2D7D9D3AE64B777D96862D716EA2F
        2BA76F4CE62B008C1A00C2F9C57F9D8DA2C99212C5E72C85323699F320A77FD2
        72040021DF9885F56BF2204457706F9EC74C4CF2F744169A012430DBF21E00A8
        2B754F98BEC82EEEED7AF2291A306FA451EBD3346633938FF13BF341969D62BD
        CF738AAF6ED6EA4B006882CE77A14ABFD255D2799903606830E4EF28E274070C
        1C67D74255041044C25C9CE43B4149F8B16735F41B8038DB9300E07F6924ECFB
        01D589CC0000000049454E44AE426082}
      PaintStyle = bpsGlyph
      ParentShowHint = False
      ShowHint = True
      SpeedButtonOptions.Transparent = True
      TabOrder = 1
      OnClick = b_LimpiarConsolaClick
    end
    object b_Copy: TcxButton
      Left = 423
      Top = 9
      Width = 23
      Height = 21
      Hint = 'Copiar el log al portapapeles'
      Margins.Left = 0
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 0
      LookAndFeel.Kind = lfStandard
      LookAndFeel.NativeStyle = False
      OptionsImage.Glyph.SourceDPI = 96
      OptionsImage.Glyph.Data = {
        89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
        6100000025744558745469746C6500436F70793B426172733B526962626F6E3B
        5374616E646172643B436C6F6E656D0EDF5B000001B649444154785E7D90318B
        53411446CF7DD94D229AC24A2BC1CADE56248D8A76D65A2B6C6721DA0A82D66A
        A1A58DFD7656168B0B36D6AB85827F40566159F3E6CDBD9F929921210B4E3317
        1EE7BC33D724B17E66B3D9E8F9EBBD0F9DD95C18104842180290109053FAF8E4
        C18D6B5B9C3C9DD07CE7CE65A0C9A9F06A7EF1F6F35560B4149899011D6093C9
        647CE1FC1952EAF9B37000A28266DD3F62C47432C2B303582BE89EBDF954B265
        7CF97EC8C1B79F88AE660702CE9D9D72FBE62526E35364DF10483E7F74FFCA7F
        B39FBEDA27E78C24D210EB02CC73418E6BB6B07207C8C474DC2DB3DD45881305
        960747802464566E00A3CC1572050A11454013903C00080C095001010221897E
        88B5026D3E21832042C8A83308812850CE840721E1B1B18361080484B4064351
        14B1BB2384043E6C1464CFE54314A87A304140CB66BADD11802B00B47AC29254
        2D68FF368450D4820876DF1FF0F5C711B93FDA07721330785058519750E02613
        780A1EEE5CBF381E8F7F0103B06802A2EEE0F4740B54F090210588964D4AE9B0
        EFFBDF8D6B02EFD3F1DEBDC7BB73B15AA299AABD088645C906D814A4772FEFDE
        02B601033879A396BD2EF80B61825062DDA3F2C70000000049454E44AE426082}
      PaintStyle = bpsGlyph
      ParentShowHint = False
      ShowHint = True
      SpeedButtonOptions.Transparent = True
      TabOrder = 2
      OnClick = b_CopyClick
    end
  end
end
