#!bin/bash

cd ..

docker run --gpus all \
	    -p 8888:8888 \
        -p 6006:6006 \
	    -it \
	    --rm \
        -u $(id -u):$(id -g) \
	    -v ${PWD}/:/workspace \
	    my-tf \
	    bash
