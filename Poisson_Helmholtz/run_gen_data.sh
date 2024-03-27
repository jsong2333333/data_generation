#!/bin/bash

ntrain=32768
nval=4096
ntest=4096
ng=144
datapath='/path/to/data/poisson'

e1=5  # poissons diffusion eigenvalue range
e2=15

o1=5 # helmholtz wave number range
o2=15

# create poissons examples
python utils/gen_data_poisson.py --ntrain=$ntrain --nval=$nval --ntest=$ntest \
                    --ng=$ng --sparse --n 128 --datapath $datapath --e1 $e1 --e2 $e2
# create AD examples
#python utils/gen_data_advdiff.py --ntrain=$ntrain --nval=$nval --ntest=$ntest \
#                    --ng=$ng --sparse --n 128 --datapath $datapath --adr1 $adr1 --adr2 $adr2
# create Helm examples
#python utils/gen_data_helmholtz.py --ntrain=$ntrain --nval=$nval --ntest=$ntest \
#                    --ng=$ng --sparse --n 128 --datapath $datapath --o1 $o1 --o2 $o2

