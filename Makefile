
.PHONY: init
init:
	pip install pip-tools~=6.12

build-deps: requirements.txt requirements_dev.txt

.PHONY: install-deps
install-deps:
	pip-sync requirements.txt

.PHONY: install-deps-dev
install-deps-dev:
	pip-sync requirements_dev.txt

requirements.txt: pyproject.toml
	pip-compile -q --resolver=backtracking -o requrements.txt

requirements_dev.txt: pyproject.toml requirements.txt
	pip-compile -q --resolver=backtracking --extra=dev -o requirements_dev.txt

.PHONY: reformat
reformat:
	python -m black .

.PHONY: run
run:
	python -m raycast_tutorial
