FROM band-preinit

ENV HOME=/root
ENV PATH=${PATH}:/usr/local/go/bin:${HOME}/go/bin

# note that these are just for documentation purposes. You actually have to still expose the port via docker compose or docker cli
EXPOSE 26656
EXPOSE 26657

WORKDIR ${HOME}/bandchain/chain
RUN make install

CMD bandd start
