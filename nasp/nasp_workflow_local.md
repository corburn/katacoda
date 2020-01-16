The `testdata` target creates a testdata/ directory with random data for a demo analysis. The `iqtree` target will run the workflow steps to produce a maximum likelihood tree.

`snakemake --use-conda -- testdata`{{execute}}

`snakemake --use-conda -j -d ./testdata -- iqtree`{{execute}}

`cat ./testdata/bestsnp.iqtree`{{execute}}

# Command Line Configuration

To keep it simple, the previous commands took advantage of default paths in Snakemake and the NASP Workflow. The following is an example of how you can override the defaults:

`snakemake --use-conda -s $HOME/workflow/Snakefile --config reference=$HOME/testdata/reference.fasta assemblies=$HOME/testdata/assemblies minimum_coverage=0 outdir=./testdata2 -- iqtree`{{execute}}

Later steps will show advanced use cases such as submitting to a cluster. This will include examples of configuration files that may reduce the typical workflow to something like:

`snakemake --profile nasp`{{execute}}

# TODO

The NASP Workflow defaults are defined by the [JSON schema](https://json-schema.org/) `cat $HOME/workflow/schemas/config.schema.yaml`{{execute}}. The `config` target will print the current configuration.

`snakemake --quiet config`{{execute}}

`snakemake --use-conda --list-target-rules`{{execute}} prints all the target rules defined in the Snakefile(s). It is can be useful as a reminder of what the Snakefile can do.

---

https://snakemake.readthedocs.io/en/stable/executing/cli.html


