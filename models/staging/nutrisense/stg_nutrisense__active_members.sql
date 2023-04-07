with source as (

    select * from {{ source('nutrisense', 'active_members') }}
)

select * from source


