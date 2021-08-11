# Go-Swagger Pre-commit hooks

This should be a collection of pre-commit hooks for enforcing common go-swagger operations before committing.

## Swagger Spec Generation

This hook will generate a swagger spec from the current project.  Use this to remind your developers that they
are changing classes that will change the swagger.  Ideally this will lead to catches in PR review when the 
file is present in the diff.