A typical user will not need to install the [SLURM Work Load Manager](https://slurm.schedmd.com/overview.html), but we will in this step to get an idea of what it is like running on a computer cluster.

`apt update && apt install -y slurm-wlm slurm-drmaa-dev python-drmaa`{{execute}}

`zcat /usr/share/doc/slurm-client/examples/slurm.conf.simple.gz | sed -e 's/laptop/host01/' -e 's/NodeName=server/NodeName=host01/' -e 's/Nodes=server/Nodes=host01/' > /etc/slurm-llnl/slurm.conf`{{execute}}

`systemctl start --now slurmd slurmctld`{{execute}}

---

`srun ping -c 5 google.com`{{execute}}

`sinfo`{{execute}}

`squeue`{{execute}}

TODO: add snakemake section running with --drmaa and with --cluster
