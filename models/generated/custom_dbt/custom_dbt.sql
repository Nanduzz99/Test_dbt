select
    a.brand_name,
    a.brand_id
from {{ ref('a_test_brand') }} a
left join {{ ref('a_test_category') }} b
on a._airbyte_a_test_brand_hashid = b._airbyte_a_test_category_hashid