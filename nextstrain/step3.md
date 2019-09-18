Start a single node SLURM cluster

`docker run -it -h ernie -v $HOME:$HOME -w $PWD giovtorres/docker-centos7-slurm:latest`{{execute}}

`conda activate nextstrain`

`conda install -q -y -c conda-forge cookiecutter`{{execute}}

`LC_ALL=en_US.utf8 cookiecutter https://github.com/Snakemake-Profiles/slurm.git`{{profile}}

`snakemake --profile slurm --jobs 999 --cores 12`{{execute}}
