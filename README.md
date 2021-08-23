# Make Pre-commit hook

This is a simple hook that allows the user to specify a make command in their repo and let it run.

## Example

This hook will generate a swagger spec from the current project.  Use this to remind your developers that they
are changing classes that will change the swagger.  Ideally this will lead to catches in PR review when the 
file is present in the diff.

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
        args: [generate-swagger-docs, --]
```

__IMPORTANT__: Like the above, this introduces the need to have additional binaries installed (like go-swagger).  I would recommend using this as a tool to enforce that your developers are aware of supplementary toolchain they should be using.  I.e. if they're building the project and not aware they need go-swagger for doc generation, is that okay in your eyes?  It's up to you to determine what type of failure you want to enforce.  Hope it helps!

## The "--" delimiter

As a limitation of the pre-commit implementation, there is no built-in way to determine if the arguments you are getting
are from this hook or from the file list appended to the arguments.

Therefore, always append "--" to your arguments in your config (see above).

You can see the discussion around this [here](https://github.com/pre-commit/pre-commit/issues/971)
