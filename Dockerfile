# Этап 1: Сборка
FROM ubuntu:22.04 AS build-stage

RUN apt-get update && apt-get install -y \
    build-essential \
    gcc \
    libc6-dev

WORKDIR /app
COPY ./app /app
RUN gcc -o my_shell main.c

# Этап 2: Минимальный запуск
FROM ubuntu:22.04
COPY --from=build-stage /app/my_shell /my_shell
ENTRYPOINT ["/my_shell"]
