SELECT DISTINCT SA.A1_DTCAD AS DataCadastro,
VIC.CodigoCliente AS CodigoCliente,
SA.A1_FILIAL as Filial, 
VIC.Cnpj as Cnpj,
VIC.RazaoSocial as RazaoSocial,
VIC.NomeFantasia as NomeFantasia,
VIC.UF as UF
FROM PULSEBD.dbo.VW_INTM_CLIENTE as VIC
JOIN DADOSADV.dbo.SA1100 AS SA
ON SA.A1_CGC = VIC.Cnpj AND SA.A1_COD = VIC.GrupoEcomnomico 
WHERE VIC.CodigoSituacaoCliente = '' 
OR VIC.UF = 'EX'
