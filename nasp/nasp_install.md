The following will install Snakemake and download the NASP Workflow in the current directory.

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

In this scenario we will take advantage of Snakemake's `--use-conda` flag to automatically install dependencies as-needed. This will result in a delay as dependencies are installed the first time a Snakefile rule is used, but subsequent runs will reuse previously installed tools. A typical conda install should not take more than a few minutes.

