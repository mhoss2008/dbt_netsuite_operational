
with LINES as (
 
    select * from {{ref('stg2_netsuite_transaction_lines') }}
    where mainline = 'F' and transaction_type = 'InvAdjst'
) ,
renamed as (
    select
    LINES.transaction_id,
    LINES.quantity,
    LINES.quantity_received,
    LINES.quantity_billed,
    LINES.unit_amount,
    LINES.rate_amount,
    LINES.net_amount,
    LINES.item_name,
    LINES.description, 
    LINES.vendor_part_id,
    LINES.transaction_line_number,
    LINES.costcenter,
    LINES.costcenter_parent,
    LINES.costcenter_fullname,
    LINES.mainline,
    LINES.account,
    LINES.account_number,
    LINES.transaction_date
    from LINES
)
 
select * from renamed
