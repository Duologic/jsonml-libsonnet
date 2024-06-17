{
  local root = self,
  '$ref': '#/$defs/element',
  '$defs': {
    tag: {
      type: 'object',
      properties: {
        type: { const: 'tag' },
        name: { type: 'string' },
        attributes: { type: 'array', item: { type: 'object' } },
        elements: { type: 'array', item: { type: 'object' } },
      },
      required: ['name'],
      toJsonML(obj):
        [obj.name]
        + (if 'attributes' in obj
           then [
             std.foldl(
               function(acc, attr)
                 acc + root['$defs'].attribute.toJsonML(attr),
               obj.attributes,
               {},
             ),
           ]
           else [])
        + (if 'elements' in obj
           then
             std.foldl(
               function(acc, el)
                 acc + [root['$defs'][el.type].toJsonML(el)] + ['\n'],
               obj.elements,
               ['\n']
             )
           else []),
    },
    literal: {
      type: 'object',
      properties: {
        type: { const: 'literal' },
        value: { type: 'string' },
      },
      required: ['value'],
      toJsonML(obj): obj.value,
    },
    attribute: {
      type: 'object',
      properties: {
        type: { const: 'attribute' },
        name: { type: 'string' },
        value: { type: ['string', 'number', 'boolean', 'null'] },
      },
      required: ['name', 'value'],
      toJsonML(obj): { [obj.name]: obj.value },
    },
  },
}
