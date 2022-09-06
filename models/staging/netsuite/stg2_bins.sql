
with BIN as (
    select * from {{ref('raw2_netsuite_bins') }}
), 

LOCATION as (
    select * from {{ref('raw2_netsuite_locations') }}
), 

renamed as ( 
select
BIN.ID,
BIN.BINNUMBER,
BIN.EXTERNALID,
BIN.ISINACTIVE,
BIN.MEMO,
LOCATION.fullname as location_name,
BIN._FIVETRAN_SYNCED

from BIN
left join location on location.id = BIN.location
where BIN._fivetran_deleted = 'FALSE'
)

select * from renamed
