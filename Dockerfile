FROM debian:12-slim

RUN apt update && apt install -y curl openssl ca-certificates bash \
    && curl -fL https://github.com/tsl0922/ttyd/releases/latest/download/ttyd.x86_64 -o /usr/local/bin/ttyd \
    && chmod +x /usr/local/bin/ttyd \
    && rm -rf /var/lib/apt/lists/*

COPY start.sh /start.sh
RUN chmod +x /start.sh

EXPOSE 80 3000

CMD ["/start.sh"]
