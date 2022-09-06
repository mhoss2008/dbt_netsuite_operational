with TRANSACTIONSHIPPINGADDRESS as (
    select * from {{source('netsuite_tables_v2','TRANSACTIONSHIPPINGADDRESS') }}
)
select * from TRANSACTIONSHIPPINGADDRESS
