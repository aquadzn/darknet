# From https://hub.docker.com/r/alemelis/darknet

# Change 10.1 for 10.0 if specific CUDA version needed
FROM nvidia/cuda:10.1-cudnn7-devel-ubuntu18.04
ARG DEBIAN_FRONTEND=noninteractive

RUN apt update
RUN apt install -y git pkg-config build-essential libopencv-dev

WORKDIR /app
RUN git clone -b work --single-branch https://github.com/aquadzn/darknet.git
WORKDIR /app/darknet

RUN make OPENCV=1 GPU=1 AVX=1 OPENMP=1 CUDNN=1 CUDNN_HALF=1 OPENMP=1 -j $(nproc)
RUN chmod +x darknet

ENTRYPOINT ["/app/darknet/darknet"]