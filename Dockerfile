FROM ubuntu

ARG DEBIAN_FRONTEND="noninteractive"

# Install python
RUN apt-get update
RUN apt-get install -y python3 python3-pip python3-venv build-essential imagemagick xmlstarlet gdal-bin python3-gdal libgdal-dev
RUN apt-get install wget
RUN echo 'PATH="$HOME/.local/bin/:$PATH"' >>~/.bashrc

ADD . /app
WORKDIR /app

RUN pip install "GDAL<=$(gdal-config --version)"
RUN pip install toml

RUN export S57_PROFILE
RUN export OGR_S57_OPTIONS=SPLIT_MULTIPOINT=ON,ADD_SOUNDG_DEPTH=ON
