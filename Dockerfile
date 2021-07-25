FROM debian:stable
RUN apt-get update && apt-get install -y closure-compiler closure-linter make
RUN which fixjsstyle
WORKDIR /source
CMD cd /source && make fmt-js