# Increase memory to deal with large iso
build: # mount-iso 
	docker build . -t urdu-textbook -m 6g

mount-iso: iso
	mkdir iso
	sudo mount -o loop texlive2016-20160523.iso ./iso/

iso: texlive2016-20160523.iso

texlive2016-20160523.iso:
	wget "ftp://tug.org/historic/systems/texlive/2016/texlive2016-20160523.iso"

