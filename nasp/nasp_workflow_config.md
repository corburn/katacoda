The NASP Workflow defaults are defined by the [JSON schema](https://json-schema.org/) `cat $HOME/workflow/schemas/config.schema.yaml`{{execute}}. The `config` target will print the current configuration.

`snakemake --quiet config`{{execute}}

`snakemake --list-target-rules`{{execute}} prints all the target rules defined in the Snakefile(s). It is can be useful as a reminder of what the Snakefile can do.

---

Error: profile given but no config.yaml found. Profile has to be given as either absolute path, relative path or name of a directory available in either /etc/xdg/snakemake or /root/.config/snakemake.
