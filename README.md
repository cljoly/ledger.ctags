# Ledger.ctags: [Ctags](https://ctags.io/) file for [ledger](https://ledger-cli.org/) (“ledger-cli”)

In compatible editors (Atom, VS Code, TextMate, vim, neovim, Emacs and [more][editors]), this gives completion and jump to definition for accounts, payee, commodities, tags, aliases.

## Installation

You need to have [ctags][] installed[^1].

Then just drop [`ledger.ctags`](https://github.com/cljoly/ledger.ctags/blob/main/ledger.ctags) in `~/.config/ctags` (or whatever `ctags` is configured to read).

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

and see your editor’s documentation for ways to integrate ctags.

[editors]: https://en.wikipedia.org/wiki/Ctags#Editors_that_support_ctags
[ctags]: https://ctags.io/

[^1]: Another implementation may work, but it’s untested. Feel free to send a PR though!
