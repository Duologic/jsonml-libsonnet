# jsonml-libsonnet

Jsonnet library to generate XML/HTML tags.
## Install

```
jb install github.com/Duologic/jsonml-libsonnet@main
```

## Usage

```jsonnet
local ml = import 'github.com/Duologic/jsonml-libsonnet/main.libsonnet';

local head = ml.tag.new('head');

local body =
  ml.tag.new('body')
  + ml.tag.withElements(
    ml.tag.new('h1')
    + ml.tag.withElements(
      ml.literal.new('title')
    )
  );

local html =
  ml.tag.new('html')
  + ml.tag.withAttributes(
    ml.attribute.new('lang', 'en')
  )
  + ml.tag.withElements([
    head,
    body,
  ]);


html.manifest()

```


## Index

* [`obj attribute`](#obj-attribute)
  * [`fn new(name, value)`](#fn-attributenew)
  * [`fn withName(value)`](#fn-attributewithname)
  * [`fn withType()`](#fn-attributewithtype)
  * [`fn withValue(value)`](#fn-attributewithvalue)
* [`obj literal`](#obj-literal)
  * [`fn new(value)`](#fn-literalnew)
  * [`fn withType()`](#fn-literalwithtype)
  * [`fn withValue(value)`](#fn-literalwithvalue)
* [`obj tag`](#obj-tag)
  * [`fn new(name)`](#fn-tagnew)
  * [`fn withAttributes(value)`](#fn-tagwithattributes)
  * [`fn withAttributesMixin(value)`](#fn-tagwithattributesmixin)
  * [`fn withElements(value)`](#fn-tagwithelements)
  * [`fn withElementsMixin(value)`](#fn-tagwithelementsmixin)
  * [`fn withName(value)`](#fn-tagwithname)
  * [`fn withType()`](#fn-tagwithtype)

## Fields

### obj attribute


#### fn attribute.new

```jsonnet
attribute.new(name, value)
```

PARAMETERS:

* **name** (`string`)
* **value** (`boolean`,`null`,`number`,`string`)


#### fn attribute.withName

```jsonnet
attribute.withName(value)
```

PARAMETERS:

* **value** (`string`)


#### fn attribute.withType

```jsonnet
attribute.withType()
```



#### fn attribute.withValue

```jsonnet
attribute.withValue(value)
```

PARAMETERS:

* **value** (`boolean`,`null`,`number`,`string`)


### obj literal


#### fn literal.new

```jsonnet
literal.new(value)
```

PARAMETERS:

* **value** (`string`)


#### fn literal.withType

```jsonnet
literal.withType()
```



#### fn literal.withValue

```jsonnet
literal.withValue(value)
```

PARAMETERS:

* **value** (`string`)


### obj tag


#### fn tag.new

```jsonnet
tag.new(name)
```

PARAMETERS:

* **name** (`string`)


#### fn tag.withAttributes

```jsonnet
tag.withAttributes(value)
```

PARAMETERS:

* **value** (`array`)


#### fn tag.withAttributesMixin

```jsonnet
tag.withAttributesMixin(value)
```

PARAMETERS:

* **value** (`array`)


#### fn tag.withElements

```jsonnet
tag.withElements(value)
```

PARAMETERS:

* **value** (`array`)


#### fn tag.withElementsMixin

```jsonnet
tag.withElementsMixin(value)
```

PARAMETERS:

* **value** (`array`)


#### fn tag.withName

```jsonnet
tag.withName(value)
```

PARAMETERS:

* **value** (`string`)


#### fn tag.withType

```jsonnet
tag.withType()
```


