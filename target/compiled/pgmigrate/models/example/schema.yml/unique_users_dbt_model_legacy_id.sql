
    
    

select
    legacy_id as unique_field,
    count(*) as n_records

from "postgres"."public__airbyte_quarantine"."users_scalar"
where legacy_id is not null
group by legacy_id
having count(*) > 1


