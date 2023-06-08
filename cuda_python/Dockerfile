ARG NVIDIA_CUDA_IMAGE
FROM $NVIDIA_CUDA_IMAGE

ARG DEBIAN_FRONTEND=noninteractive

RUN apt update && apt install -y build-essential gdb lcov pkg-config \
      libbz2-dev libffi-dev libgdbm-dev libgdbm-compat-dev liblzma-dev \
      libncurses5-dev libreadline6-dev libsqlite3-dev libssl-dev \
      lzma lzma-dev tk-dev uuid-dev zlib1g-dev

ARG PYTHON_VERSION

RUN apt install wget git vim -y \
    && wget https://www.python.org/ftp/python/$PYTHON_VERSION/Python-$PYTHON_VERSION.tgz \
    && tar xzf Python-$PYTHON_VERSION.tgz \
    && rm Python-$PYTHON_VERSION.tgz

ARG PYTHON_VERSION

RUN cd Python-$PYTHON_VERSION \
    && ./configure --enable-optimizations \
    && make install -j$(nproc)
