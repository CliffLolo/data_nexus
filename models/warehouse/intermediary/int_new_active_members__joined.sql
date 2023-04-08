with
new_members as (

    select
        *
    from {{ ref('stg_nutrisense__new_members') }}
),

active_members as (

    select
        *
    from {{ ref('stg_nutrisense__active_members') }}
),

new_active__joined as (

    select
        *
    from new_members
        left join active_members
            on new_members.customer_id = active_members.customer_id
),

final as (

    select * from new_active__joined
)

select * from final