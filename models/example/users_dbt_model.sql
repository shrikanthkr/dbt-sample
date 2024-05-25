{{ config(alias="users_scalar", schema="_airbyte_quarantine", tags=["top-level-intermediate"]) }}
-- SQL model to parse JSON blob stored in a single column and extract into separated field columns as described by the JSON Schema

select
    {{ jsonb_extract_path_text('_airbyte_data', ['_id']) }} as legacy_id,
    {{ jsonb_extract_path_text('_airbyte_data', ['createdAt']) }} as start_date,
    {{ jsonb_extract_path_text('_airbyte_data', ['updatedAt']) }} as update_date,
    {{ jsonb_extract_path_text('_airbyte_data', ['name']) }} as name,
    {{ jsonb_extract_path_text('_airbyte_data', ['email']) }} as email,
    {{ jsonb_extract_path_text('_airbyte_data', ['status']) }} as status,
    {{ jsonb_extract_path_text('_airbyte_data', ['lastName']) }} as last_name,
    {{ jsonb_extract_path_text('_airbyte_data', ['firstName']) }} as first_name,
    {{ jsonb_extract_path_text('_airbyte_data', ['remoteCreatedAt']) }} as remote_created_at,
    {{ jsonb_extract_path_text('_airbyte_data', ['employmentStatus']) }} as employment_status,
    {{ jsonb_extract_path_text('_airbyte_data', ['organization']) }} as organization,
    {{ jsonb_extract_path_text('_airbyte_data', ['onboardingStep']) }} as onboarding_step,
    _airbyte_emitted_at
from 'public._airbyte_raw_users'
