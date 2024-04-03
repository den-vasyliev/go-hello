#
APP=hello
#posible OS: linux,darwin,windows
TARGETOS=linux
#posible ARCH: amd64,arm,386
TARGETARCH=amd64 
#
VERSION=v1.0.0
#
REGESTRY=gcr.io/gke-test-416709/

format: 
	gofmt -s -w ./

get:
	go get

build: 
	CGO_ENABLED=0 GOOS=${TARGETOS} GOARCH=${TARGETARCH} go build -v -o ${APP}

images:
	docker build build --platform ${TARGETOS}/${TARGETARCH} . -t ${REGESTRY}${APP}:${VERSION}-${TARGETOS}

push:
	docker push ${REGESTRY}${APP}:${VERSION}-${TARGETOS}
	
clear: 
	rm -rf ${APP}
	docker rmi ${REGESTRY}${APP}:${VERSION}-${TARGETOS}
