BIN:=texlive-20160523-bin
TEXMF:=texlive-20160523b-texmf
IMG:=urdu-textbook

SRC:=build/src

shell:
	docker run -it -v /tmp/build:/tmp/build ${IMG} bash


build: 
	cd build; \
	docker build . -t urdu-textbook


# Unpack only the x86_64-linux bin files
bin: ${BIN}/x86_64-linux ${SRC}/bin
	cp ${BIN}/x86_64-linux/pdftex ${SRC}/bin/
	cd ${SRC}/bin; ln -s pdftex pdflatex

${BIN}/x86_64-linux:
	# ${BIN}.tar.xz build/src/bin
	tar -xvf ${BIN}.tar.xz ${BIN}/x86_64-linux


# Fetch the bin tar-ball and confirm its integrity
${BIN}.tar.xz:
	wget "ftp://tug.org/historic/systems/texlive/2016/${BIN}.tar.xz"
	wget "ftp://tug.org/historic/systems/texlive/2016/${BIN}.tar.xz.sha512"

	sha512sum -c ${BIN}.tar.xz.sha512


build/src/bin:
	mkdir -p $@


texmf: ${TEXMF}.tar.xz build/src/texmf


${TEXMF}.tar.xz:
	wget "ftp://tug.org/historic/systems/texlive/2016/${TEXMF}.tar.xz"
	wget "ftp://tug.org/historic/systems/texlive/2016/${TEXMF}.tar.xz.sha512"

	sha512sum -c ${TEXMF}.tar.xz.sha512


build/src/texmf:
	mkdir -p $@


.PHONY: build umount bin
