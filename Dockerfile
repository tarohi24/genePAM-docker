FROM oracle/serverjre:9

WORKDIR ~

RUN yum -y  install gcc \
        zlib-devel \
        bzip2 \
        bzip2-devel \
        readline \
        readline-devel \
        sqlite \
        sqlite-devel \
        openssl \
        openssl-devel \
        git

ENV PYENV_ROOT $HOME/.pyenv
ENV PATH $PYENV_ROOT/bin:$PATH

RUN git clone --depth 1 https://github.com/pyenv/pyenv.git $PYENV_ROOT
RUN echo 'eval "$(pyenv init -)"' >> ~/.bashrc
RUN source ~/.bashrc
RUN pyenv install 3.6.1
RUN pyenv rehash

RUN curl -kL https://bootstrap.pypa.io/get-pip.py | python
RUN pyenv global 3.6.1
RUN pip install pyyaml

RUN mkdir ora result
RUN git clone https://github.com/tarohi24/genePAM.git

VOLUME $HOME/ora
VOLUME $HOME/result
