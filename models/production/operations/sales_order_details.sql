with LINES as (
 
    select * from {{ref('stg2_netsuite_transaction_lines') }}
    where 
        mainline = 'F' and 
        transaction_type = 'SalesOrd' and
        kitmemberof is null
),

renamed as (
    select
    LINES.transaction_id,
    LINES.quantity as qty,
    LINES.quantity_received as qty_received,
    LINES.quantity_billed as qty_billed,
    LINES.expected_shipdate as date_expected_ship,
    LINES.item_name as item_number,
    LINES.description as line_description, 
    LINES.transaction_line_number,
    LINES.transaction_date

    from LINES
)
 
select * from renamed

