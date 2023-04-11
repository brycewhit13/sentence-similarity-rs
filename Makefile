rust-version:
	@echo "Rust command-line utility versions:"
	rustc --version 			#rust compiler
	cargo --version 			#rust package manager
	rustfmt --version			#rust code formatter
	rustup --version			#rust toolchain manager
	clippy-driver --version		#rust linter

setup:
	sudo apt-get install libssl-dev
	sudo apt-get install pip
	pip3 install cargo-lambda

format:
	cargo fmt --quiet

lint:
	cargo clippy --quiet

run:
	cargo run 

release:
	cargo build --release
		
build:
	cargo lambda build --release --target x86_64-unknown-linux-gnu.2.17 --output-format zip

deploy:
	cargo lambda deploy

test:
	cargo test --quiet

invoke:
	cargo lambda invoke --remote \
  		--data-ascii '{"prompt1": "Hello World!", "prompt2": Hello Rust}' \
  		--output-format json \
  		sentence-similarity-rs

all: format lint test run
