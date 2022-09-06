with BOMASSEMBLY as (
    select * from {{ref('raw2_netsuite_bomassembly') }}
), 

BOMREVISION as (
    select * from {{ref('raw2_netsuite_bomrevision') }}
), 

ITEMS as (
    select * from {{ref('stg2_netsuite_items') }}
), 

renamed as ( 
select 
BOMASSEMBLY.assembly as item_id,
BOMASSEMBLY.billofmaterials,
ITEMS.fullname as item_name,
BOMREVISION.name as bom_revision,
BOMASSEMBLY.masterdefault

from BOMASSEMBLY
left join ITEMS on items.id = BOMASSEMBLY.assembly 
left join BOMREVISION on bomrevision.BILLOFMATERIALS = BOMASSEMBLY.billofmaterials
where masterdefault = 'T'
)

select * from renamed