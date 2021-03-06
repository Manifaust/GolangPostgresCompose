FROM golang:1.16-alpine

# RUN apk add --no-cache git

# create app directory
RUN mkdir /app

# add source code
ADD . /app

## We specify that we now wish to execute
## any further commands inside our /app
## directory
WORKDIR /app

## Add this go mod download command to pull in any dependencies
RUN go mod download

## we run go build to compile the binary
## executable of our Go program
RUN go build -o main .

## Our start command which kicks off
## our newly created binary executable
CMD ["/app/main"]

# Expose port 8085 to the outside world
EXPOSE 1323 1323

