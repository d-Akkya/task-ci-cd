# ====================================== Stage 1: Build stage (prepares files) ========================================================
FROM ubuntu:20.04 AS builder

ARG CONTAINER_NO

WORKDIR /app

RUN echo "<html><body><h1>Hello from Apache - Container $CONTAINER_NO</h1></body></html>" > index.html

# ================================================== Stage 2: Final Image ========================================================
FROM httpd:alpine

ARG CONTAINER_NO

COPY --from=builder /app/index.html /usr/local/apache2/htdocs/index.html

EXPOSE 80
