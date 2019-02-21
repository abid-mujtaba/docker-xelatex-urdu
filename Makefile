IMG:=urdu-textbook

test: build
	docker run -it -v /tmp/build:/tmp/build ${IMG} pdflatex /tmp/build/test.tex

shell: build
	docker run -it -v /tmp/build:/tmp/build ${IMG} bash


build: 
	cd build; \
	docker build . -t ${IMG}


.PHONY: build shell test
