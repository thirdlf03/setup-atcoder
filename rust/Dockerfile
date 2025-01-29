FROM ubuntu:latest

# setup rust
RUN apt update && apt upgrade -y  \
    && apt install -y wget curl time tar bzip2 git vim pkg-config libssl-dev build-essential \
    && curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | bash -s -- --default-toolchain stable -y \
    && . "$HOME/.cargo/env" \
    && cargo install cargo-compete \
    && mkdir ./opt/workspace \
    && rustup toolchain add 1.70.0 \
    && rustup default 1.70.0-x86_64-unknown-linux-gnu

# alias
RUN echo "alias ccn='cargo compete new'" >> $HOME/.bashrc \
    && echo "alias cct='cargo compete test'" >> $HOME/.bashrc \
    && echo "alias ccs='cargo compete submit'" >> $HOME/.bashrc \
    && . $HOME/.bashrc

CMD ["/bin/bash"]


