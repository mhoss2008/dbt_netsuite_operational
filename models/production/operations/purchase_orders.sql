with TRANSACTION as (
 
    select * from {{ref('stg2_netsuite_transactions') }}
    where transaction_type = 'PurchOrd'
) ,
renamed as (
    select
TRANSACTION.transaction_id,
TRANSACTION.tranid as po_number,
TRANSACTION.status_id,
TRANSACTION.status as status,
TRANSACTION.entity_name as vendor_name,
TRANSACTION.entity_email as vendor_email,
TRANSACTION.end_user_name,
TRANSACTION.end_user_cost_center,
TRANSACTION.end_user_email,
TRANSACTION.CREATEDDATE as date_created, 
TRANSACTION.DUEDATE as date_due, 
TRANSACTION.LASTMODIFIEDDATE as date_lastmodified,
TRANSACTION.externalid,
TRANSACTION.firmed,
TRANSACTION.memo,
TRANSACTION.number,
TRANSACTION.shipdate as date_ship,
TRANSACTION.transaction_date,
TRANSACTION.transactionnumber,
TRANSACTION.typebaseddocumentnumber,
TRANSACTION.trandisplayname,
TRANSACTION.void,
TRANSACTION.voided,
TRANSACTION.trandate_month as date_tran_month,
TRANSACTION.trandate_year_month as date_tran_year_month
from TRANSACTION

)
 
select * from renamed

