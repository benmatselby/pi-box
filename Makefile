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
# Ansible targets
###
.PHONY: provision
provision: ## Install the packages
	ansible-playbook -i ansible/hosts ansible/provision.yml --verbose
