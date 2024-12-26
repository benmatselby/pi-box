.PHONY: explain
explain:
	### Welcome
	#
	# .______    __
	# |   _  \  |  |
	# |  |_   | |  |
	# |   ___/  |  |
	# |  |      |  |
	# | _|      |__|
	#
	#    .______     ______   ___   ___
	#    |   _  \   /  __  \  \  \ /  /
	#    |  |_   | |  |  |  |  \  V  /
	#    |   _  <  |  |  |  |   >   <
	#    |  |_   | |  `--'  |  /  .  \\
	#    |______/   \______/  /__/ \__\\
	#
	#
	#
	### Installation
	#
	# $$ make all
	#
	### Targets
	@cat Makefile* | grep -E '^[a-zA-Z_-]+:.*?## .*$$' | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

###
# Installation (GitHooks)
###
.PHONY: install
install: ## Install the git hooks
	@echo "Installing the git hooks"
	@cp -rf scripts/hooks/* .git/hooks/

###
# Ansible targets
###
.PHONY: provision
provision: ## Install the packages
	ansible-playbook -i ansible/hosts ansible/provision.yml ansible/homebridge.yml --verbose


###
# Quality checks
###
.PHONY: lint
lint: ## Lint the code
	@echo "Linting the code"
	@ansible-lint ansible/

.PHONY: shellcheck
shellcheck: ## Run shellcheck
	@echo "Running shellcheck"
	@shellcheck scripts/hooks/*


###
# Utilities
###
.PHONY: facts
facts: ## Display the facts
	@ansible -m setup localhost
