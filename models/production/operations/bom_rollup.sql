

WITH RECURSIVE 
bom_drilldown  (indent, levels, item_id, assembly_id, component_name,ITEMSOURCE,Top_Assembly,sort_key) 
    as

      (

          select '' as indent,0 as levels,item_id,Null as assembly_id,item_name as component_name,'Assembly' as ITEMSOURCE,item_name,elembio.operations.skey(item_id) as sort_key            
          from dbt.dbt.stg2_netsuite_bom_assembly as ASSEMBLIES
          where masterdefault = 'T' 
        union all

        select indent || '--- ',bom_drilldown.levels+1 as levels,
            components.item_id, components.assembly_id, components.item_name,components.ITEMSOURCE,bom_drilldown.Top_Assembly as Top_Assembly,sort_key || elembio.operations.skey(components.item_id)
          from dbt.dbt.stg2_netsuite_bom_components as COMPONENTS
           join bom_drilldown on bom_drilldown.item_id = components.assembly_id 
          
      ),

renamed as ( 

  select indent || component_name as item_name, levels, item_id, assembly_id,ITEMSOURCE,Top_Assembly,sort_key
    from bom_drilldown
    order by sort_key

)

select * from renamed
