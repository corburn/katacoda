`curl -LO https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
bash Miniconda3-latest-Linux-x86_64.sh -b -u
~/miniconda3/bin/conda init
source ~/.bashrc
`{{execute}}

Ignore the prompt to re-open your current shell, `source ~/.bashrc`{{execute}} achieves a similar result.

optional: `conda update -y -n base -c defaults conda`{{execute}}

---

You can find conda documentation and installers for Windows/OS X at https://docs.conda.io/en/latest/miniconda.html

If you'd like to see a "how to use conda" scenario, there is an open issue at https://github.com/corburn/katacoda/issues/1 where you can help us make one.
