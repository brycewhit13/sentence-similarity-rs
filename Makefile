rust-version:
	@echo "Rust command-line utility versions:"
	rustc --version 			#rust compiler
	cargo --version 			#rust package manager
	rustfmt --version			#rust code formatter
	rustup --version			#rust toolchain manager
	clippy-driver --version		#rust linter

format:
	cargo fmt --quiet

lint:
	cargo clippy --quiet
run:
	cargo run 

release:
	cargo build --release
		
build:
	cargo lambda build --release

deploy:
	cargo lambda deploy

test:
	cargo test --quiet

invoke:
	cargo lambda invoke --remote \
  		--data-ascii '{"prompt": "A baby panda riding a skateboard", "n_steps": 10}' \
  		--output-format json \
  		stable-diffusion-rs

all: format lint test run
