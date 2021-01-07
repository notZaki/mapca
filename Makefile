.PHONY: all lint

all_tests: lint unittest integration

help:
	@echo "Please use 'make <target>' where <target> is one of:"
	@echo "  lint			to run flake8 on all Python files"
	@echo "  unittest		to run unit tests on mapca"
	@echo "  integration	to run the integration test set on mapca"
	@echo "  all_tests		to run 'lint', 'unittest', and 'integration'"

lint:
	@flake8 mapca

unittest:
	@py.test --skipintegration --cov-append --cov-report term-missing --cov=mapca mapca/

integration:
	@pip install -e ".[test]"
	@py.test --log-cli-level=INFO --cov-append --cov-report term-missing --cov=mapca -k test_integration mapca/tests/test_integration.py
