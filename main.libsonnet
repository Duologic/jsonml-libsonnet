// DO NOT EDIT: generated by generator/generate.jsonnet
local schema = import './schema.libsonnet';
{
  '#': {
    filename: 'main.libsonnet',
    help: "Jsonnet library to generate XML/HTML.\n## Install\n\n```\njb install github.com/Duologic/jsonml-libsonnet@main\n```\n\n## Usage\n\n```jsonnet\nlocal ml = import 'github.com/Duologic/jsonml-libsonnet/main.libsonnet';\n\nlocal head = ml.tag.new('head');\n\nlocal body =\n  ml.tag.new('body')\n  + ml.tag.withElements(\n    ml.tag.new('h1')\n    + ml.tag.withElements(\n      ml.literal.new('title')\n    )\n  );\n\nlocal html =\n  ml.tag.new('html')\n  + ml.tag.withAttributes(\n    ml.attribute.new('lang', 'en')\n  )\n  + ml.tag.withElements([\n    head,\n    body,\n  ]);\n\n\nhtml.manifest()\n\n```\n",
    'import': 'github.com/Duologic/jsonml-libsonnet/main.libsonnet',
    installTemplate: '\n## Install\n\n```\njb install %(url)s@%(version)s\n```\n',
    name: 'jsonml-libsonnet',
    url: 'github.com/Duologic/jsonml-libsonnet',
    usageTemplate: "\n## Usage\n\n```jsonnet\nlocal ml = import '%(import)s';\n\nlocal head = ml.tag.new('head');\n\nlocal body =\n  ml.tag.new('body')\n  + ml.tag.withElements(\n    ml.tag.new('h1')\n    + ml.tag.withElements(\n      ml.literal.new('title')\n    )\n  );\n\nlocal html =\n  ml.tag.new('html')\n  + ml.tag.withAttributes(\n    ml.attribute.new('lang', 'en')\n  )\n  + ml.tag.withElements([\n    head,\n    body,\n  ]);\n\n\nhtml.manifest()\n\n```\n",
    version: 'main',
  },
  attribute+:
    {
      '#new': { 'function': { args: [{ default: null, enums: null, name: 'name', type: 'string' }, { default: null, enums: null, name: 'value', type: ['string', 'number', 'boolean', 'null'] }], help: '' } },
      new(name, value):
        self.withType()
        + self.withName(name)
        + self.withValue(value),
      '#withName': { 'function': { args: [{ default: null, enums: null, name: 'value', type: ['string'] }], help: '' } },
      withName(value): {
        name: value,
      },
      '#withType': { 'function': { args: [], help: '' } },
      withType(): {
        type: 'attribute',
      },
      '#withValue': { 'function': { args: [{ default: null, enums: null, name: 'value', type: ['string', 'number', 'boolean', 'null'] }], help: '' } },
      withValue(value): {
        value: value,
      },
    },
  literal+:
    {
      '#new': { 'function': { args: [{ default: null, enums: null, name: 'value', type: 'string' }], help: '' } },
      new(value):
        self.withType()
        + self.withValue(value),
      '#withType': { 'function': { args: [], help: '' } },
      withType(): {
        type: 'literal',
      },
      '#withValue': { 'function': { args: [{ default: null, enums: null, name: 'value', type: ['string'] }], help: '' } },
      withValue(value): {
        value: value,
      },
    },
  tag+:
    {
      '#new': { 'function': { args: [{ default: null, enums: null, name: 'name', type: 'string' }], help: '' } },
      new(name):
        self.withType()
        + self.withName(name)
        + {
          manifest():: std.manifestXmlJsonml(schema['$defs'].tag.toJsonML(self)),
        },
      '#withAttributes': { 'function': { args: [{ default: null, enums: null, name: 'value', type: ['array'] }], help: '' } },
      withAttributes(value): {
        attributes:
          (if std.isArray(value)
           then value
           else [value]),
      },
      '#withAttributesMixin': { 'function': { args: [{ default: null, enums: null, name: 'value', type: ['array'] }], help: '' } },
      withAttributesMixin(value): {
        attributes+:
          (if std.isArray(value)
           then value
           else [value]),
      },
      '#withElements': { 'function': { args: [{ default: null, enums: null, name: 'value', type: ['array'] }], help: '' } },
      withElements(value): {
        elements:
          (if std.isArray(value)
           then value
           else [value]),
      },
      '#withElementsMixin': { 'function': { args: [{ default: null, enums: null, name: 'value', type: ['array'] }], help: '' } },
      withElementsMixin(value): {
        elements+:
          (if std.isArray(value)
           then value
           else [value]),
      },
      '#withName': { 'function': { args: [{ default: null, enums: null, name: 'value', type: ['string'] }], help: '' } },
      withName(value): {
        name: value,
      },
      '#withType': { 'function': { args: [], help: '' } },
      withType(): {
        type: 'tag',
      },
    },
}
