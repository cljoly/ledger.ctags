# Ledger.ctags: [Ctags](https://ctags.io/) file for [ledger](https://ledger-cli.org/) (“ledger-cli”)

Just drop [`ledger.ctags`](https://github.com/cljoly/ledger.ctags/blob/main/ledger.ctags) in `~/.config/ctags` (or whathever `ctags` is configured to read).

Then run
```
ctags my/ledger/journal.ldg
```

## Automatic Update with Chezmoi

Chezmoi [external](https://www.chezmoi.io/reference/special-files-and-directories/chezmoiexternal-format/) feature allows you to auto update and manage the `ledger.ctags` file, by adding the following to your `~/.local/share/chezmoi/.chezmoiexternal.toml`:

```toml
[".config/ctags/"]
    type = "archive"
    include = [ "*/ledger.ctags" ]
    url = "https://github.com/cljoly/ledger.ctags/archive/master.zip/"
    stripComponents = 1
```
