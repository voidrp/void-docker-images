FROM node:18

RUN apt-get update && apt-get install -y \
    tmux \
    python3 \
    make \
    g++ \
    procps \
    ca-certificates \
    curl \
 && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /opt/java && \
    curl -fsSL "https://api.adoptium.net/v3/binary/latest/21/ga/linux/x64/jre/hotspot/normal/eclipse" \
    | tar -xz -C /opt/java --strip-components=1

ENV JAVA_HOME=/opt/java
ENV PATH="$JAVA_HOME/bin:$PATH"

WORKDIR /app

COPY package*.json ./
RUN npm install
RUN npm install express-session connect-flash bcrypt
RUN npm install express-socket.io-session

COPY . .

EXPOSE 3000
CMD ["node", "js/server.js"]
