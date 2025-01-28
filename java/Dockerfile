FROM ubuntu:latest

# setup Java (OpenJDK 17)
RUN apt update && apt upgrade -y && apt install -y openjdk-17-jdk curl time
RUN java --version

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

# link
RUN mkdir -p ./opt/workspace /root/.config/atcoder-cli-nodejs

COPY /workspace/templates/java /opt/workspace

RUN ln -s /opt/workspace/templates/java /root/.config/atcoder-cli-nodejs/java

RUN /bin/bash -c "source $HOME/.nvm/nvm.sh && acc config default-test-dirname-format test \
    && acc config default-task-choice all \
    && acc config default-template java \
    && echo \"alias ojt='oj t -c \\\"java Main.java\\\" -d ./test/'\" >> $HOME/.bashrc \
    && echo \"alias acs='acc submit Main.java -- -l 5005' \" >> $HOME/.bashrc"

CMD ["/bin/bash"]


