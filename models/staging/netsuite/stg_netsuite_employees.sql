
with EMPLOYEES as (
 
    select * from {{ref('raw_netsuite_employees') }}
 
), 
SUPERVISOR as (
 
    select * from {{ref('raw_netsuite_employees') }}
 
), 
DEPARTMENTS as (
 
    select * from {{ref('stg_netsuite_departments') }}
 
), 
renamed as (
 
    select  
    EMPLOYEES.id as netsuite_employee_id,
    EMPLOYEES.externalid as employee_id,
    EMPLOYEES.firstname as firstname,
    EMPLOYEES.lastname as lastname,
    EMPLOYEES.firstname || ' ' ||  EMPLOYEES.lastname as full_name,
    EMPLOYEES.email as email,
    EMPLOYEES.TITLE as jobtitle,
    SUPERVISOR.firstname || ' ' ||  SUPERVISOR.lastname as supervisor_name,
    SUPERVISOR.id as netsuite_supervisor_id,
    DEPARTMENTS.NAME as cost_center,
    DEPARTMENTS.Parent_name as parent_cost_center,
    EMPLOYEES.LASTMODIFIEDDATE as last_modified_date,
    EMPLOYEES.ISINACTIVE

    from EMPLOYEES
    left join DEPARTMENTS on DEPARTMENTS.department_id = EMPLOYEES.department
    left join SUPERVISOR on SUPERVISOR.id = EMPLOYEES.supervisor
) 
 
select * from renamed
