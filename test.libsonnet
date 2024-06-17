local main = import './main.libsonnet';

local head = main.tag.new('head');

local body =
  main.tag.new('body')
  + main.tag.withElements(
    main.tag.new('h1')
    + main.tag.withElements(
      main.literal.new('title')
    )
  );

local html =
  main.tag.new('html')
  + main.tag.withAttributes(
    main.attribute.new('lang', 'en')
  )
  + main.tag.withElements([
    head,
    body,
  ]);


html.manifest()
