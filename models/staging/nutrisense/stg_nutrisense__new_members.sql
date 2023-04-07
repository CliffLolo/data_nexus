with

source as (

    select * from {{ source('nutrisense', 'new_members') }}
),

renamed as (
    select
        customer_id,
        charge_id,
        date as charge_date,
        cohort_date,
        cohort_tag,
        cohort_plan_commitment,
        cohort_plan_commitment_ends,
        cohort_plan_id
    from source
),

final as (

    select * from renamed
)

select * from final
