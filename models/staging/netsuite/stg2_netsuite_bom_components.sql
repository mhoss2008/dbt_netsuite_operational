with BOMREVISIONCOMPONENT as (
    select * from {{ref('raw2_netsuite_bomrevisioncomponent') }}
), 

ITEMS as (
    select * from {{ref('stg2_netsuite_items') }}
), 
stg_BOMASSEMBLY as (
    select * from {{ref('stg2_netsuite_bom_assembly') }}
), 

renamed as ( 

select 
bomrevisioncomponent.BOMQUANTITY,
bomrevisioncomponent.componentyield,
bomrevisioncomponent.description,
items.fullname as item_name,
bomrevisioncomponent.itemsource,
bomrevisioncomponent.quantity,
bomrevisioncomponent.units,
BOMREVISIONCOMPONENT.item as item_id,
bomrevisioncomponent.BOMREVISION,
stg_BOMASSEMBLY.item_id as assembly_id,
stg_BOMASSEMBLY.billofmaterials

from BOMREVISIONCOMPONENT
left join ITEMS on items.id = BOMREVISIONCOMPONENT.item
left join stg_BOMASSEMBLY on stg_BOMASSEMBLY.billofmaterials = BOMREVISIONCOMPONENT.BOMREVISION
)

select * from renamed