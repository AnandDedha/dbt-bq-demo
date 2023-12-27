{% macro get_date_parts(date_column) %}

   ( SELECT struct (
        {{ date_column }} AS original_date,
        EXTRACT(YEAR FROM {{ date_column }}) AS year,
        EXTRACT(MONTH FROM {{ date_column }}) AS month,
        EXTRACT(DAY FROM {{ date_column }}) AS day,
        EXTRACT(DAYOFWEEK FROM {{ date_column }}) AS day_of_week,
        EXTRACT(DAYOFYEAR FROM {{ date_column }}) AS day_of_year,
        EXTRACT(WEEK FROM {{ date_column }}) AS week,
        EXTRACT(QUARTER FROM {{ date_column }}) AS quarter ) as extract_date
   )
{% endmacro %}