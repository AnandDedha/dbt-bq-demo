{% set date_to_compare = '2023-01-15' %}


With date_macro as (
    Select {{compare_dates(date_to_compare)}} as date_compare_field, 
           {{yesterday_date()}} as part_key
)

Select * 
from date_macro