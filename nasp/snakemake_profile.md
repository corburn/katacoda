`snakemake --profile nasp`

https://snakemake.readthedocs.io/en/stable/snakefiles/configuration.html#cluster-configuration

With `--cluster sbatch` 

`snakemake \
  --use-conda \
  --jobs 100 \
  --directory ./testdata \
  --cluster "sbatch -n 1 -t 00:15:00" \
  -- iqtree`

Given a `--cluster-config`, the `--cluster` command can be generalized with placeholders:

`snakemake \
  --use-conda \
  -j 999 \
  --cluster-config $HOME/.config/snakemake/nasp/cluster.yaml \
  --cluster "sbatch -A {cluster.account} -p {cluster.partition} -n {cluster.n} -t {cluster.time}" \
  -- iqtree`

The following is an example of a cluster config. `__default__` is a special rule

<pre class="file" data-target="clipboard">
# $HOME/.config/snakemake/nasp/cluster.yaml
---
__default__:
  account: "my_account"
  time: "00:15:00"
  n: 1
  partition: "core"
frankenfasta:
  time: "00:20:00"
iqtree:
  time: "01:00:00"
  n: 64
...
</pre>

https://slurm.schedmd.com/rosetta.pdf

[Cluster Configuration](https://snakemake.readthedocs.io/en/stable/snakefiles/configuration.html#cluster-configuration)



[Profiles](https://snakemake.readthedocs.io/en/stable/executable.html#profiles)

With the `snakemake --profile [name | filepath]` flag 
Here, a folder myprofile is searched in per-user and global configuration directories (on Linux, this will be `$HOME/.config/snakemake` and `/etc/xdg/snakemake`, you can find the answer for your system via snakemake --help). Alternatively, an absolute or relative path to the folder can be given. The profile folder is expected to contain a file config.yaml that defines default values for the Snakemake command line arguments. For example, the file

`mkdir -pv $HOME/.config/snakemake/nasp`{{execute}}

`cat <<EOF>$HOME/.config/snakemake/nasp/config.yaml
cluster: "sbatch -A {cluster.account} -p {cluster.partition} -n {cluster.n} -t {cluster.time}"
jobs: 100
use-conda: True
`{{execute}}

The profile folder can additionally contain auxilliary files, e.g., jobscripts, or any kind of wrappers. See https://github.com/snakemake-profiles/doc for examples.

<pre class="file" data-target="clipboard">
# $HOME/.config/snakemake/nasp/config.yaml
---
cluster: 'sbatch -A {cluster.account} -p {cluster.partition} -n {cluster.n}  -t {cluster.time}'
cores: 1
jobs: 999
# Status command for cluster execution. This is only considered in combination with the –cluster flag.
# If provided, Snakemake will use the status command to determine if a job has finished successfully or failed.
# For this it is necessary that the submit command provided to –cluster returns the cluster job id.
# Then, the status command will be invoked with the job id. Snakemake expects it to return ‘success’
# if the job was successfull, ‘failed’ if the job failed and ‘running’ if the job still runs.
#cluster-status: '???'

#wrapper-prefix: https://bitbucket.org/snakemake/snakemake-wrappers/raw/

#default-resources: 'mem_mb=max(2*input.size, 1000)' 'disk_mb=max(2*input.size, 1000)'

# Set or overwrite values in the workflow config object. The workflow config object is accessible as variable config inside the workflow. Default values can be set by providing a JSON file (see Documentation).
#config: reference=reference.fasta
# Specify or overwrite the config file of the workflow (see the docs). Values specified in JSON or YAML format are available in the global config dictionary inside the workflow.
#configfile: config.yaml
# A JSON or YAML file that defines the wildcards used in ‘cluster’for specific rules,
# instead of having them specified in the Snakefile. For example, for rule ‘job’ you
# may define: { ‘job’ : { ‘time’ : ‘24:00:00’ } } to specify the time for rule ‘job’.
# You can specify more than one file. The configuration files are merged with later
# values overriding earlier ones.
cluster-config: cluster.yaml

# Specify working directory (relative paths in the snakefile will use this as their origin).
#directory: ./

#shadow-prefix: ./.snakemake

# This option is ignored when not in cluster mode.
#local-cores: 4

#report: report.html

# https://snakemake.readthedocs.io/en/stable/executable.html#CONDA
use-conda: True
#conda-prefix: .snakemake

#kubernetes: default
#kubernetes-env: []
#container-image: quay.io/snakemake/snakemake
...
</pre>

`snakemake --profile nasp`{{execute}}
