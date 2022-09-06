with LINES as (
 
    select * from {{ref('stg2_netsuite_transaction_line_links') }}
    where 
        transaction_type = 'ItemShip' and 
        expenseaccount is null and
        kitmemberof is null 
        --mainline = 'F'
),
ORDERLINES as (
    select * from {{ref('sales_order_details') }}
),

renamed as (
    select
    LINES.transaction_id,
    LINES.transaction_date,
    iff(lines.kitmemberof is null,LINES.quantity,LINES.quantity*-1) as qty,
    LINES.item_name as item_number,
    LINES.transaction_line_number,
    LINES.previous_transaction_id as sales_order_transaction_id,
    LINES.previous_transaction_line_number as sales_order_line_number,
    LINES.previous_transaction_type,
    LINES.kitmemberof as kit_line_number,
    ORDERLINES.date_expected_ship,
    datediff(day, ORDERLINES.date_expected_ship, LINES.transaction_date) as late_days,
    iff(ORDERLINES.date_expected_ship >= LINES.transaction_date,true,false) as on_time,
    costcenter,
    costcenter_parent,
    costcenter_fullname

    from LINES
    left join ORDERLINES on ORDERLINES.transaction_id=LINES.previous_transaction_id and ORDERLINES.transaction_line_number=LINES.previous_transaction_line_number
)
select * from renamed

