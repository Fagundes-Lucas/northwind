with
    produtos as (
        select *
        from {{ ref('stg_erp__produtos') }}
    )

  , categorias as (
        select *
        from {{ ref('stg_erp_categorias') }}
    )

  , fornecedores as (
        select *
        from {{ ref('stg_erp_fornecedores') }}
    )


 , join_tabelas as(
    select 
        produtos.*
        , categorias.nome_categoria
        , categorias.descricao_categoria
        , fornecedores.nome_fornecedor
        , fornecedores.contato_fornecedor
        , fornecedores.endereco_fornecedor
        , fornecedores.cidade_fornecedor
        , fornecedores.regiao_fornecedor
        , fornecedores.cep_fornecedor
        , fornecedores.pais_fornecedor
    from produtos
    left join categorias on produtos.id_categoria = categorias.id_categoria
    left join fornecedores on produtos.id_fornecedor = fornecedores.id_fornecedor
 )

select *
from join_tabelas 