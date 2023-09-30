with 
    employees as (
        select *
        from {{ ref('dim_employees') }}
    )

    , produtos as (
        select *
        from {{ ref('dim_products') }}
    )

    , pedido_itens as (
        select *
        from {{ ref('int_vendas__pedidos_itens') }}
    )

    , joined_tabelas as (
        select
             pedido_itens.pk_vendas
            , produtos.id_produto
            , employees.funcionario_id
            , pedido_itens.id_transportadora
            , pedido_itens.desconto_perc
            , pedido_itens.preco_da_unidade
            , pedido_itens.quantidade
            , pedido_itens.frete
            , pedido_itens.data_do_pedido
            , pedido_itens.data_do_envio
            , pedido_itens.data_requerida_entrega
            , pedido_itens.destinatario
            , pedido_itens.endereco_destinatario
            , pedido_itens.cep_destinatario
            , pedido_itens.cidade_destinatario
            , pedido_itens.regiao_destinatario
            , pedido_itens.pais_destinatario
            , employees.nome_completo as funcionario_nome_completo
            , employees.Nome_gerente as gerente_nome_completo
            , produtos.nome_produto
            , produtos.nome_categoria
            , produtos.nome_fornecedor
            , produtos.is_discontinuado
        from pedido_itens
        left join produtos on pedido_itens.id_produto = produtos.id_produto
        left join employees on pedido_itens.id_funcionario = employees.funcionario_id
    )

select *
from joined_tabelas