SELECT sa.A1_COD as Codigo,
sa.A1_FILIAL as Filial,
sa.A1_LOJA as Loja, 
sa.A1_XXDCONT as Desconto_Contratual, 
tb.NivelPoliticaComercial AS Nivel_De_Desconto, 
tcpc.Desconto AS Desconto
FROM DADOSADV.dbo.SA1100 as sa

JOIN EXTRANET.dbo.TB_CLIENTE as tb 
on sa.A1_COD COLLATE SQL_Latin1_General_CP850_BIN =
tb.grupo_codigo COLLATE SQL_Latin1_General_CP850_BIN

JOIN EXTRANET.dbo.tb_cliente_politica_comercial as tcpc
on tcpc.Nivel = tb.NivelPoliticaComercial

WHERE sa.A1_COD IN ('11203','03201')
and tcpc.SubNivel = ''
and sa.A1_FILIAL = '01' AND sa.A1_LOJA IN ('01','02')
