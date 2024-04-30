select DISTINCT sa.A1_CGC as Cnpj_Protheus,
vigr.CNPJ as Cnpj_Grupo_Regional,
case
	when sa.A1_CGC IS NULL
	THEN 'Sem cadastro no Protheus'
end as Observacao

from DADOSADV.dbo.SA1100 as sa
right join VW_INTM_GRUPO_REGIONAL as vigr on sa.A1_CGC = vigr.CNPJ
where vigr.CNPJ in ('38578339800','33982352800','21383623880','25169918860')