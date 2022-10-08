with ITEM as (
    select * from {{ref('raw_netsuite_items') }}
), 
UOM_STOCKUNIT as (
    select * from {{ref('raw_netsuite_uom') }}
), 

renamed as (
     
select
item.CUSTITEM_ARENA_CATEGORY_NAME as arena_category, 
split_part(arena_category, '\\', -1) as arena_category_last,
item.description as item_description, 
item.displayname, 
item.fullname, 
item.itemid, 
item.itemtype, 
item.lastmodifieddate, 
item.lastpurchaseprice,
item.leadtime, 
item.location, 
item.manufacturer, 
item.minimumquantity, 
item.maximumquantity, 
item.planningitemcategory, 
item.purchasedescription, 
item.safetystocklevel, 
item.subtype, 
UOM_STOCKUNIT.abbreviation as stock_uom,
item.saleunit,
item.supplyreplenishmentmethod, 
item.totalquantityonhand,
item.totalvalue,
item.vendorname,
item.custitemsalesforce_sync,
item.id,
item._fivetran_synced

from item
left join UOM_STOCKUNIT on UOM_STOCKUNIT.internalid = ITEM.stockunit
where item._fivetran_deleted = 'FALSE'
)
select * from renamed
