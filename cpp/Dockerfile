FROM ubuntu:latest

# setup C++ (GCC 12.3)
RUN apt update && apt upgrade -y && apt install -y build-essential gcc-12 g++-12 curl time git
RUN update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-12 12 \
    && update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-12 12

# setup atcoder-cli & aclogin
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash \
    && apt install -y python3-pip python3-venv \
    && pip install aclogin
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

COPY /workspace/templates/cpp /opt/workspace

RUN ln -s /opt/workspace/templates/cpp /root/.config/atcoder-cli-nodejs/cpp

RUN /bin/bash -c "source $HOME/.nvm/nvm.sh && acc config default-test-dirname-format test \
    && acc config default-task-choice all \
    && acc config default-template cpp \
    && echo \"alias ojt='g++ Main.cpp && oj t -d ./test/'\" >> $HOME/.bashrc \
    && echo \"alias acs='acc submit Main.cpp -- -l 5001' \" >> $HOME/.bashrc"

CMD ["/bin/bash"]
