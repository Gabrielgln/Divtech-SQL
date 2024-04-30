-- dbo.VW_ClientesProtheus source

-- dbo.VW_ClientesProtheus source

-- dbo.VW_ClientesProtheus source

-- dbo.VW_ClientesProtheus source

-- dbo.VW_ClientesProtheus source

-- dbo.VW_ClientesProtheus source

--SET QUOTED_IDENTIFIER ON
--GO






----USE WISESALE
----select	* from [VW_ClientesProtheus]

----DROP VIEW [dbo].[VW_ClientesProtheus] 

CREATE VIEW [dbo].[VW_ClientesProtheus] 

as

SELECT
	--TOP 1000
		'S2' [EMPRESA],
		RTRIM(Marca) [MARCA],
		getDate() [DT_INCLUSAO],
		RTRIM(A1_CGC) [CNPJ],
		RTRIM(A1_NOME) [RAZAO_SOCIAL],
		RTRIM(A3_NOME) [REPRESENTANTE],
		RTRIM(Regional) [CODREPRES],
		RTRIM(A1_COD) + '-' + RTRIM (A1_LOJA) [CODCLIFAB],
		RTRIM(A1_NREDUZ) [NOME_FANTASIA],
		RTRIM(LEFT(A1_END, 50)) [ENDERECO],
		'' [NUMERO],
		RTRIM(A1_CSCOMP) [COMPL],
		RTRIM(A1_BAIRRO) [BAIRRO],
		RTRIM(A1_MUN) [CIDADE],
		RTRIM(A1_EST) [UF],
		RTRIM(A1_CEP) [CEP],
		RTRIM(YA_DESCR) [PAIS],
		CASE
		RTRIM(A1_STATUS) 
			WHEN 'A' THEN 'Ativo'
		WHEN 'I' THEN 'Inativo'
		WHEN 'C' THEN 'Cancelado'
		WHEN 'S' THEN 'Suspenso'
		ELSE A1_STATUS
	END [STATUS],								
		RTRIM(A1_TRANSP) [TRANSPORTADORA],
		RTRIM(TabelaPreco) [TAB_PRECO],
		RTRIM(LEFT(A1_ENDENT, 50)) [ENDERECO_ENTREGA],
		'' [NUMERO_ENTREGA],
		RTRIM(A1_CSCOMPE) [COMPL_ENTREGA],
		RTRIM(A1_BAIRROE) [BAIRRO_ENTREGA],
		RTRIM(A1_MUNE) [CIDADE_ENTREGA],
		RTRIM(A1_ESTE) [UF_ENTREGA],
		RTRIM(A1_CEPE) [CEP_ENTREGA],
		RTRIM(YA_DESCR) [PAIS_ENTREGA],		
		RTRIM(A1_TEL) [TELEFONE],
		'' [TELEFONE2],
		'' [CELULAR],
		RTRIM(A1_INSCR) [INSCR_EST],
		'' [DT_FUNDACAO],
		RTRIM(A1_CONTATO) [CONTATO],
		'' [FORMA_PAGTO],
		'' [LIMITE_CREDITO],
		'' [TIPO_BLOQUEIO],
		'' [TIPO_CLIENTE],
		RTRIM(A1_EMAIL) [EMAIL],
		RTRIM(A1_SUFRAMA) [INSCR_SUFRAMA],
		RTRIM(LEFT(A1_ENDAC1,
	50)) [SOCIO1_ENDERECO],
		RTRIM(A1_INSCRM) [INSCR_MUN],
		'' [DDD_TELEFONE],
		'' [DDD_TELEFONE2],
		'' [DDD_CELULAR],
		'' [DEPTO]
FROM
	DADOSADV..SA1100 with (nolock)
JOIN		
		DADOSADV..SYA100 with (nolock) on
	YA_CODGI = A1_PAIS
JOIN
		EXTRANET..tb_cliente_regional on
	A1_COD = Cliente COLLATE Latin1_General_CI_AS
	AND A1_LOJA = Loja COLLATE Latin1_General_CI_AS
JOIN
		DADOSADV..SA3100 with (nolock) ON
	Regional = RTRIM(A3_COD) COLLATE Latin1_General_CI_AS
WHERE
	1 = 1
	AND A1_FILIAL = '01'
	AND SA1100.D_E_L_E_T_ = ''
	AND A1_PESSOA = 'J'
	AND A1_VEND NOT IN ('319', '000001')
	AND		 RTRIM(A1_MSEXP) = ''
	--OR	( RTRIM(A1_MSEXP) >= CONVERT( varchar(8), GETDATE() - 3 , 112 ) 
	--	AND NOT EXISTS (
	--			select	1 
	--			from	WISESALE..WS_CLIENTES 
	--			where	CODCLIFAB = RTRIM(A1_COD) + '-' + RTRIM (A1_LOJA) 
	--			--and		DT_INTEGRACAO IS NOT NULL	
	--			)
	--		)
	--	)
	--AND A1_CGC = '46946243000118'
	AND (RTRIM(A1_COD) <> '')
	AND (RTRIM(A1_LOJA) <> '')
	AND (RTRIM(A1_NOME) <> '')
	AND (RTRIM(A1_END) <> '')
	AND (ISNULL(A1_VEND,
	'') <> '')
	AND (ISNULL(A1_XCANDIS,
	'') <> '')
	AND (RTRIM(A1_CGC) <> '')
	AND (A1_CGC <> '00000000000000')
	AND (A1_CGC <> '00000000000')
	AND (Marca = 'REDLEY')
	--and		Regional not in (671, 675);