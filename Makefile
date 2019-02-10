ISO:=texlive2016-20160523.iso


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


.PHONY: build mount-iso umount
