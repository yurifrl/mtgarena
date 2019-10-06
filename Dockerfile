FROM scottyhardy/docker-wine:latest AS base
RUN add-apt-repository -y ppa:lutris-team/lutris && \
    apt-get update && \
    apt-get install -y lutris
RUN apt-get install -y elfutils libglu1-mesa libglu1-mesa-dev \
    libglu-dev libstdc++5 libxcursor-dev libopenal1 libopenal-dev \
    perl ibsdl-mixer1.2-dev ibsdl-mixer1.2 libsdl-image1.2-dev \
    libsdl-image1.2 build-essential git \
    g++-multilib libelf-dev p7zip-full wget
RUN apt install -y libvulkan1 mesa-vulkan-drivers vulkan-utils firefox
RUN git clone https://github.com/lutris/lutris /usr/local/lutris

FROM base
USER wineuser
RUN wget "https://mtgarena.downloads.wizards.com/Live/Windows32/MTGAInstaller.exe" -P .
RUN curl https://lutris.net/api/installers/magic-the-gathering-arena-latest?format=json > ./magic-the-gathering-arena.json
RUN touch /home/wineuser/HY
RUN ls -la
RUN pwd
