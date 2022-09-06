with item_fulfillment_details as (

  select 
    sales_order_transaction_id,
    late_days,
    on_time,
    transaction_date as otif_date,
    row_number() over (partition by sales_order_transaction_id order by on_time desc) as row_number
  from {{ref('item_fulfillment_details') }}
),

renamed as (
    select *
from item_fulfillment_details
where row_number = 1
   
)
select * from renamed

