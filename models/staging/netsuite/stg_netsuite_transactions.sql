with ENTITY as (
select * from {{ref('raw_netsuite_entity') }} 
),
TRANSACTION as (
select * from {{ref('raw_netsuite_transactions') }}
-- where _FIVETRAN_DELETED = 'FALSE'
),
STATUS_CODES as (
select * from {{ref('netsuite_status_codes') }}
),
CREATED_BY as (
select * from {{ref('stg_netsuite_employees') }}    
),
LAST_TRAN as (
    select * from {{ref('stg_netsuite_lasttranlink') }}
),
NEXT_TRAN as (
    select * from {{ref('stg_netsuite_nexttranlink') }}
),

renamed as ( 
select 
TRANSACTION.id as transaction_id,
TRANSACTION.type as transaction_type,
TRANSACTION.status as status_id,
STATUS_CODES.DESCRIPTION as status,
ENTITY.id as entity_id,
ENTITY.ENTITYID as entity_name,
ENTITY.email as entity_email,
CREATED_BY.full_name as created_by_name,
TRANSACTION.CREATEDDATE, 
TRANSACTION.DUEDATE, 
TRANSACTION.LASTMODIFIEDDATE,
TRANSACTION.externalid,
TRANSACTION.firmed,
TRANSACTION.memo,
TRANSACTION.number,
TRANSACTION.shipdate,
TRANSACTION.trandate as transaction_date,
TRANSACTION.tranid,
TRANSACTION.transactionnumber,
TRANSACTION.typebaseddocumentnumber,
TRANSACTION.trandisplayname,
TRANSACTION.void,
TRANSACTION.voided,
TRANSACTION.shippingaddress as shippingaddress_id,
date_part(month, TRANSACTION.TRANDATE) as trandate_month,
date_part(year, TRANSACTION.TRANDATE)||'-'||LPAD(trandate_month, 2, '0') as trandate_year_month,
LAST_TRAN.single_last_tranid,
LAST_TRAN.all_last_tranid,
NEXT_TRAN.single_next_tranid,
NEXT_TRAN.all_next_tranid
--ADJUSTMENT TYPE
--header cost center
--ADJUSTMENT ACCOUNT

from TRANSACTION
left join ENTITY on TRANSACTION.entity = ENTITY.id
left join STATUS_CODES on upper(TRANSACTION.type)||':'||TRANSACTION.status = STATUS_CODES.id
left join CREATED_BY on TRANSACTION.CREATEDBY=CREATED_BY.netsuite_employee_id 
left join LAST_TRAN on LAST_TRAN.nsid = TRANSACTION.id
left join NEXT_TRAN on NEXT_TRAN.nsid = TRANSACTION.id


)
select * from renamed

