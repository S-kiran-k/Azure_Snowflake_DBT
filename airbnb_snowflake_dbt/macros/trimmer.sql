{% macro trimmer(column_name , node) %}
    {{col_name | trim | upper}} --UPPER(TRIM(customer_name))
{% endmacro %}