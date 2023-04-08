with

source as (

    select * from {{ source('nutrisense', 'subscriptions') }}
),

renamed as (
    select
        id as subscription_id,
        customer_id,
        cancel_at,
        cancelled_at,
        cancel_at_period_end,
        current_period_end,
        ended_at,
        status,
        latest_invoice,
        plan_id,
        interval,
        interval_count,
        commitment,
        commitment_ends,
        coupon_id,
        created_noisy
    from source
),

final as (

    select * from renamed
)

select * from final
