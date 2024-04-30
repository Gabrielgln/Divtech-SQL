select tc.cnpj as Cnpj,
tca.observacao as Observacao,
tca.dt_aprovacao as Data_Da_Aprovacao
from tb_cliente as tc
join tb_cliente_aprovacao as tca on tc.id = tca.cliente_id
join tb_cadastro_usuario as tcu on tca.usuario_id = tcu.id
where tc.cnpj = '50376603000160'
