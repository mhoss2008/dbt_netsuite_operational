-- Save model as 'dbt_results.sql'
-- sourced from https://medium.com/@oravidov/dbt-observability-101-how-to-monitor-dbt-run-and-test-results-f7e5f270d6b6
-- dbt run -m dbt_results
{{
  config(
    materialized = 'incremental',
    transient = False,
    unique_key = 'result_id'
  )
}}

with empty_table as (
    select
        null as result_id,
        null as invocation_id,
        null as unique_id,
        null as database_name,
        null as schema_name,
        null as name,
        null as description_name,
        null as resource_type,
        null as status,
        cast(null as float) as execution_time,
        cast(null as int) as rows_affected
)

select * from empty_table
-- This is a filter so we will never actually insert these values
where 1 = 0