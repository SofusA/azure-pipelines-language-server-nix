# angular-language-server
This is a flake which wraps [`@angular/language-server`](https://www.npmjs.com/package/@angular/language-server) with flags to make it start with `stdin` to one command: `angular-language-server`.

## Use with Helix
`languages.toml`
```toml
[language-server.azure-pipelines-language-server]
command = "azure-pipelines-language-server"

[[language]]
name = "yaml"
```
