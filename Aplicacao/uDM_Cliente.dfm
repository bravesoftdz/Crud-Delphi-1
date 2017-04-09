object dm_Cliente: Tdm_Cliente
  OldCreateOrder = False
  Height = 150
  Width = 413
  object dst_Cliente: TSQLDataSet
    CommandText = 
      'select'#13#10'  cliente.codigo,'#13#10'  cliente.rsocial,'#13#10'  cliente.cidade,' +
      #13#10'  cidade.nome'#13#10'from cliente'#13#10'   left outer join cidade on (cli' +
      'ente.cidade = cidade.id)'#13#10'where'#13#10'   (cliente.codigo = :codigo)'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'codigo'
        ParamType = ptInput
      end>
    SQLConnection = dm_Conexao.Conn
    Left = 64
    Top = 40
    object dst_ClienteCODIGO: TIntegerField
      FieldName = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object dst_ClienteRSOCIAL: TStringField
      FieldName = 'RSOCIAL'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object dst_ClienteCIDADE: TIntegerField
      FieldName = 'CIDADE'
      ProviderFlags = [pfInUpdate]
    end
    object dst_ClienteNOME: TStringField
      FieldName = 'NOME'
      ProviderFlags = []
      Size = 100
    end
  end
  object dsp_Cliente: TDataSetProvider
    DataSet = dst_Cliente
    Options = [poCascadeDeletes, poCascadeUpdates, poAutoRefresh, poPropogateChanges, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 168
    Top = 40
  end
  object cds_Cliente: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'codigo'
        ParamType = ptInput
      end>
    ProviderName = 'dsp_Cliente'
    OnReconcileError = cds_ClienteReconcileError
    Left = 256
    Top = 40
    object cds_ClienteCODIGO: TIntegerField
      FieldName = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object cds_ClienteRSOCIAL: TStringField
      FieldName = 'RSOCIAL'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 100
    end
    object cds_ClienteCIDADE: TIntegerField
      FieldName = 'CIDADE'
      ProviderFlags = [pfInUpdate]
      OnValidate = cds_ClienteCIDADEValidate
    end
    object cds_ClienteNOME: TStringField
      FieldName = 'NOME'
      ProviderFlags = []
      Size = 100
    end
  end
end
