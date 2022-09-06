with ITEM as (
    select * from {{ref('stg2_netsuite_items')}}
), 

INVENTORYNUMBER as (
    select * from {{ref('raw2_netsuite_inventorynumber')}}
), 

BININVENTORYBALANCE as (
    select * from {{ref('raw2_netsuite_bininventorybalance')}}
),
 
BIN as (
    select * from {{ref('stg2_bins')}}
), 

renamed as (
select
ITEM.fullname as Part_Number,
ITEM.itemtype as Item_Type,
ITEM.item_description as Item_Desc,
ITEM.Arena_Category as Arena_Category,
BININVENTORYBALANCE.QUANTITYAVAILABLE as Qty_Avail,
BININVENTORYBALANCE.QUANTITYONHAND as Qty_on_Hand, 
BININVENTORYBALANCE.QUANTITYPICKED as Qty_Picked,
ITEM.stock_uom,
BININVENTORYBALANCE.COMMITTEDQTYPERSERIALLOTNUMBER,
BININVENTORYBALANCE.COMMITTEDQTYPERLOCATION,
INVENTORYNUMBER.inventorynumber as Serial_Number,
BIN.binnumber as Bin_Number, 
BIN.location_name as Location,
BININVENTORYBALANCE._FIVETRAN_SYNCED as Last_Updated

from BININVENTORYBALANCE
left join INVENTORYNUMBER on INVENTORYNUMBER.id = BININVENTORYBALANCE.inventorynumber
left join ITEM on ITEM.id = BININVENTORYBALANCE.item 
left join BIN on BIN.id = bininventorybalance.binnumber

where BININVENTORYBALANCE._fivetran_deleted = 'FALSE'

)

select * from renamed
