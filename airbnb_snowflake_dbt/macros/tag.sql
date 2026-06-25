{% macro tag(col_name) %}
    CASE
        WHEN {{ col_name }} < 100 THEN 'LOW'
        WHEN {{ col_name }} < 200 THEN 'MEDIUM'
        ELSE 'HIGH'
    END
{% endmacro %}