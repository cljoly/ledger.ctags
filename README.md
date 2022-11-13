<!-- insert
---
title: "Ledger.ctags"
date: 2022-08-21T08:15:54
description: "Ctags file for ledger-cli"
tags:
- Open Source
- Tools
- Ledger
- Ctags
---
{{< github_badge >}}
{{< rawhtml >}}
<div class="badges">
{{< /rawhtml >}}
end_insert -->
<!-- Powered by https://cj.rs/riss -->

<!-- remove -->
# Ledger.ctags
<!-- end_remove -->

[![](https://img.shields.io/badge/powered%20by-riss-lightgrey)](https://cj.rs/riss)

<!-- insert
{{< rawhtml >}}
</div>
{{< /rawhtml >}}
end_insert -->

This gives completion and jump to definition for declared accounts, payee, commodities, tags, aliases… in compatible editors (Atom, VS Code, TextMate, vim, neovim, Emacs and [more][editors]). Works with [ledger][] and most of its variants.

## Installation

You need to have [ctags][] installed[^1].

Then just drop [`ledger.ctags`](https://raw.githubusercontent.com/cljoly/ledger.ctags/main/ledger.ctags) in `~/.config/ctags` (or whatever `ctags` is configured to read).

## Usage

```
ctags my/ledger/journal.ldg
```
will collect all the elements [declared][declaration] in the journal file. This means that in the following file
```ledger
tag UUID
account Assets
payee Shop
commodity EUR

2022-01-01 * Someone
    Expenses:Food   $10
    Liabilities:Credit Card
```
only `UUID`, `Assets`, `Shop` and `EUR` are detected, because they are the only one declared and so the only ones with a definition to jump to. `Someone`, `Expenses`, `Expenses:Food`, `$`, `Liabilities` and `Liabilities:Credit  Card` are not declared, so they are ignored by ctags.

### Multiple files

If you have multiple ledger journal files, pass them all to ctags or run it on the directory:
```sh
ctags -R .
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

## Contributing

Contributions (documentation or code improvements in particular) are welcome, see [contributing](https://cj.rs/docs/contribute/)!

## Acknowledgments

I would like to thank the creators and all the contributors to [ctags][] and [ledger][]. This is small configuration to make these two great projects work better together.

[editors]: https://en.wikipedia.org/wiki/Ctags#Editors_that_support_ctags
[ctags]: https://ctags.io/
[ledger]: https://ledger-cli.org/
[declaration]: https://www.ledger-cli.org/3.0/doc/ledger3.html#index-pre_002ddeclare-account

[^1]: Another implementation may work, but it’s untested. Feel free to send a PR though!
