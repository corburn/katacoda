`curl http://data.nextstrain.org/nextstrain.yml --compressed -o nextstrain.yml`{{execute}}

`conda env create -f nextstrain.yml`{{execute}}

`conda install -q -y -n nextstrain -c conda-forge -c bioconda vcftools`{{execute}}

`conda activate nextstrain`{{execute}}

`git clone --branch v1.39.0 --depth 1 https://github.com/nextstrain/auspice.git && pushd auspice && npm install && npm run build && popd`{{execute}}

optional: `$(snakemake --bash-completion)`{{execute}}

https://nextstrain.org/docs/getting-started/local-installation
