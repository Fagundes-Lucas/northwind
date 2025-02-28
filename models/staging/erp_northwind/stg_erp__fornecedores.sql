with
    source_supplier as (
        select 
             cast(supplier_id as int) as id_fornecedor
            , cast(company_name as string) as nome_fornecedor
            , cast(contact_name as string) as contato_fornecedor
            , cast(address as string) as endereco_fornecedor
            , cast(city as string) as cidade_fornecedor
            , cast(region as string) as regiao_fornecedor
            , cast(postal_code as string) as cep_fornecedor
            , cast(country as string) as pais_fornecedor
        from {{ source('erp', 'suppliers') }}
    ) 

select *
from source_supplier