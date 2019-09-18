A typical user will not need to install the [SLURM Work Load Manager](https://slurm.schedmd.com/overview.html), but we will in this step to get an idea of what it is like running on a computer cluster.

`apt update && apt install -y slurm-wlm slurm-drmaa-dev python-drmaa`{{execute}}

`zcat /usr/share/doc/slurm-client/examples/slurm.conf.simple.gz | sed -e 's/laptop/host01/' -e 's/NodeName=server/NodeName=host01/' -e 's/Nodes=server/Nodes=host01/' > /etc/slurm-llnl/slurm.conf`{{execute}}

`systemctl start --now slurmd slurmctld`{{execute}}

A Work Load Manager is not required to run programs on a computer cluster. You could A Work Load Manager is not required The core idea of a Work Load Manager is, given a 

`srun ping -c 5 google.com`{{execute}}

TODO: If you have a computer cluster (i.e. a The primary purpose is  idea of a workload manager is, assuming you have a lot of computers and/or a lot of users

`sinfo`{{execute}}

`squeue`{{execute}}

`docker run -it -h ernie -v $HOME:$HOME -w $PWD giovtorres/docker-centos7-slurm:latest`{{copy}}

TODO: add snakemake section running with --drmaa and with --cluster
