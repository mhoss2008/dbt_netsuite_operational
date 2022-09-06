with TRANSACTION as (
 
    select * from {{ref('stg2_netsuite_transactions') }}
    where transaction_type = 'SalesOrd'
) ,

SHIPPING_ADDRESS as (
    select * from {{ref('stg2_netsuite_transactionshippingaddress') }}
),
renamed as (
    select
TRANSACTION.transaction_id,
TRANSACTION.tranid as so_number,
TRANSACTION.status_id,
TRANSACTION.status as status,
TRANSACTION.entity_name as customer_name,
TRANSACTION.entity_email as customer_email,
TRANSACTION.CREATEDDATE as date_created, 
TRANSACTION.LASTMODIFIEDDATE as date_lastmodified,
TRANSACTION.externalid,
TRANSACTION.memo,
TRANSACTION.number,
TRANSACTION.transaction_date,
TRANSACTION.transactionnumber,
TRANSACTION.typebaseddocumentnumber,
TRANSACTION.trandisplayname,
TRANSACTION.void,
TRANSACTION.voided,
TRANSACTION.trandate_month as date_tran_month,
TRANSACTION.trandate_year_month as date_tran_year_month,
SHIPPING_ADDRESS.addrtext as ship_full_text,
SHIPPING_ADDRESS.addressee as ship_addressee,
SHIPPING_ADDRESS.attention as ship_attention,
SHIPPING_ADDRESS.addr1 as ship_addr1,
SHIPPING_ADDRESS.addr2 as ship_addr2,
SHIPPING_ADDRESS.addr3 as ship_addr3,
SHIPPING_ADDRESS.addrphone as ship_phone,
SHIPPING_ADDRESS.city as ship_city,
SHIPPING_ADDRESS.state as ship_state,
SHIPPING_ADDRESS.zip as ship_zip,
SHIPPING_ADDRESS.country as ship_country

from TRANSACTION
left join SHIPPING_ADDRESS on SHIPPING_ADDRESS.shippingaddress_id = TRANSACTION.shippingaddress_id
)
 
select * from renamed

