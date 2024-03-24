

Expressions {{ ... }}: Expressions are used when you want to output a string. You can use expressions to reference variables and call macros. e.g.: ref(), source(), var()

```
{{ ref('orders')}}
{{ var(ABC)) }}
```

Statements {% ... %}: Statements don't output a string. They are used for control flow, for example, to set up for loops and if statements, to set or modify variables, or to define macros. e.g.: for, if
```
{% macro yesterday_date() %}
      logic 
{% endmacro %}
```

Comments {# ... #}: Jinja comments are used to prevent the text within the comment from executing or outputting a string.
```
{# First comment#}
```




## Variable Assignment

Define and assign variables in different data types such as strings, lists, and dictionaries.

### Strings
```
{% set my_string = "example" %}
```

### Lists
```
{% set my_list = ["apple", "lemon"] %}
```

### Dictionaries
```
{% set my_dict = {"fruit_1": "apple",
                   "fruit_2": "lemon"} %}
```

## White Space Control

Jinja allows fine-grained control over white spaces in compiled output. Understand how to strategically strip or maintain spaces.

### Strip Before
```
{%- ... %}
```

### Strip After
```
{% ... -%}
```

### String Before and After
```
{%- ... -%}
```

## Control flow

In dbt, conditional structures guide the flow of transformations. Grasp how to integrate these structures seamlessly.

### If/elif/else/endif
```
{%- if target.name == 'dev' -%}
{{ some code }}
{%- elif target.name == 'prod' -%}
{{ some other code }}
{%- else -%}
{{ some other code }}
{%- endif -%}
```

## Looping

Discover how to iterate over lists and dictionaries. Understand simple loop syntax or accessing loop properties.

### Loop Syntax
```
{%- for item in my_iterable -%}
  --Do something with item
  {{ item }}
{%- endfor -%}
```

### Loop Properties
- **loop.last**: This boolean is False unless the current iteration is the last iteration.
```
{% for item in list %}
  {% if loop.last %}   
    --This is the last item
    {{ item }}
  {% endif %}
{% endfor %}
```
- **loop.first**: A boolean that is True if the current iteration is the first iteration, otherwise False.
```
{% for item in list %}
  {% if loop.first %}
    --first item
    {{ item }}
  {% endif %}
{% endfor %}
```
- 
- **loop.index**: An integer representing the current iteration of the loop (1-indexed).So, the first iteration would have loop.index of 1, the second would be 2, and so on.
```
{% for item in list %}
   --This is item number
   {{ loop.index }}
{% endfor %}
```

## Operators

These logical and comparison operators come in handy, especially when defining tests or setting up configurations in dbt.

### Logic Operators
- **and**: `{% if condition1 and condition2 %}`
- **or**: `{% if condition1 or condition2 %}`
- **not**: `{{  not condition1 }}`

### Comparison Operators
- **Equal To**: `{% if 1 == 2 %}`
- **Not Equal To**: `{% if 1 != 2 %}`
- **Greater Than**: `{% if 1 > 2 %}`
- **Less Than**: `{% if 1 < 2 %}`
- **Greater Than or Equal to**: `{% if 1 >= 2 %}`
- **Less Than or Equal To**: `{% if 1 <= 2 %}`

## Variable tests

Within dbt, you may need to validate if a variable is defined or if a value is odd or even. These Jinja Variable tests allow you to validate with ease.

### Jinja Variable Tests
- **Is Defined**: `{% if my_variable is defined %}`
- **Is None**: `{% if my_variable is none %}`
- **Is Even**: `{% if my_variable is even %}`
- **Is Odd**: `{% if my_variable is odd %}`
- **Is a String**: `{% if my_variable is string %}`
- **Is a Number**: `{% if my_variable is number %}`


## Filters (aka Methods)

Fine-tune your dbt data models with these transformation and formatting utilities.

### String Manipulation
- **Lower**: `{{ "DATACOVES" | lower }} => "datacoves"`
- **Upper**: `{{ "datacoves" | upper }} => "DATACOVES"`
- **Default**: `{{ variable_name | default("Default Value") }}`
- **Trim**: `{{ "Datacoves   " | trim }} => "Datacoves"`
- **Replace**: `{{ "Datacoves" | replace("v", "d") }} => "Datacodes"`
- **Length**: `{{ "Datacoves" | length }} => 9`
- **Capitalize**: `{{ "datacoves" | capitalize }} => "Datacoves"`
- **Repeat a String**: `{{ print('-' * 20) }}`
- **Substring**: `{{ "Datacoves"[0:4] }} => "Data"`
- **Split**: `{{ "Data coves".split(' ') }} => ["Data", "coves"]`

### Number Manipulation
- **Int**: `{{ "20" | int }} => 20`
- **Float**: `{{ 20 | float }} => 20.0`
- **Rounding to Nearest Whole Number**: `{{ 20.1434 | round }} => 21`
- **Rounding to a Specified Decimal Place**: `{{ 20.1434 | round(2) }} => 20.14`
- **Rounding Down (Floor Method)**: `{{ 20.5 | round(method='floor') }} => 20
