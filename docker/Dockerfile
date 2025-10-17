FROM tensorflow/tensorflow:latest-gpu-jupyter

RUN apt-get -y update && apt-get install -y \
    git \
    vim

COPY requirements.txt /tmp/
RUN pip install -r /tmp/requirements.txt

RUN jupyter notebook --generate-config --allow-root
EXPOSE 8888

RUN mkdir -p /workspace
WORKDIR /workspace
