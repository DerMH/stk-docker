FROM ubuntu:18.04
USER root
WORKDIR .
RUN useradd -m -u 1200 -s /bin/bash stk
USER stk
COPY  ./server_config.xml /home/stk/stk/server_config.xml
USER root
WORKDIR /home/stk
RUN apt-get update && apt-get install -y git subversion build-essential cmake libbluetooth-dev libsdl2-dev libcurl4-openssl-dev libenet-dev libfreetype6-dev libharfbuzz-dev libfribidi-dev libgl1-mesa-dev libglew-dev libjpeg-dev libogg-dev libopenal-dev libpng-dev libssl-dev libvorbis-dev libxrandr-dev libx11-dev nettle-dev pkg-config zlib1g-dev  && rm -rf /var/lib/apt/lists/*
RUN git clone https://github.com/supertuxkart/stk-code stk-code && svn co https://svn.code.sf.net/p/supertuxkart/code/stk-assets stk-assets
RUN cd stk-code && mkdir cmake_build && cd cmake_build && cmake .. -DSERVER_ONLY=ON && make -j$(nproc) && make install
USER stk
RUN supertuxkart --init-user --login=<user> --password=<password>
EXPOSE 2759
EXPOSE 2757
CMD  supertuxkart --server-config=/home/stk/stk/server_config.xml
