#include <assert.h>
#include <stddef.h>

#include "{{header_filename}}"

static void test_offsets(void);
{%- if ds.generate_bitfields %}
static void test_bitfields(void);
{%- endif %}

int main(void){
    test_offsets();
{%- if ds.generate_bitfields %}
    test_bitfields();
{%- endif %}
    return 0;
}
