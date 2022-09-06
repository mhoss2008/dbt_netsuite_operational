with LINES as (
 
    select * from {{ref('stg2_netsuite_transaction_lines') }}
    where mainline = 'F' and transaction_type = 'PurchOrd'
),

renamed as (
    select
    LINES.transaction_id,
    LINES.quantity as qty,
    LINES.quantity_received as qty_received,
    LINES.quantity_billed as qty_billed,
    LINES.expected_shipdate as date_expected_ship,
    LINES.expected_receiptdate as date_expected_receipt,
    LINES.unit_amount,
    LINES.rate_amount,
    LINES.net_amount,
    LINES.item_name as item_number,
    LINES.description as line_description, 
    LINES.vendor_part_id,
    LINES.transaction_line_number,
    LINES.costcenter,
    LINES.costcenter_parent,
    LINES.costcenter_fullname,
    LINES.mainline,
    LINES.transaction_date
    from LINES
)
 
select * from renamed

