FROM ubuntu:latest

# setup C++ (GCC 12.2)
RUN apt update && apt upgrade -y && apt install -y build-essential gcc-12 g++-12 curl
RUN update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-12 12 \
    && update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-12 12

# setup atcoder-cli
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash \
    && apt install -y python3-pip python3-venv \
    && export NVM_DIR="$HOME/.nvm" \
    && [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" \
    && nvm install 22 \
    && npm install -g atcoder-cli

ENV PATH="$HOME/.nvm/versions/node/v22/bin:$PATH"


RUN python3 -m venv /opt/venv \
    && /opt/venv/bin/pip install --upgrade pip \
    && /opt/venv/bin/pip install online-judge-tools \
    && /opt/venv/bin/pip install setuptools

ENV PATH="/opt/venv/bin:$PATH"

RUN mkdir ./opt/workspace

CMD ["/bin/bash"]
