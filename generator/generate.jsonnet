local astRenderEngine = import './vendor/github.com/crdsonnet/crdsonnet/crdsonnet/renderEngines/ast.libsonnet';
local a = import 'github.com/crdsonnet/astsonnet/main.libsonnet';
local autils = import 'github.com/crdsonnet/astsonnet/utils.libsonnet';
local helpers = import 'github.com/crdsonnet/crdsonnet/crdsonnet/helpers.libsonnet';
local crdsonnet = import 'github.com/crdsonnet/crdsonnet/crdsonnet/main.libsonnet';
local d = import 'github.com/jsonnet-libs/docsonnet/doc-util/main.libsonnet';

local schema = import '../schema.libsonnet';

local processor =
  crdsonnet.processor.new()
  + crdsonnet.processor.withRenderEngineType('ast')
  + {
    render(name, schema):
      local parsedSchema = self.parse(name, schema);
      local required = std.get(parsedSchema[name], 'required', []);
      autils.deepMergeObjects([
        a.object.new([
          a.field.new(
            a.id.new(name),
            a.object.new([
              a.field.new(
                a.string.new('#new'),
                a.literal.new(
                  std.manifestJsonEx(
                    d.func.new('', [
                      local p = parsedSchema[name].properties[property];
                      local propertyType =
                        if 'type' in p
                        then p.type
                        else
                          local t = helpers.getSchemaTypes(p);
                          if t == ['string'] then ['object'] else t;
                      d.argument.new(
                        property,
                        (propertyType),
                        std.get(p, 'default'),
                        std.get(p, 'enum'),
                      )
                      for property in required
                    ])
                    , '', ''
                  ),
                ),
              ),
              a.field_function.new(
                a.id.new('new'),
                a.binary_sum.new(
                  [
                    a.functioncall.new(
                      a.fieldaccess.new(
                        [a.id.new('self')],
                        a.id.new(astRenderEngine.functionName('type')),
                      )
                    ),
                  ]
                  + (if name == 'tag'
                     then [
                       a.object.new([
                         a.field_function.new(
                           a.id.new('manifest'),
                           a.functioncall.new(
                             a.fieldaccess.new(
                               [a.id.new('std')],
                               a.id.new('manifestXmlJsonml')
                             )
                           )
                           + a.functioncall.withArgs(
                             a.literal.new("schema['$defs'].tag.toJsonML(self)")
                           )
                         ),
                       ]),
                     ]
                     else [])
                  + [
                    a.functioncall.new(
                      a.fieldaccess.new(
                        [a.id.new('self')],
                        a.id.new(astRenderEngine.functionName(property)),
                      )
                    )
                    + a.functioncall.withArgs(
                      a.arg.new(a.id.new(property))
                    )
                    for property in required
                  ]
                ),
              )
              + a.field_function.withParams(
                a.params.new([
                  a.param.new(a.id.new(property))
                  for property in required
                ])
              ),
            ])
          ),
        ]),
        super.render(name, schema),
      ]),
  };

local asts = [
  crdsonnet.schema.render(field, schema['$defs'][field], processor)
  for field in std.objectFields(schema['$defs'])
];

local docstring =
  a.object.new([
    a.field.new(
      a.string.new('#'),
      a.literal.new(
        std.manifestJsonEx(
          d.package.new(
            'jsonml-libsonnet',
            '',
            'Jsonnet library to generate XML/HTML tags.',
            'main.libsonnet',
            'main',
          )
          , '  ', '\n'
        ),
      ),
    ),
  ]);

'// DO NOT EDIT: generated by generator/generate.jsonnet\n'
+ (
  a.local_bind.new(
    a.bind.new(
      a.id.new('schema'),
      a.import_statement.new('./schema.libsonnet')
    ),
    autils.deepMergeObjects([docstring] + asts),
  )
).toString()
