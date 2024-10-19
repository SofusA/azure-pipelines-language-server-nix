# azure-pipelines-language-server-nix
a nix flake for azure pipelines language server

## Use with Helix
`languages.toml`
```toml
[language-server.azure-pipelines]
command = "azure-pipelines-language-server"

[[language]]
name = "yml"
language-servers = ["azure-pipelines"]
```
