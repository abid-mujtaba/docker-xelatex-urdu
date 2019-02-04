FROM ivanpondal/alpine-latex:1.1.0

# Development version (don't want to install perl and wget every time)
RUN apk --no-cache add perl wget

# Update tlmgr before installing packages
RUN tlmgr --repository http://mirrors.rit.edu/CTAN/systems/texlive/tlnet update --self

RUN tlmgr --repository http://mirrors.rit.edu/CTAN/systems/texlive/tlnet install xetex

# Final version
# RUN apk --no-cache add perl wget && \
# 	tlmgr install xelatex && \
# 	apk del perl wget
