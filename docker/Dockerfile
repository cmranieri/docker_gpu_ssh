FROM tensorflow/tensorflow:2.11.0-gpu-jupyter

RUN apt-get -y update &&\ 
	apt-get install -y vim &&\
	pip install --upgrade pip

COPY requirements.txt /tmp/
RUN pip install -r /tmp/requirements.txt

RUN jupyter notebook --generate-config --allow-root
EXPOSE 8888

RUN mkdir -p /workspace
WORKDIR /workspace
