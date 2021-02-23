FROM ubuntu

# https://medium.com/bandprotocol/bandchain-phase-1-successful-mainnet-upgrade-and-guanyu-launch-ac2d0334da77
# https://medium.com/bandprotocol/bandchain-guanyu-testnet-3-successful-upgrade-how-to-join-as-a-validator-2766ca6717d4

ENV release_env=test
ENV moniker=wagyu-testnet
ENV chainid=band-guanyu-testnet3

# setup.sh
RUN apt-get update \
&& apt-get upgrade -y \
&& apt-get install -y build-essential curl wget \
&& wget https://golang.org/dl/go1.14.9.linux-amd64.tar.gz \
&& tar -C /usr/local -xzf go1.14.9.linux-amd64.tar.gz \
&& rm go1.14.9.linux-amd64.tar.gz \
&& echo "export PATH=\$PATH:/usr/local/go/bin:~/go/bin" >> $HOME/.profile \
&& source ~/.profile

# install_bandd.sh
RUN git clone https://github.com/bandprotocol/bandchain \
&& bandchain/chain \
&& git checkout v1.2.7 \ 
&& make install 

RUN bandd init --chain-id ${chainid} ${moniker}

# CMD bandd start --rpc.laddr tcp://0.0.0.0:26657
