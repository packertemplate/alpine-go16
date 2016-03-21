# alpine-go16
repo to build a docker container for alpine with go16

## requirements

linux + docker + packer

## build

make

## compile

you can udpate the `compile.json` to allow packer run scripts, compile a project, and then download the generated files.

ie

```json
  "provisioners": [
    {
      "type": "shell",
      "inline": [
        "git clone https://<repo>/",
        "<commands>",
        "sleep 5"
      ]
    },
    {
      "type": "file",
      "source": "/path1/file1",
      "destination": "myip",
      "direction": "download"
    },
    {
      "type": "file",
      "source": "/path2/file2",
      "destination": "file2",
      "direction": "download"
    }
  ]
```
## test

make test

ie:
```bash
$ make
docker output will be in this color.

==> docker: Creating a temporary directory for sharing data...
==> docker: Pulling Docker image: alpine:edge
    docker: edge: Pulling from library/alpine
    docker: d6db411aa8ac: Already exists
    docker: Digest: sha256:d589e6df461e153f9ff27314770db73eb19d060dffb1f57f912f89039781d8d5
    docker: Status: Image is up to date for alpine:edge
==> docker: Starting docker container...
    docker: Run command: docker run -v /home/kikitux/.packer.d/tmp/packer-docker464573905:/packer-files -d -i -t alpine:edge /bin/sh -l
    docker: Container ID: 51c1e366da115d3c0428a06c4661a44c75bfd65d2f8526409bd3b26a7cf34e10
==> docker: Provisioning with shell script: /tmp/packer-shell399580415
    docker: http://dl-cdn.alpinelinux.org/alpine/edge/community
    docker: fetch http://dl-cdn.alpinelinux.org/alpine/edge/main/x86_64/APKINDEX.tar.gz
    docker: fetch http://dl-cdn.alpinelinux.org/alpine/edge/community/x86_64/APKINDEX.tar.gz
    docker: v160223-586-g403d54b [http://dl-cdn.alpinelinux.org/alpine/edge/main]
    docker: v160223-582-gf46cc6f [http://dl-cdn.alpinelinux.org/alpine/edge/community]
    docker: OK: 5947 distinct packages available
    docker: (1/3) Installing go (1.6-r1)
    docker: (2/3) Installing go-cross (1.6-r1)
    docker: (3/3) Installing go-tools (1.6-r1)
    docker: Executing busybox-1.24.1-r8.trigger
    docker: OK: 1538 MiB in 14 packages
==> docker: Committing the container
    docker: Image ID: sha256:00e03bad340f57081254ca80729a9feec84ab2d4b4660d19fddfcd135e91be2d
==> docker: Killing the container: 51c1e366da115d3c0428a06c4661a44c75bfd65d2f8526409bd3b26a7cf34e10
==> docker: Running post-processor: docker-tag
    docker (docker-tag): Tagging image: sha256:00e03bad340f57081254ca80729a9feec84ab2d4b4660d19fddfcd135e91be2d
    docker (docker-tag): Repository: alpine-go16:latest
Build 'docker' finished.

==> Builds finished. The artifacts of successful builds are:
--> docker: Imported Docker image: sha256:00e03bad340f57081254ca80729a9feec84ab2d4b4660d19fddfcd135e91be2d
--> docker: Imported Docker image: alpine-go16:latest

$ make test
docker run --rm alpine-go16 go version
go version go1.6 linux/amd64
$ 

$ docker images alpine-go16
REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
alpine-go16         latest              00e03bad340f        7 minutes ago       1.601 GB

```

