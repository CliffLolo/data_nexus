with source as (

    select * from {{ source('nutrisense', 'new_members') }}
)

select * from source
