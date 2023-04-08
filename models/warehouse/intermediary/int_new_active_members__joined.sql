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
        new_members.customer_id,
        new_members.charge_id,
        new_members.charge_date,
        new_members.cohort_date,
        new_members.cohort_tag,
        new_members.cohort_plan_commitment,
        new_members.cohort_plan_commitment_ends,
        new_members.cohort_plan_id,
        active_members.active_date,
        active_members.first_charge_at
    from new_members
        left join active_members
            on new_members.customer_id = active_members.customer_id
),

final as (

    select * from new_active__joined
)

select * from final