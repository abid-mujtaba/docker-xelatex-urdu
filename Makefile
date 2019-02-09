build: iso
	@echo "Building"

iso: texlive2016-20160523.iso

texlive2016-20160523.iso:
	wget "ftp://tug.org/historic/systems/texlive/2016/texlive2016-20160523.iso"

