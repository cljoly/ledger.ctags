test:
	# Check that the ledger journal is valid
	@ledger --pedantic -f ./test/a.ldg b -E >/dev/null 2>/dev/null
	ctags --options=NONE --options=./ledger.ctags test/a.ldg
	diff --color test/tags ./tags

clean:
	@rm ./tags

help: ## Prints help for targets with comments
	@cat $(MAKEFILE_LIST) | grep -E '^[a-zA-Z_-]+:.*?## .*$$' | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

.PHONY: test clean help
