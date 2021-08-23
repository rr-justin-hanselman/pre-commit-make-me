# Go-Swagger Pre-commit hooks

This should be a collection of pre-commit hooks for enforcing common go-swagger operations before committing.

## Swagger Spec Generation

This hook will generate a swagger spec from the current project.  Use this to remind your developers that they
are changing classes that will change the swagger.  Ideally this will lead to catches in PR review when the 
file is present in the diff.

## The "--" delimiter

As a limitation of the pre-commit implementation, there is no built in way to determine if the arguments you are getting
are from this hook or from the file list appended to the arguments.

Therefore, always append "--" to your arguments in your config.

```yaml
// Example pre-commit-config.yaml
repo: https://github.com/rr-justin-hanselman/pre-commit-make-me
    rev: 1.0.0
    hooks:
    -   id: make-me
        name: Mock Generation
        args: [mock, --]
```

You can see the discussion around this [here](https://github.com/pre-commit/pre-commit/issues/971)

