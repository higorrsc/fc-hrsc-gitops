FROM golang:1.24.6-alpine AS build
WORKDIR /app
COPY . .
RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o server

FROM scratch
WORKDIR /app
COPY --from=build /app/server .
ENTRYPOINT [ "./server" ]