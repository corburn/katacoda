The following commands install `snakemake` and download the NASP workflow.

`conda create -y -n snakemake snakemake-minimal
conda activate snakemake
`{{execute}}

`git clone --depth 1 --branch workflow https://github.com/TGenNorth/NASP workflow`{{execute}}

(Pre-Release Only) When this revision is released, nasp will be pulled from bioconda as if it was just another dependency.

`git clone --depth 1 --branch dev https://github.com/TGenNorth/NASP.git $HOME/NASP
pushd $HOME/NASP/nasp && go install && popd
nasp --help
`{{execute}}

# Run the NASP Snakemake Workflow.

To run a demo analysis we'll use the `testdata` target to create a testdata/ directory with randomly generated data.

`snakemake --use-conda -- testdata`{{execute}}

`snakemake --list-target-rules`{{execute}}

`snakemake -j -d ./testdata --use-conda -- iqtree`{{execute}}

One of the NASP outputs is `bestsnp.tsv` which contains the high-confidence SNPs.
Build a phylogenetic tree from the bestsnp.tsv using `iqtree`:
One of the IQTree outputs is `bestsnp.fasta.iqtree` which contains a text rendering of the phylogenetic tree.

`cat bestsnp.tsv.fasta.iqtree`{{execute}}

---

# TODO:

- Add a command that will render a graphical form of the phylogenetic tree
- Future steps will show advanced use cases such as submitting to a cluster. This will include configuration files that may reduce the typical run command to something like `snakemake --profile nasp`.
- The iqtree step will likely be integrated into the workflow.

optional: `$(snakemake --bash-completion)`{{execute}}


