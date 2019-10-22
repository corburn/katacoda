Download the NASP Snakemake Workflow

`git clone --depth 1 --branch workflow https://github.com/TGenNorth/NASP workflow`{{execute}}

Install Snakemake; the `conda-build` portion will not be required when this revision is released.

`conda install -n base -y conda-build
conda activate base
conda build workflow
conda create -y -n snakemake -c conda-forge -c bioconda snakemake-minimal
conda activate snakemake
`{{execute}}

`snakemake --list-target-rules`{{execute}}

Run the NASP Snakemake Workflow.

`snakemake -j --use-conda -- iqtree`{{execute}}

One of the NASP outputs is `bestsnp.tsv` which contains the high-confidence SNPs.
Build a phylogenetic tree from the bestsnp.tsv using `iqtree`:
One of the IQTree outputs is `bestsnp.fasta.iqtree` which contains a text rendering of the phylogenetic tree.

`cat bestsnp.fasta.iqtree`{{execute}}

---

# TODO:

- Add a command that will render a graphical form of the phylogenetic tree
- Future steps will show advanced use cases such as submitting to a cluster. This will include configuration files that may reduce the typical run command to something like `snakemake --profile nasp`.
- The iqtree step will likely be integrated into the workflow.

<pre class="file" data-target="clipboard">
git clone --depth 1 --branch dev https://github.com/TGenNorth/NASP.git $HOME/NASP
pushd $HOME/NASP/nasp && go install && popd
nasp --help
</pre>


