`curl -LO https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
bash Miniconda3-latest-Linux-x86_64.sh -b -u
~/miniconda3/bin/conda init
source $HOME/.bashrc
conda config \
  --prepend channels defaults \
  --prepend channels bioconda \
  --prepend channels conda-forge
`{{execute}}

Ignore the prompt to re-open your current shell, `source ~/.bashrc`{{execute}} achieves a similar result.

---

You can find conda documentation here:

https://docs.conda.io/en/latest/
https://bioconda.github.io/user/install.html

The `curl` command downloads Miniconda3-latest-Linux-x86_64.sh. `bash` runs Miniconda3-latest-Linux-x86_64.sh with the non-interactive batch (-b) option to accept the license agreement and install under the default `$HOME/miniconda3/` directory. `conda init` appends a section to your shell configuration file (e.g. $HOME/.bashrc) so you can use the conda command. `source ~/.bashrc` applies the changes. `conda config` edits `$HOME/.condarc`

bioconda is a community repository of 

<pre class="file" data-target="clipboard">
channels:
  - conda-forge
  - bioconda
  - defaults
</pre>

If you'd like to see a "how to use conda" scenario, there is an open issue at https://github.com/corburn/katacoda/issues/1 where you can help us make one.

optional: `conda update -y -n base -c defaults conda`{{execute}}
