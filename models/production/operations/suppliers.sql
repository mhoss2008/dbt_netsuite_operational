with VENDORS as (
 
    select * from {{ref('stg2_netsuite_vendors') }}
) ,

renamed as (
    select
*

from VENDORS
)
 
select * from renamed

