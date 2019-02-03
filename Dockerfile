FROM ivanpondal/alpine-latex:1.1.0

RUN apk --no-cache add perl wget && \
	apk del perl wget

	# tlmgr install algorithmicx && \
