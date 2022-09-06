with SUBSIDIARY as (
    select * from {{source('netsuite_tables_v2','SUBSIDIARY') }}
)
select * from SUBSIDIARY