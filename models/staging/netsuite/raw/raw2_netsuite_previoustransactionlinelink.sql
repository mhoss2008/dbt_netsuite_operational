with PREVIOUSTRNASACTIONLINELINK as (
    select * from {{source('netsuite_tables_v2','PREVIOUSTRANSACTIONLINELINK') }}
)
select * from PREVIOUSTRNASACTIONLINELINK
