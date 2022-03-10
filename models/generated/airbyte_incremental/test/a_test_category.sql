{{ config(
    indexes = [{'columns':['_airbyte_emitted_at'],'type':'btree'}],
    unique_key = '_airbyte_ab_id',
    schema = "test",
    tags = [ "top-level" ]
) }}
-- Final base SQL model
-- depends_on: {{ ref('a_test_category_ab3') }}
select
    brand_di,
    created_on,
    category_id,
    display_name,
    _airbyte_ab_id,
    _airbyte_emitted_at,
    {{ current_timestamp() }} as _airbyte_normalized_at,
    _airbyte_a_test_category_hashid
from {{ ref('a_test_category_ab3') }}
-- a_test_category from {{ source('test', '_airbyte_raw_a_test_category') }}
where 1 = 1
{{ incremental_clause('_airbyte_emitted_at') }}

