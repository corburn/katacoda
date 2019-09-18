`curl -LO https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
bash Miniconda3-latest-Linux-x86_64.sh -b
~/miniconda3/bin/conda init
source ~/.bashrc
`{{execute}}

Ignore the prompt to re-open your current shell, `source ~/.bashrc`{{execute}} achieves a similar result.

optional: `conda update -q -y -n base -c defaults conda`{{execute}}
