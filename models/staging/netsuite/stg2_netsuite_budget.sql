with budget as (
    select * from {{ref('raw2_netsuite_budget') }} 
),
SUBSIDIARY as (
    select * from {{ref('raw2_netsuite_subsidiary') }} 
),
NSACCOUNT as (
    select * from {{ref('raw2_netsuite_accounts') }}  
),
CATEGORIES as (
 select * from {{ref('raw2_netsuite_budgetcategories') }} 
),
COSTCENTER as (
 select * from {{ref('raw2_netsuite_departments') }} 
),
BUDGETSMACHINE as (
 select * from {{ref('raw2_netsuite_budgetline') }}
),
ACCOUNTING_PERIOD as(
select * from {{ref('stg2_netsuite_accounting_period') }}
    
),
renamed as(
select
BUDGETSMACHINE.amount,
BUDGETSMACHINE.budget,
ACCOUNTING_PERIOD.year,
ACCOUNTING_PERIOD.month,
ACCOUNTING_PERIOD.year_month,
ACCOUNTING_PERIOD.startdate,
ACCOUNTING_PERIOD.enddate,
subsidiary.fullname as subsidiary,
NSACCOUNT.ACCOUNTSEARCHDISPLAYNAME as account,
NSACCOUNT.DISPLAYNAMEWITHHIERARCHY,
NSACCOUNT.ACCTNUMBER as accnumber,
CATEGORIES.name as budget_category,
Costcenter.fullname as costcenter

    from BUDGETSMACHINE
    left join ACCOUNTING_PERIOD on ACCOUNTING_PERIOD.id = BUDGETSMACHINE.period
    left join BUDGET on Budget.id = BUDGETSMACHINE.budget
    left join SUBSIDIARY on SUBSIDIARY.id = BUDGET.subsidiary
    left join NSACCOUNT on NSACCOUNT.id = BUDGET.account
    left join CATEGORIES on CATEGORIES.id = BUDGET.CATEGORY
    left join COSTCENTER on COSTCENTER.id = BUDGET.department

    )
select * from renamed

