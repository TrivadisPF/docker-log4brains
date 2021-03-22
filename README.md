# docker-log4brains

Support of [log4brains](https://github.com/thomvaill/log4brains) in Docker. The image is available in [Docker Hub](https://hub.docker.com/repository/docker/trivadis/log4brains).

## Preview Command

Run log4brains in preview mode with the log4brains sample ADRs being rendered.

```
docker run -d -rm -p 4004:4004 trivadis/log4brains 
```

Run log4brains in preview mode with your ADR documents. Should be run in the folder with the `.log4brains.yml` file.

```
docker run -d -rm -p 4004:4004 -v ${PWD}:/opt/adr trivadis/log4brains 
```

## Build Command

Run log4brains build with your ADR documents, with the output being written to the `.log4brains` folder in `${PWD}`.

```
docker run --rm -v ${PWD}:/opt/adr trivadis/log4brains log4brains build
```

## Init Command

To create a new ADR project, use the following command and answer the questions

```
docker run -ti --rm -v ${PWD}:/opt/adr trivadis/log4brains log4brains init
```
