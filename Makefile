BIN:=texlive-20160523-bin
TEXMF:=texlive-20160523-texmf
IMG:=urdu-textbook

SRC:=build/src
SRC-TEXMF:=${SRC}/bin/share/texmf

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


texmf: ${SRC-TEXMF}/web2c/texmf.cnf
	

${SRC-TEXMF}/web2c/texmf.cnf: ${TEXMF}
	cp ${TEXMF}/texmf-dist/web2c/texmf.cnf ${SRC-TEXMF}/web2c/


${TEXMF}:
#	# Note the difference in spelling between the tar file and the extracted folder
	tar -xvf texlive-20160523b-texmf.tar.xz


${TEXMF}.tar.xz:
	wget "ftp://tug.org/historic/systems/texlive/2016/${TEXMF}.tar.xz"
	wget "ftp://tug.org/historic/systems/texlive/2016/${TEXMF}.tar.xz.sha512"

	sha512sum -c ${TEXMF}.tar.xz.sha512


${SRC}/texmf:
	mkdir -p $@


${SRC-TEXMF}/web2c:
	mkdir -p $@


.PHONY: build umount bin
