
select
  size,
  {{ dbt_utils.pivot(
      'color',
      dbt_utils.get_column_values(ref('product'), column='color')
  ) }}
from {{ ref('product') }}
group by size
