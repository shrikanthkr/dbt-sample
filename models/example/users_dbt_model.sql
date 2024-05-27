{{ config(alias="users_scalar", schema="_airbyte_quarantine", tags=["top-level-intermediate"]) }}
-- SQL model to parse JSON blob stored in a single column and extract into separated field columns as described by the JSON Schema

select
    _airbyte_data['_id'] as legacy_id,
    (_airbyte_data->>'createdAt')::timestamp AS start_date
    _airbyte_data ['updatedAt']  as update_date,
    _airbyte_data ['name']  as name,
    _airbyte_data ['email']  as email,
    _airbyte_data ['status']  as status,
    _airbyte_data ['lastName']  as last_name,
    _airbyte_data ['firstName']  as first_name,
    _airbyte_data ['remoteCreatedAt']  as remote_created_at,
    _airbyte_data ['employmentStatus']  as employment_status,
    _airbyte_data ['organization']  as organization,
    _airbyte_data ['onboardingStep']  as onboarding_step,
    _airbyte_emitted_at
from _airbyte_public._airbyte_raw_users
