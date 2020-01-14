`--list-target-rules` shows available target rules in a given Snakefile. It is can be useful as a reminder of what the Snakefile can do.

`snakemake --list-target-rules`{{execute}}

To run a demo analysis we'll use the `testdata` target to create a testdata/ directory with randomly generated data.

`snakemake --use-conda -- testdata`{{execute}}

`snakemake -j -d ./testdata --use-conda -- iqtree`{{execute}}

One of the NASP outputs is `bestsnp.tsv` which contains the high-confidence SNPs.
Build a phylogenetic tree from the bestsnp.tsv using `iqtree`:
One of the IQTree outputs is `bestsnp.fasta.iqtree` which contains a text rendering of the phylogenetic tree.

`cat bestsnp.tsv.fasta.iqtree`{{execute}}

---

# TODO:

- Add a command that will render a graphical form of the phylogenetic tree
- Future steps will show advanced use cases such as submitting to a cluster. This will include configuration files that may reduce the typical run command to something like `snakemake --profile nasp`.
