Sample-go is a demo web application returning a Hello world with the current hostname it's run from.
The application listen to port `8484`

## Installation

`go get -u github.com/jujugrrr/sample-go`

## Usage

$GOPATH/bin/sample-go

Then you can request the web application

```
myhostname$ curl localhost:8484
Hi there, I'm served from myhostname!
```
