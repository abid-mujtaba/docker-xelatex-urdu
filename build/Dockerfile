FROM ubuntu:18.04

ENV PATH "$PATH:/usr/local/texlive/bin"

# Update repos
RUN apt-get update && apt-get -y upgrade

# Install build tools to get 'cpan' utility to install perl modules
RUN apt-get -y install build-essential

COPY src/ /usr/local/
