FROM ubuntu:latest

RUN apt update && apt install -y bc

COPY calculator.sh /app/calculator.sh

RUN chmod +x /app/calculator.sh

WORKDIR /app

CMD ["/app/calculator.sh"]
