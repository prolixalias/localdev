# localdev selenium chrome

FROM prolixalias/localdev:latest

USER localdev
ARG CHROME_VERSION="google-chrome-stable"
RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add - && \
    echo "deb http://dl.google.com/linux/chrome/deb/ stable main" | sudo tee /etc/apt/sources.list.d/google-chrome.list && \
    sudo apt update -qqy && \
    sudo apt upgrade -qqy && \
    sudo apt install -qqy ${CHROME_VERSION:-google-chrome-stable} python3 python3-pip libnss3-tools libnss3-dev && \
    pip install selenium bs4 html5lib datetime && \
    sudo apt clean && \
    sudo apt -qqy install  && \
    sudo rm /etc/apt/sources.list.d/google-chrome.list && \
    sudo rm -rf /var/lib/apt/lists/* /var/cache/apt/*
ENTRYPOINT /usr/bin/zsh