
with LINES as (
 
    select * from {{ref('stg2_netsuite_transaction_lines') }}

),
PREVIOUSTRANLINE as (
 
    select * from {{ref('raw2_netsuite_previoustransactionlinelink') }}
    where _FIVETRAN_DELETED = 'FALSE'
),


renamed as (
    select
    LINES.*,
    PREVIOUSTRANLINE.previousdoc as previous_transaction_id,
    PREVIOUSTRANLINE.previousline as previous_transaction_line_number,
    PREVIOUSTRANLINE.previoustype as previous_transaction_type


    from LINES
    left join PREVIOUSTRANLINE on PREVIOUSTRANLINE.nextdoc = LINES.transaction_id and PREVIOUSTRANLINE.nextline = LINES.transaction_line_number
)
 
select * from renamed



