.PHONY: lint
## lint: lint lua code
lint:
	@stylua --check -v ./lua/hvim/
