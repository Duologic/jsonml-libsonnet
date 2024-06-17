local ml = import './main.libsonnet';

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
