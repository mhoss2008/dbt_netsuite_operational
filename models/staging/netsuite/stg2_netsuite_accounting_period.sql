with FMON as (
select * from {{ref('raw2_netsuite_accounting_period') }} 
where isposting = 'T'
),
FQTR as (
select * from {{ref('raw2_netsuite_accounting_period') }} 
    where isquarter='T'
),
renamed as
(
select 
FMON.id,
right(FMON.PERIODNAME,4) as year,
left(FQTR.PERIODNAME,2) as quarter,
left(FMON.PERIODNAME,3) as month,
date_part(month, FMON.enddate) as month_number,
year||'-'||LPAD(month_number, 2, '0') as year_month,
FMON.startdate,
FMON.enddate
from FMON
left join FQTR on FQTR.id = FMON.parent
    )
select * from renamed