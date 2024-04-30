QUERY PARA LISTAR TODOS OS OBJETOS DO BANCO DE DADOS:

USE PULSEBD;

SELECT name,
type_desc 
FROM sys.objects
WHERE type_desc IN (
'SQL_SCALAR_FUNCTION', 
'USER_TABLE', 
'SQL_STORED_PROCEDURE',
'VIEW'
)
ORDER BY type, name;
-------------------------------------------------------
-------------------------------------------------------
QUERY PARA LISTAR TODOS OS OBJETOS QUE USAM DETERMINADO OBJETO:

SELECT DISTINCT OBJECT_NAME(referencing_id) AS Object_Name
FROM sys.sql_expression_dependencies
WHERE referenced_entity_name = 'TESS_PEDIDOS';
-------------------------------------------------------
-------------------------------------------------------
QUERY PARA PEGAR A QUANTIDADE DE VEZES QUE O OBJETO É USADO:

SELECT DISTINCT referenced_entity_name, COUNT(OBJECT_NAME(referencing_id)) AS Object_Name
FROM sys.sql_expression_dependencies
WHERE referenced_entity_name = 'TESS_PEDIDOS'
GROUP BY referenced_entity_name
-------------------------------------------------------
-------------------------------------------------------
QUERY PARA CRIAR UMA TABELA TEMPORARIA:

CREATE TABLE #TodosObjetos (
    ObjetoNome NVARCHAR(100)
);
-------------------------------------------------------
-------------------------------------------------------
INSERIR DADOS NELA:

INSERT INTO #TodosObjetos (ObjetoNome)
VALUES ('FN_DVT_GET_TAMANHO_MARCACAO_SAFETECH')
-------------------------------------------------------
-------------------------------------------------------
QUERY PARA PEGAR A QUANTIDADE DE QUANTAS VEZES ESSE OBJETO É USADO COM AJUDA DA TABELA TEMPORARIA:

SELECT
    TObj.ObjetoNome AS Referenced_Entity_Name,
    COUNT(SQED.referencing_id) AS Object_Name_Count
FROM
    #TodosObjetos TObj
LEFT JOIN
    sys.sql_expression_dependencies SQED ON TOBJ.ObjetoNome = SQED.referenced_entity_name
GROUP BY
    TOBJ.ObjetoNome;

DROP TABLE #TodosObjetos;