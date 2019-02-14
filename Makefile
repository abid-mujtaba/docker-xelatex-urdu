ISO:=texlive2016-20160523.iso
BIN:=texlive-20160523-bin
IMG:=urdu-textbook

shell:
	docker run -it -v ${CURDIR}/build/src/bin/x86_64-linux:/usr/local/texlive/2016/bin -v /tmp/build:/tmp/build ${IMG} bash


# Increase memory to deal with large iso
build: build/iso
	cd build; \
	docker build . -t urdu-textbook -m 10g

build/iso: ${ISO}
	mkdir -p build/iso
	sudo mount -o loop ${ISO} ./build/iso/

${ISO}:
	wget "ftp://tug.org/historic/systems/texlive/2016/${ISO}"


unmount:
	sudo umount ./build/iso
	rm -r ./build/iso


# Unpack only the x86_64-linux bin files
bin: ${BIN}.tar.xz build/src/bin
	tar -xvf ${BIN}.tar.xz ${BIN}/x86_64-linux
	mv ${BIN}/x86_64-linux build/src/bin/


# Fetch the bin tar-ball and confirm its integrity
${BIN}.tar.xz:
	wget "ftp://tug.org/historic/systems/texlive/2016/${BIN}.tar.xz"
	wget "ftp://tug.org/historic/systems/texlive/2016/${BIN}.tar.xz.sha512"

	sha512sum -c ${BIN}.tar.xz.sha512


build/src/bin:
	mkdir -p build/src/bin


.PHONY: build mount-iso umount bin
