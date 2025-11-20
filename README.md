Dockerized [Webhook](https://github.com/adnanh/webhook/) + Docker CLI (meant for use with remote docker or Docker Socket Proxy)
=================

## What is the use of this image?

My use case is triggering Docker commands via a webhook, but keeping the Docker Socket isolated. [Webhook](https://github.com/adnanh/webhook/) provides a reliable way to create the webhook. So we just need to bundle it with Docker CLI, and mount the Docker Socket (or a Proxy). This image is based on [almir/docker-webhook](https://github.com/almir/docker-webhook), I'm just adding the Docker CLI.

If your use case is this simple, and you don't need anything other than Webhook and the Docker CLI, feel free to use this image!

## Usage

TODO: Document usage, along with [Docker Socket Proxy](https://hub.docker.com/r/tecnativa/docker-socket-proxy)

Try with the docker socket directly:

```shell
docker run --rm -it \
  --user=0 \
  -p 9000:9000 \
  -v ./examples/hooks.json:/etc/webhook/hooks.json \
  -v ./examples/docker_command.sh:/etc/webhook/docker_command.sh \
  -v /var/run/docker.sock:/var/run/docker.sock \
  ghcr.io/angelxehg/webhook-docker-cli:main \
  --verbose
```

Now you can hit it with curl:

```shell
curl -X POST http://localhost:9000/hooks/docker-command
```

## Development

Clone this repository:

```shell
git clone https://github.com/angelxehg/webhook-docker-cli -b main
```

Build the image:

```shell
docker build -t webhook-docker-cli .
```

Try with the docker socket directly:

```shell
docker run --rm -it \
  --user=0 \
  -p 9000:9000 \
  -v ./examples/hooks.json:/etc/webhook/hooks.json \
  -v ./examples/docker_command.sh:/etc/webhook/docker_command.sh \
  -v /var/run/docker.sock:/var/run/docker.sock \
  webhook-docker-cli \
  --verbose
```

Now you can hit it with curl:

```shell
curl -X POST http://localhost:9000/hooks/docker-command
```
