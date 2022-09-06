with INVENTORYNUMBER as (
    select * from {{source('netsuite_tables_v2','INVENTORYNUMBER') }}
)
select * from INVENTORYNUMBER
