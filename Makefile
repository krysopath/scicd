ifeq (run,$(firstword $(MAKECMDGOALS)))
  RUN_ARGS := $(wordlist 2,$(words $(MAKECMDGOALS)),$(MAKECMDGOALS))
  $(eval $(RUN_ARGS):;@:)
endif

iac:
	./pipeline inventories/threeyd iac.yml

iacd:
	./cd inventories/ops iac.yml

upgrade:
	./pipeline inventories/ops upgrade.yml

lint:
	./lint-ansible

.PHONY: scicd
scicd: ./scicd $@
	@./scicd $(RUN_ARGS)
