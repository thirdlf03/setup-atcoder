FROM ubuntu:latest

# setup rust
RUN apt update && apt upgrade -y  \
    && apt install -y wget curl time tar bzip2 git vim pkg-config libssl-dev build-essential \
    && curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | bash -s -- --default-toolchain stable -y \
    && . "$HOME/.cargo/env" \
    && cargo install cargo-compete \
    && mkdir ./opt/workspace \
    && cd /opt/workspace \
    && yes 2 | cargo compete init atcoder


WORKDIR /opt/workspace

COPY compete.toml /opt/workspace/compete.toml

CMD ["/bin/bash"]


