
with DEPARTMENTS as (
    select * from {{ref('raw2_netsuite_departments') }}
), 
PARENTS as (
   select * from {{ref('raw2_netsuite_departments') }}
),

renamed as (
 
    select 
        DEPARTMENTS.ID as department_id, 
        DEPARTMENTS.FULLNAME as full_name, 
        DEPARTMENTS.ISINACTIVE as isinactive, 
        DEPARTMENTS.NAME as name,
        Parents.Name as parent_name

    from DEPARTMENTS
    left join PARENTS on PARENTS.id = DEPARTMENTS.parent

) 
 
select * from renamed
