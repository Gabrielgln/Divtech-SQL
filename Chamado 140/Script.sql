SELECT sa.A1_COD, sa.A1_FILIAL, sa.A1_LOJA, sa.A1_XXDCONT, tb.NivelPoliticaComercial FROM SA1100 as sa

JOIN EXTRANET.dbo.TB_CLIENTE as tb on sa.A1_COD COLLATE SQL_Latin1_General_CP850_BIN =

tb.grupo_codigo COLLATE SQL_Latin1_General_CP850_BIN

WHERE sa.A1_COD IN ('11203','03201') AND

sa.A1_FILIAL = '01' AND sa.A1_LOJA IN ('01','02')



Tabela para verificar o desconto:

tb_cliente_politica_comercial