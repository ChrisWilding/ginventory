FROM golang:1.15.5-buster AS build

WORKDIR /go/src/app
ADD . /go/src/app

RUN go get -d -v ./...
RUN go build -o /go/bin/app -trimpath


FROM gcr.io/distroless/base
COPY --from=build /go/bin/app /
CMD ["/app"]
