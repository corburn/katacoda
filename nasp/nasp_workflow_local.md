We'll use the `testdata` target to create a testdata/ directory with randomly generated data to run a demo analysis. The `iqtree` target will take the raw testdata and output a maximum likelihood tree. The `--use-conda` flag tells Snakemake to use conda to install dependencies as-needed. This will result in a delay the first time you use a target. Subsequent runs will use previously installed tools. A typical conda install should not take more than a few minutes.

`snakemake --use-conda -- testdata`{{execute}}

`snakemake --use-conda -j -d ./testdata -- iqtree`{{execute}}

`cat ./testdata/bestsnp.iqtree`{{execute}}

To keep it simple, the above commands take advantage of default paths in Snakemake and the NASP Workflow. The following is an example of how you can override the defaults:

`snakemake --use-conda -s $HOME/workflow/Snakefile --config reference=$HOME/testdata/reference.fasta assemblies=$HOME/testdata/assemblies minimum_coverage=0 outdir=./testdata2 -- iqtree`{{execute}}

The NASP Workflow defaults are defined in the schema `cat $HOME/workflow/schemas/config.schema.yaml`{{execute}}. The `config` target will print the current configuration.

`snakemake config`{{execute}}

`snakemake --use-conda --list-target-rules`{{execute}} prints all the target rules defined in the Snakefile(s). It is can be useful as a reminder of what the Snakefile can do.

---

https://snakemake.readthedocs.io/en/stable/executing/cli.html

Future steps will show advanced use cases such as submitting to a cluster. This will include examples of configuration files that may reduce the typical workflow to something like `snakemake --profile nasp`.

