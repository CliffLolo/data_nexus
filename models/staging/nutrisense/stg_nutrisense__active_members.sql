with
source as (

    select * from {{ source('nutrisense', 'active_members') }}
),

renamed as (

    select
        date as active_date,
        first_charge_at,
        customer_id,
        cohort_date,
        cohort_plan_commitment
    from source
),

final as (

    select * from renamed
)

select * from final




