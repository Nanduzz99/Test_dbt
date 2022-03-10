{{ config(
    indexes = [{'columns':['_airbyte_emitted_at'],'type':'btree'}],
    unique_key = '_airbyte_ab_id',
    schema = "_airbyte_test",
    tags = [ "top-level-intermediate" ]
) }}
-- SQL model to build a hash column based on the values of this record
-- depends_on: {{ ref('a_test_brand_ab2') }}
select
    {{ dbt_utils.surrogate_key([
        'brand_id',
        'brand_name',
        'created_on',
    ]) }} as _airbyte_a_test_brand_hashid,
    tmp.*
from {{ ref('a_test_brand_ab2') }} tmp
-- a_test_brand
where 1 = 1
{{ incremental_clause('_airbyte_emitted_at') }}

