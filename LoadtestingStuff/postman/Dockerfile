FROM ubuntu:22.04

# Install dependencies
RUN apt-get update && \
    apt-get install -y wget libgconf-2-4 libnss3 libxss1 libappindicator1 libindicator7 \
    libgdk-pixbuf2.0-0 libx11-xcb1 libxcomposite1 libxdamage1 libxtst6 libnss3-tools \
    libxrandr2 libgbm1 libxkbcommon0 libxshmfence1

# Download and install Postman
RUN wget https://dl.pstmn.io/download/latest/linux64 -O postman.tar.gz && \
    tar -xzf postman.tar.gz -C /opt && \
    rm postman.tar.gz

# Set up Postman
ENV PATH="/opt/Postman:${PATH}"

# Set working directory
WORKDIR /opt/Postman

# Default command
CMD ["postman"]
