[![Circle CI](https://circleci.com/gh/jujugrrr/sample-go.svg?style=svg)](https://circleci.com/gh/jujugrrr/sample-go)

Sample-go is a demo web application returning a Hello world with the current hostname it's run from.
The application listen to port `8484`

# Installation

`go get -u github.com/jujugrrr/sample-go`

# Usage

`$GOPATH/bin/sample-go`

Then you can request the web application

```
myhostname$ curl localhost:8484
Hi there, I'm served from myhostname!
```

# Testing

Tests are run on circle-ci. Only basic lint test are run against the code, as there is no unit test.
Once a build has been successful an artifact is generated.
https://circleci.com/gh/jujugrrr/sample-go
