# build stage
FROM rust:latest as builder
WORKDIR /usr/src/sentence-similarity-rs
COPY . .
RUN cargo build --release

# runtime stage
FROM debian:buster-slim
# Install the libssl package
RUN apt-get update && apt-get install -y libssl-dev ca-certificates
RUN apt-get install -y libtorch
# Update the library path
RUN echo "/usr/local/lib" | tee /etc/ld.so.conf.d/usr-local.conf && ldconfig
# Update the SSL certificate store
RUN update-ca-certificates
COPY --from=builder /usr/src/sentence-similarity-rs/target/release/sentence-similarity-rs /usr/local/bin/sentence-similarity-rs
CMD ["sentence-similarity-rs"]