FROM ubuntu:bionic

USER root

RUN apt-get update && apt-get upgrade -y

RUN apt-get install -y tzdata
RUN apt-get install -y make build-essential
RUN apt-get install -y zlib1g-dev libbz2-dev
RUN apt-get install -y libreadline-dev libsqlite3-dev
RUN apt-get install -y wget curl llvm libncurses5-dev libncursesw5-dev
RUN apt-get install -y xz-utils tk-dev libffi-dev liblzma-dev git
RUN apt-get install -y libssl1.0-dev                    
RUN curl https://pyenv.run | bash
RUN echo 'eval "$(pyenv init -)"' >> ~/.bashrc
RUN echo 'eval "$(pyenv virtualenv-init -)"' >> ~/.bashrc

ENV PATH /root/.pyenv/bin:$PATH
RUN pyenv install 2.6.6
RUN pyenv install 3.5.0

RUN pyenv global 3.5.0

WORKDIR /usr/local/src
