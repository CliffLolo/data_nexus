with source as (

    select * from {{ source('nutrisense', 'subscriptions')}}

)

select * from source