.PHONY: generate
generate:
	jsonnet -J generator/vendor -S generator/generate.jsonnet | jsonnetfmt - > main.libsonnet
