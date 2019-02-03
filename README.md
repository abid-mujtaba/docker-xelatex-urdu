# docker-xelatex-urdu

The purpose of this project is to provide a Docker container that uses XeLaTeX to compile Urdu documents, in particular the [Urdu textbooks](https://github.com/khalidyousafzai) written by Khalid Yousafzai.

## Components

This docker image is based on the alpine OS and uses the texlive-2016 distribution (managed via tlmgr).

## Attribution

Most of the hard work behind making this work comes from this [repo](https://github.com/dc-uba/docker-alpine-texlive) which I have forked and then heavily modified.
