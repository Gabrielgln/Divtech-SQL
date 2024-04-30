select
vigr.CNPJ as Cnpj_Do_Representante,
vigr.CodigoRegional as Regional_Do_Representante,
vic.Cnpj as Cnpj_Do_Cliente,
vic.CodigoRepresentante as Regional_Do_Cliente 
from PULSEBD.dbo.VW_INTM_GRUPO_REGIONAL as vigr ,PULSEBD.dbo.VW_INTM_CLIENTE as vic 
WHERE vic.NomeFantasia like '%ZWANZE%'
and vigr.CNPJ = '07961921000160'
