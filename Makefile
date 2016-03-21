.Phony := all

image-alpine-go16 := $(shell docker images -q alpine-go16)

all: image-alpine-go16

image-alpine-go16:
ifndef image-alpine-go16
	@packer build alpine-go16.json
endif

clean:
	@-docker rmi -f alpine-go16

test: all
	docker run --rm alpine-go16 go version
