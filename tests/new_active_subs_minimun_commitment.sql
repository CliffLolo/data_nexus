select *
from {{ ref('new_active_subscriptions')}}
where commitment < 0
limit 10