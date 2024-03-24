{% macro compare_dates(date_to_compare) %}
    {% set current_date = modules.datetime.datetime.now().strftime("%Y-%m-%d") %}
    {% if date_to_compare < current_date %}
        'Before date logic' 
    {% elif date_to_compare == current_date %}
        'Same date logic'
    {% else %}
        'After date logic'
    {% endif %}
{% endmacro %}


{% macro yesterday_date() %}
  {% set partition_key = (modules.datetime.datetime.now() - modules.datetime.timedelta(days=1)).strftime("%Y-%m-%d") %}
  {{return (partition_key)}}
{% endmacro %}