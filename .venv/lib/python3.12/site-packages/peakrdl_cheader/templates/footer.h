
{% if ds.std.static_assert %}
{%- for node in top_nodes %}
{%- if node.is_array %}
static_assert(sizeof({{get_struct_name(ds, node, node)}}) == {{"%#x" % node.array_stride}}, "Packing error");
{%- else %}
static_assert(sizeof({{get_struct_name(ds, node, node)}}) == {{"%#x" % node.size}}, "Packing error");
{%- endif %}
{%- endfor %}
{%- endif %}

#ifdef __cplusplus
}
#endif

#endif /* {{header_guard_def}} */
