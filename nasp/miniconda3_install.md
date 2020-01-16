`curl -LO https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
bash Miniconda3-latest-Linux-x86_64.sh -b -u
~/miniconda3/bin/conda init
source $HOME/.bashrc
conda config \
  --prepend channels defaults \
  --prepend channels bioconda \
  --prepend channels conda-forge
`{{execute}}

Ignore the prompt to re-open your current shell, `source ~/.bashrc` achieves a similar result. The 'defaults' channel warning is also harmless.

---

Conda is recommended as an easy way to install dependencies. Additional information about conda can be found here:

https://docs.conda.io/en/latest/
https://bioconda.github.io/user/install.html

The `curl` command downloads Miniconda3-latest-Linux-x86_64.sh. `bash` runs Miniconda3-latest-Linux-x86_64.sh with the non-interactive batch (-b) option to accept the license agreement and install under the default `$HOME/miniconda3/` directory. `conda init` appends a section to your shell configuration file (e.g. $HOME/.bashrc) so you can use the conda command. `source ~/.bashrc` applies the changes to the current shell. `conda config` adds the bioconda and conda-forge community channels to `$HOME/.condarc` so you can run commands like `conda install samtools` without specifying the channels on the command line.

optional: `conda update -y -n base -c defaults conda`{{execute}}
