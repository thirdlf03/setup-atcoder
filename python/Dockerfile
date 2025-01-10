FROM ubuntu:latest

# setup pypy 3.10-v7.3.12
RUN apt update && apt upgrade -y  \
    && apt install -y wget curl time tar bzip2

WORKDIR /

RUN wget https://downloads.python.org/pypy/pypy3.10-v7.3.12-linux64.tar.bz2 \
    && tar xf /pypy3.10-v7.3.12-linux64.tar.bz2 \
    && chmod +x /pypy3.10-v7.3.12-linux64/bin/pypy3 \
    && ln -s /pypy3.10-v7.3.12-linux64/bin/pypy3 /usr/local/bin/pypy3

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

COPY /templates/python /root/.config/atcoder-cli-nodejs/python/

RUN /bin/bash -c "source $HOME/.nvm/nvm.sh && acc config default-test-dirname-format test \
    && acc config default-task-choice all \
    && acc config default-template python \
    && echo \"alias ojt='oj t -c \\\"pypy3 Main.py\\\"'\" >> $HOME/.bashrc  \
    && echo \"alias acs='acc submit Main.py -- -l 5078' \" >> $HOME/.bashrc"

CMD ["/bin/bash"]


