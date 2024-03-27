# Rebuttal Materials - ICML 2024 Submission#5543 "Data-Efficient Operator Learning via Unsupervised Pretraining and In-Context Learning" (https://openreview.net/forum?id=KvnawtOTeR)
  
## Data Generation
This repository contains PyTorch code for PDE data generation for Poisson, Helmholtz, Reaction-Diffusion, and Navier-Stokes equationis. The data generation code is adopted respectively from 
- `NavierStokes`: [PINO](https://github.com/neuraloperator/physics_informed),
- `PoissonHelmholtz`: [neuraloperators-TL-scaling](https://github.com/ShashankSubramanian/neuraloperators-TL-scaling),
- `ReactionDiffusion`: [PDEBench](https://github.com/pdebench/PDEBench).

### Environment
For the necessary packages for generating data for each equation, please follow the environment setup for each paper's repository.

### Navier-Stokes
The following example generates data with `Reynolds number (re) = 300` and `random seed (seed) = 0`. 
In our paper, we utilize `re = {100, 300, 500, 800, 1000}` for pretraining, `re = 300` for training and finetuning, and `re = 10000` for out-of-distribution (OOD) testing.
```
cd NavierStokes
python generate_data.py --seed 0 --re 300 
```

### Poisson and Helmholtz
The following example generates data with `diffusion eigenvalue (e1, e2) = [5, 15]` for Poisson and `wave number (o1, o2) = [5, 15]` for Helmholtz. 
- Poisson
In our paper, we utilize diffusion eigenvalue range `(e1, e2) = [1, 20]` for pretraining, `(e1, e2) = [5, 15]` for training and finetuning, and `(e1, e2) = [15, 50]` for out-of-distribution (OOD) testing.
```
cd Poisson_Helmholtz
python utils/gen_data_poisson.py --ntrain=2000 --nval=1000 --ntest=1000 \
                    --ng=0 --sparse --n 128 --datapath /datapath --e1 5 --e2 15
```
- Helmholtz
In our paper, we utilize wave number range `(o1, o2) = [1, 20]` for pretraining, `(o1, o2) = [5, 15]` for training and finetuning, and `(o1, o2) = [15, 20]` for out-of-distribution (OOD) testing.
```
cd Poisson_Helmholtz
python utils/gen_data_helmholtz.py --ntrain=2000 --nval=1000 --ntest=1000 \
                    --ng=0 --sparse --n 128 --datapath /datapath --o1 5 --o2 $15
```

### Reaction-Diffusion
The following example generates data with diffusion coefficients `Du = 1e-3, Dv = 5e-3`. The coefficients can be altered in the [yaml file](ReactionDiffusion/configs/diff-react.yaml):
```
sim:
  Du: 1E-3
  Dv: 5E-3
``` 
Then, run the following code to generate data.
```
cd ReactionDiffusion
python gen_diff_react.py
```
For the other [PDEBench](https://github.com/pdebench/PDEBench) data used in the paper, we download from their [DaRUS data repository](https://darus.uni-stuttgart.de/dataset.xhtml?persistentId=doi:10.18419/darus-2986).
