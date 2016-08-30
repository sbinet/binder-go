from andrewosh/binder-base
maintainer Sebastien Binet <binet@cern.ch>

user root

# install Go
run apt-get update -y
run apt-get install -y curl git pkg-config libzmq-dev build-essential
run curl -O -L https://golang.org/dl/go1.7.linux-amd64.tar.gz
run tar -C /usr/local -zxf /home/main/go1.7.linux-amd64.tar.gz

user main

run mkdir $HOME/gopath
env PATH /usr/local/go/bin:$PATH
env GOPATH $HOME/gopath
env PATH $GOPATH/bin:$PATH

run go get golang.org/x/tools/cmd/goimports
run go get github.com/gopherds/gophernotes

# install the Go kernel
run mkdir -p $HOME/.ipython/kernels
run cp -r $GOPATH/src/github.com/gopherds/gophernotes/kernel $HOME/.ipython/kernels/gophernotes
copy ./kernel.json $HOME/.ipython/kernels/gophernotes/.


# add an example
run mkdir $HOME/notebooks
copy examples notebooks/.

user root
run chown -R main:main /home/main/notebooks
