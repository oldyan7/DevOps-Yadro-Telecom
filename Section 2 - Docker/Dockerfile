FROM ubuntu:22.04

RUN apt-get update && \
    apt-get install -y curl && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

COPY http_test.sh /http_test.sh

RUN chmod +x /http_test.sh

CMD ["/http_test.sh"]
