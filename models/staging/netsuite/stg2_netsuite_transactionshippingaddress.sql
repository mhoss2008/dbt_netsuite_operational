 with TRANSACTIONSHIPPINGADDRESS as (
    select * from {{ref('raw2_netsuite_transactionshippingaddress') }}
), 

renamed as ( 
select
nkey as shippingaddress_id,
addr1,
addr2,
addr3,
addressee,
addrphone,
addrtext,
attention,
city,
country,
lastmodifieddate,
override,
recordowner as owner_id,
state,
zip

from TRANSACTIONSHIPPINGADDRESS
)
select * from renamed


