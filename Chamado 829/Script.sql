SELECT DISTINCT 
tb.cod_erp as Codigo,
tb.filial_erp as Filial,
sa.A1_XXDCONT as Desconto_Contratual, 
tb.NivelPoliticaComercial AS Nivel_De_Desconto, 
tcpc.Desconto AS Desconto
FROM DADOSADV.dbo.SA1100 as sa

JOIN EXTRANET.dbo.TB_CLIENTE as tb 
on sa.A1_COD COLLATE SQL_Latin1_General_CP850_BIN =
tb.grupo_codigo COLLATE SQL_Latin1_General_CP850_BIN

left JOIN EXTRANET.dbo.tb_cliente_politica_comercial as tcpc
on tb.NivelPoliticaComercial =  tcpc.Nivel 

WHERE tb.cod_erp IN ('08051')
