# Dockerfile to create a container-packaged version
# of shellspec that can be used in CI

# TODO: change base image to swisstopo python base image
# once available
#FROM ubuntu:18.04
FROM python:3.7-buster


# see https://github.com/shellspec/shellspec/blob/master/docs/docker.md#4-include-shellspec-into-another-image
COPY --from=shellspec/shellspec-scratch /opt/shellspec /opt/shellspec
ENV PATH /opt/shellspec/:$PATH


# Create unprivileged user
# ------------------------
# The gosu and entrypoint magic is used to create an unprivileged user
# at `docker run`-time with the same uid as the host user. Thus, the mounted
# host volume has the correct uid:guid permissions. For details:
# https://denibertovic.com/posts/handling-permissions-with-docker-volumes/
# Installation of gosu:
# https://github.com/tianon/gosu/blob/master/INSTALL.md
RUN set -eux; \
	apt-get update; \
	apt-get install -y \
        gosu \
        bc; \
	rm -rf /var/lib/apt/lists/*; \
# verify that the binary works
	gosu nobody true
# Note: the bc is added here for build/cache optimization reasons
# it doesn't belong the gosu stuff



COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]

WORKDIR /src
#USER testuser
ENTRYPOINT [ "shellspec" ]
