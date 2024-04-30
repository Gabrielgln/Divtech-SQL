SELECT
	RTRIM(E4_CODIGO) CodCondicaoPagamento, 
	RTRIM(E4_DESCRI) Descricao,
	--RTRIM(E4_XXPZMED) PrazoMedio,
	CAST(E4_XXPZMED as NUMERIC(5,0)) PrazoMedio,
	CASE 
        WHEN E4_XXPZMED IS NOT NULL AND 
             E4_DESCRI LIKE '%PROMO%' AND 
             CHARINDEX('DD', E4_DESCRI, CHARINDEX('+', E4_DESCRI)) > 0 THEN
             E4_XXPZMED + CAST(SUBSTRING(E4_DESCRI, CHARINDEX('+', E4_DESCRI) + 2, CHARINDEX('DD', E4_DESCRI, CHARINDEX('+', E4_DESCRI)) - (CHARINDEX('+', E4_DESCRI) + 	     2)) AS NUMERIC(5, 0))
        ELSE
            null
    	END AS PrazoMedioPromocional,
	LEN(substring(E4_COND, 1, CHARINDEX(']', E4_COND, 1))) 
	- LEN(REPLACE(substring(E4_COND, 1, CHARINDEX(']', E4_COND, 1)), ',', '')) + 1 QtdParcela,
	E4_XPARMIN ValorMinimoParcela,
	CAST(E4_XDESCPG as NUMERIC(5,0)) DescontoMaximo,
	--'1' IndAtivo,
	CAST('1' as NUMERIC(5,0)) IndAtivo,
	--NULL ID,
	CAST(NULL as NUMERIC(9,0)) ID,
	--0 Acrescimo,
	CAST(0 as NUMERIC(5,0)) Acrescimo,
	(
	SELECT
		MAX(RTRIM(Z07.Z07_CODGRP))
	FROM
		DADOSADV.dbo.Z07100 Z07 WITH (NOLOCK)
	WHERE
		Z07.D_E_L_E_T_ = ''
		AND Z07.Z07_FILIAL = '01'
		AND Z07.Z07_CODCPG  = E4_CODIGO
	) CodExterno
FROM
	DADOSADV.dbo.SE4100 WITH (NOLOCK)
WHERE
	( E4_FILIAL = '' )
	AND ( E4_XXLIBZK = 'S' )
	AND ( E4_MSEXP = '' )
	AND ( D_E_L_E_T_ = '' );