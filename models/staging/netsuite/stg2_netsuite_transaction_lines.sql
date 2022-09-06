

with TRANSACTION_LINES as (
 
    select * from {{ref('raw2_netsuite_transaction_lines') }}
    where 
        (LINESEQUENCENUMBER is not NULL or ITEM is not NULL) and 
        _FIVETRAN_DELETED = 'FALSE'
), 
TRANSACTIONS as (
 
    select * from {{ref('stg2_netsuite_transactions') }}
), 

DEPARTMENTS as (
 
    select * from {{ref('stg2_netsuite_departments') }}

), 


ITEMS as (
 
    select * from {{ref('stg2_netsuite_items') }}

), 

ACCOUNTS as (
 
    select * from {{ref('raw2_netsuite_accounts') }}

),

renamed as ( 
select 
    --TRANSACTION_LINES.LINESEQUENCENUMBER as transaction_line_number
    TRANSACTIONS.transaction_type,
    TRANSACTIONS.transaction_date,
    TRANSACTION_LINES.transaction as transaction_id,
    TRANSACTION_LINES.id as transaction_line_number,
    ifnull(TRANSACTION_LINES.QUANTITY,1) as quantity,
    ifnull(TRANSACTION_LINES.QUANTITYSHIPRECV,0) as quantity_received,
    ifnull(TRANSACTION_LINES.QUANTITYBILLED,0) as quantity_billed,
    div0(TRANSACTION_LINES.RATE,TRANSACTION_LINES.QUANTITY) as unit_amount,
    TRANSACTION_LINES.rateamount as rate_amount,
    TRANSACTION_LINES.netamount as net_amount,
    ifnull(ITEMS.FULLNAME,ACCOUNTS.fullname) as item_name,
    TRANSACTION_LINES.expectedshipdate as expected_shipdate,
    TRANSACTION_LINES.expectedreceiptdate as expected_receiptdate,
    TRANSACTION_LINES.MEMO as description, 
    TRANSACTION_LINES.CUSTCOL_VENDOR_PART_ID as vendor_part_id,
    DEPARTMENTS.name as costcenter,
    DEPARTMENTS.parent_name as costcenter_parent,
    DEPARTMENTS.full_name as costcenter_fullname,
    TRANSACTION_LINES.mainline,
    ACCOUNTS.DISPLAYNAMEWITHHIERARCHY as account,
    ACCOUNTS.ACCTNUMBER as account_number,
    TRANSACTION_LINES.UNIQUEKEY as line_key,
    TRANSACTION_LINES.expenseaccount,
    TRANSACTION_LINES.kitmemberof

from 
    TRANSACTION_LINES
    inner join TRANSACTIONS on TRANSACTIONS.transaction_id = TRANSACTION_LINES.transaction
    left join ITEMS on ITEMS.id = TRANSACTION_LINES.ITEM
    left join ACCOUNTS on ACCOUNTS.id = TRANSACTION_LINES.EXPENSEACCOUNT
    left join DEPARTMENTS on TRANSACTION_LINES.department=DEPARTMENTS.department_id
) 
 
select * from renamed
