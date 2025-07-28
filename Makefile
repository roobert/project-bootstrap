.PHONY: clean build patch minor major upload-test upload test

clean:
	rm -rf dist/

build: clean
	uv build --index-strategy unsafe-best-match

patch:
	uv version --bump patch

minor:
	uv version --bump minor

major:
	uv version --bump major

upload-test: build
	uv publish --index testpypi dist/*

upload: build
	uv publish dist/*

test:
	uv sync; rm -rf refs; ref-fetch pip
