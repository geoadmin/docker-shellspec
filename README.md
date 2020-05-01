# docker-shellspec

This repo contains the Dockerfile to create a custom docker-packaged shellspec executable.

The container expects to find the specs in `/src/spec`. So if your current working directory contains a folder `spec/`, you can mount this folder in the container at `/src`:
```
docker run -it --rm -v ${PWD}:/src swisstopo/shellspec:latest
```

If you don't specify arguments, `shellspec` is executed as is. Running 
```
docker run -it --rm -v ${PWD}:/src swisstopo/shellspec:latest --help
```
prints the shellspec help.

So to run the tests in the bash and creating reports in junit format in a newly created folder `reports/`, you can run
```
docker run -it --rm -v ${PWD}:/src swisstopo/shellspec:latest -s bash -o j
```
