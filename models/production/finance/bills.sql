
with TRANSACTION as (
 
    select * from {{ref('stg2_netsuite_transactions') }}
    where transaction_type = 'VendBill' or transaction_type = 'VendCred'
), 

renamed as (
    select
TRANSACTION.transaction_id,
TRANSACTION.transaction_type,
TRANSACTION.status_id,
TRANSACTION.status,
TRANSACTION.entity_name as vendor_name,
TRANSACTION.entity_id as vendor_id,
TRANSACTION.entity_email as vendor_email,
TRANSACTION.end_user_name,
TRANSACTION.end_user_cost_center,
TRANSACTION.end_user_email,
TRANSACTION.CREATEDDATE, 
TRANSACTION.DUEDATE, 
TRANSACTION.LASTMODIFIEDDATE,
TRANSACTION.externalid,
TRANSACTION.firmed,
TRANSACTION.memo,
TRANSACTION.number,
TRANSACTION.shipdate,
TRANSACTION.transaction_date,
TRANSACTION.tranid,
TRANSACTION.transactionnumber,
TRANSACTION.typebaseddocumentnumber,
TRANSACTION.trandisplayname,
TRANSACTION.void,
TRANSACTION.voided,
TRANSACTION.trandate_month,
TRANSACTION.trandate_year_month,
TRANSACTION.single_last_tranid,
TRANSACTION.all_last_tranid,
TRANSACTION.single_next_tranid,
TRANSACTION.all_next_tranid

from TRANSACTION
)
 
select * from renamed

