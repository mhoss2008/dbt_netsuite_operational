 with TRACKINGNUMBER as (
    select * from {{ref('raw2_netsuite_trackingnumber') }}
    where _FIVETRAN_DELETED = FALSE
), 
TRACKINGNUMBERMAP as (
    select * from {{ref('raw2_netsuite_trackingnumbermap') }}
), 

renamed as ( 
select
TRACKINGNUMBER.ID as nsid,
TRACKINGNUMBER.TRACKINGNUMBER as trackingnumber,
TRACKINGNUMBERMAP.TRANSACTION as transaction

from TRACKINGNUMBER
left join TRACKINGNUMBERMAP on TRACKINGNUMBERMAP.TRACKINGNUMBER = TRACKINGNUMBER.ID
)
select * from renamed


