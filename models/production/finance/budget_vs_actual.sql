

with BUDGET as (
    select 
    costcenter,
    DISPLAYNAMEWITHHIERARCHY,
    accnumber,
    amount,
    enddate,
    'Budget' as transaction_type
    from 
    {{ref('budget') }}
) ,
 BILL_DETAILS as (
    select 
    costcenter_fullname,
    account,
    account_number,
    net_amount,
    transaction_date, 
    'Bill' as source 
from  {{ref('bill_details') }}
) ,
renamed as (
    select * from BUDGET
    union all
    select * from BILL_DETAILS
)
 
select * from renamed
