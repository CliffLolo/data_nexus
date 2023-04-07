with source as (

    select * from {{ source('nutrisense', 'subscription')}}

)

select * from source