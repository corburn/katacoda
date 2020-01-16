The `testdata` target creates a testdata/ directory for a demo analysis. The `iqtree` target will run the workflow steps to produce a maximum likelihood tree.

`snakemake --use-conda -- testdata`{{execute}}

`snakemake --use-conda -j -d ./testdata -- iqtree`{{execute}}

`cat ./testdata/bestsnp.iqtree`{{execute}}

Congrats, you just completed the steps necessary to install/run the NASP Workflow.

# Command Line Configuration

To keep it simple, the previous commands took advantage of default paths in Snakemake and the NASP Workflow. The following is an example of how you can override the defaults:

`snakemake \
  --use-conda \
  --config \
    reference=$HOME/testdata/reference.fasta \
    assemblies=$HOME/testdata/assemblies \
    minimum_coverage=0 \
    outdir=./testdata2 \
  --snakefile $HOME/workflow/Snakefile -- iqtree`{{execute}}

Later steps will show advanced use cases such as submitting to a cluster and configuration files that may reduce the typical workflow to something like:

`snakemake --profile nasp`

---

https://snakemake.readthedocs.io/en/stable/executing/cli.html#all-options
