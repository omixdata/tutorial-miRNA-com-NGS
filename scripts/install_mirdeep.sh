#!/bin/bash

# instalar dependências do mirdeep2

mkdir -p bin/
cd bin/
git clone https://github.com/rajewsky-lab/mirdeep2 || echo 'mirdeep2 já foi clonado'
cd mirdeep2
perl install.pl

# adicionar caminhos ao PATH

source ~/.bashrc
perl install.pl
cd .. 

# instalar o SQUID

wget -O squid.tar.gz http://eddylab.org/software/squid/squid.tar.gz
tar -xvf squid.tar.gz
cd squid-1.9g
bash configure
make
make install
cd ..

# instalar o randfold

git clone https://github.com/eb00/randfold || echo 'randfold já foi clonado'
cd randfold/src
bash configure
make
cp randfold /usr/local/bin/
cd ../..

# ultima checagem no mirdeep2

cd mirdeep2
perl install.pl
