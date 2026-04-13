FROM debian:stable-slim

RUN apt-get update && apt-get install -y procps && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY monitor.sh .

RUN chmod +x monitor.sh

RUN mkdir -p /var/www

CMD ["./monitor.sh"]
