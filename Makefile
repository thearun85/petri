.PHONY: help install fmt lint types test check clean

# Default target - runs when you type just `make`
help:
	@echo "Available targets:"
	@echo "	install		Install dependencies (including dev)"
	@echo "	fmt		Run ruff format (modifies files)"
	@echo "	lint		Run ruff lint checks"
	@echo "	types		Run mypy"
	@echo "	test		Run pytest"
	@echo "	check 		Run lint + types + test (CI pipeline)"
	@echo "	clean		Remove caches"

install:
	poetry install
	
fmt:
	poetry run ruff format src tests
	poetry run ruff check --fix src tests

lint:
	poetry run ruff check src tests

types:
	poetry run mypy src tests

test:
	poetry run pytest

check: lint types test

clean:
	rm -rf .pytest_cache .ruff_cache .mypy_cache
	find . -type d -name __pycache__ -exec rm -rf {} +
