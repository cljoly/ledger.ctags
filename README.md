<!-- insert
---
title: "Ledger.ctags"
date: 2022-08-21T08:15:54
description: "Ctags file for ledger-cli"
aliases:
- /ledger.ctags
tags:
- Open Source
- Tools
- Ledger
- Ctags
repo_url: https://github.com/cljoly/ledger.ctags
---
{{< github_badge >}}
end_insert -->
<!-- Powered by https://cj.rs/riss -->

<!-- remove -->
# Ledger.ctags
<!-- end_remove -->

If you are using [Ledger][ledger] or one of its variants for your [plain text accounting][pta], you get to manage your finances a bit more like you manage code. With plain text files, in your favorite editor.

And yet, as opposed to code in most languages, you don’t have a [Language Server Protocol implementation][lsp]. So it’s a bit harder to get completions on accounts, tags, payees… You have to rely on bespoken support from your editor and that’s often imperfect or slow. Plus, if you [declare][declaration] your accounts and payees, you also can’t jump to the definition easily.

Enter ctags configuration for ledger, which this project provides. It generates `tag` file that’s understood by your editor, often out of the box ([vim/neovim][vim_tag_intro], [emacs][emacs_support]) or with a generic plugin (Atom, VS Code, TextMate and [more][editors]). Congrats, your editor now has very fast completions and code navigation!

## Installation

You need to have [ctags][] installed[^1].

Then just drop [`ledger.ctags`](https://raw.githubusercontent.com/cljoly/ledger.ctags/main/ledger.ctags) in `~/.config/ctags` (or whatever `ctags` is configured to read).

## Usage

```
ctags my/ledger/journal.ldg
```
will collect all the elements formally [declared][declaration] in the journal file. This means that in the following file:
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

### Initial List of Accounts, Payees…

As mentioned, ctags only collects elements that are declared. You could write the declarations manually, if you want to have fine-grained control of which accounts you want to actively use and have completions for. But to ease initial bootstrapping, you may want to start by adding everything you currently use in your ledger journals. You can do that with a couple commands.

For accounts, you can use this bash snippet:
```
ledger accounts | awk '{ print "account", $0}'
```

For payees:
```
ledger payees | awk '{ print "payee", $0}'
```

For tags:
```
ledger tags | awk '{ print "tag", $0}'
```

The snippets above output proper ledger definitions for accounts, payees and tags. You can insert these outputs in your journal or in a separate file with all your declarations (say `declarations.ledger`), that you can then `include` in your main journal file.

Don’t forget that ctags does not follow includes, so you should pass the file with the definitions to ctags (e.g. `ctags declarations.ledger`)

### Multiple files

If you have multiple ledger journal files, pass them all to ctags (e.g. `ctags *.ledger *.ldg`) or run it on the current directory:
```sh
ctags -R .
```

********************************************************************************

## Automatic Update with Chezmoi

Chezmoi [external](https://www.chezmoi.io/reference/special-files-and-directories/chezmoiexternal-format/) feature allows you to auto update and manage the `ledger.ctags` file, by adding the following to your `~/.local/share/chezmoi/.chezmoiexternal.toml`:

```toml
[".config/ctags/"]
    type = "archive"
    include = [ "*/ledger.ctags" ]
    url = "https://github.com/cljoly/ledger.ctags/archive/master.zip/"
    stripComponents = 1
```

## Contributing

Contributions (documentation or code improvements in particular) are welcome, see [contributing](https://cj.rs/docs/contribute/)!

Feel free [to fill an issue](https://github.com/cljoly/ledger.ctags/issues/new) if your *declared* accounts, tags, payee, alias… are not properly detected.

## Acknowledgments

I would like to thank the creators, and all the contributors, of [ctags][] and [ledger][]. This is small configuration to make these two great projects work better together.

<!-- insert
{{< rawhtml >}}
<div class="badges">
{{< /rawhtml >}}
end_insert -->

[![](https://img.shields.io/badge/powered%20by-riss-lightgrey)](https://cj.rs/riss)

<!-- insert
{{< rawhtml >}}
</div>
{{< /rawhtml >}}
end_insert -->

[editors]: https://en.wikipedia.org/wiki/Ctags#Editors_that_support_ctags
[ctags]: https://ctags.io/
[ledger]: https://ledger-cli.org/
[declaration]: https://www.ledger-cli.org/3.0/doc/ledger3.html#index-pre_002ddeclare-account
[pta]: https://plaintextaccounting.org/
[emacs_support]: https://www.gnu.org/software/emacs/manual/html_node/emacs/Tags-Tables.html
[vim_tag_intro]: https://vimhelp.org/usr_29.txt.html#29.1
[lsp]: https://microsoft.github.io/language-server-protocol/

[^1]: Another implementation may work, but it’s untested. Feel free to send a PR though!
