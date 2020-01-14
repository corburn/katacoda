The following will install `snakemake` and download the NASP workflow into the current directory. Additional dependencies will be automatically installed as-needed using conda.

`conda create -y -n snakemake snakemake-minimal
conda activate snakemake
$(snakemake --bash-completion)
`{{execute}}

`git clone --depth 1 --branch workflow https://github.com/TGenNorth/NASP workflow`{{execute}}

(Pre-Release Only) When this revision is released, nasp will be pulled from bioconda as if it was just another dependency.

`git clone --depth 1 --branch dev https://github.com/TGenNorth/NASP.git $HOME/NASP
pushd $HOME/NASP/nasp && go install && popd
nasp --help
`{{execute}}
