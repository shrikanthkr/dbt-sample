
    
    

select
    id as unique_field,
    count(*) as n_records

from "postgres"."public__airbyte_quarantine"."users_scalar"
where id is not null
group by id
having count(*) > 1


