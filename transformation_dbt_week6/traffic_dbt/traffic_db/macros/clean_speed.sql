{% macro clean_speed(column_name) %}
    coalesce({{ column_name }}, 0)
{% endmacro %}