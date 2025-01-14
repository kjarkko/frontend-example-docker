FROM ubuntu:16.04

WORKDIR app/
COPY . .

RUN apt-get update && apt-get install -y curl && \
    curl -sL https://deb.nodesource.com/setup_10.x | bash && \
    apt install -y nodejs && \
    npm install && \
    apt-get purge -y --auto-remove curl && \
    rm -rf /var/lib/apt/lists/* && \
    npm run build && \
    npm install -g serve

ENV PORT=5000

CMD serve -s -l $PORT dist
