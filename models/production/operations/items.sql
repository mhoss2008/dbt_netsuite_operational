with ITEM as (
    select * from {{ref('stg2_netsuite_items') }}
),

renamed as ( 

select * from ITEM

)

select * from renamed
