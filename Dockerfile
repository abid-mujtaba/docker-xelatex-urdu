FROM alpine:3.5

RUN    mkdir /tmp/iso

WORKDIR /tmp/iso

COPY texlive.profile /tmp/
COPY texlive2016-20160523.iso /tmp/

RUN    mount -o loop /tmp/texlive2016-20160523.iso . \
	&& ./install-tl --profile=/tmp/texlive.profile


# COPY iso /tmp/
# RUN    ls /tmp/iso
# RUN    ./install-tl --profile=/tmp/texlive.profile

# RUN mkdir /tmp/install-tl-unx
#
# WORKDIR /tmp/install-tl-unx
#
# COPY texlive.profile .

# # Install TeX Live 2016 with some basic collections
# RUN apk --no-cache add perl wget \
# 	xz tar && \
# 	wget ftp://tug.org/historic/systems/texlive/2016/install-tl-unx.tar.gz && \
# 	tar --strip-components=1 -xvf install-tl-unx.tar.gz && \
# 	./install-tl --profile=texlive.profile && \
# 	apk del perl wget xz tar && \
# 	cd && rm -rf /tmp/install-tl-unx
#
# 	# tlmgr install collection-latex collection-latexextra collection-langspanish && \
# 	# ./install-tl --repository http://mirrors.rit.edu/CTAN/systems/texlive/telnet/ --profile=texlive.profile && \
#
# # Install additional packages
# # RUN apk --no-cache add perl=5.24.0-r0 wget=1.18-r2 && \
# # 	tlmgr install bytefield algorithms algorithm2e ec fontawesome && \
# # 	apk del perl wget && \
# # 	mkdir /workdir
#
# ENV PATH="/usr/local/texlive/2016/bin/x86_64-linux:${PATH}"
#
# WORKDIR /workdir
#
# VOLUME ["/workdir"]
