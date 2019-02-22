IMG:=urdu-textbook
WORKDIR:=/tmp/build		# As defined in the Dockerfile


test: build
	docker run -it -v ${CURDIR}:${WORKDIR} ${IMG} pdflatex test.tex


shell: build
	docker run -it -v ${CURDIR}:${WORKDIR} ${IMG} bash


build: 
	docker build . -t ${IMG}


.PHONY: build shell test
