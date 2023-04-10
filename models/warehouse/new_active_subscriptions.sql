{{ config(
    materialized = 'table'
    )
}}

with
new_active_members__joined as (

    select
        *
    from {{ ref('int_new_active_members__joined') }}
),

subscriptions as (

    select
        *
    from {{ ref('stg_nutrisense__subscriptions') }}
),

new_active_members_subscriptions__joined as (

    select
        new_active_members__joined.customer_id,
        new_active_members__joined.charge_id,
        new_active_members__joined.charge_date,
        new_active_members__joined.cohort_date,
        new_active_members__joined.cohort_tag,
        new_active_members__joined.cohort_plan_commitment,
        new_active_members__joined.cohort_plan_commitment_ends,
        new_active_members__joined.cohort_plan_id,
        new_active_members__joined.active_date,
        new_active_members__joined.first_charge_at,
        subscriptions.subscription_id,
        subscriptions.cancel_at,
        subscriptions.cancelled_at,
        subscriptions.cancel_at_period_end,
        subscriptions.current_period_end,
        subscriptions.ended_at,
        subscriptions.status,
        subscriptions.latest_invoice,
        subscriptions.plan_id,
        subscriptions.interval,
        subscriptions.interval_count,
        subscriptions.commitment,
        subscriptions.commitment_ends,
        subscriptions.coupon_id,
        subscriptions.created_noisy
    from new_active_members__joined
        left join subscriptions
            on new_active_members__joined.customer_id = subscriptions.customer_id
),

final as (

    select * from new_active_members_subscriptions__joined
)

select * from final