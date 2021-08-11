# Make Pre-commit hook

This is a simple hook that allows the user to specify a make command in their repo and let it run.

## Example

My Makefile:

```Makefile
generate-swagger-docs:
  swagger generate spec -o ./swagger.yaml --scan-models
```

My pre-commit-config.yaml
```yaml
-   repo: https://github.com/rr-justin-hanselman/pre-commit-make-me
    rev: 225a83f9d037054cc98eb6f6e3db33274124388c
    hooks:
    -   id: make-me
        name: Generate Swagger
        args: [generate-swagger-docs]
```

__IMPORTANT__: Like the above, this introduces the need to have additional binaries installed (like go-swagger).  I would recommend using this as a tool to enforce that your developers are aware of supplementary toolchain they should be using.  I.e. if they're building the project and not aware they need go-swagger for doc generation, is that okay in your eyes?  It's up to you to determine what type of failure you want to enforce.  Hope it helps!
