`conda create -q -y -n snakemake -c conda-forge -c bioconda snakemake`{{execute}}

`conda activate snakemake`{{execute}}

---

optional: `$(snakemake --bash-completion)`{{execute}}


https://snakemake.readthedocs.io/en/stable/getting_started/installation.html


# [Reproducible Archive](https://snakemake.readthedocs.io/en/stable/snakefiles/deployment.html#sustainable-and-reproducible-archiving)

TODO: how will we organize workflows?

Snakemake recommends storing each workflow in a dedicated git repository with the following structure:

<pre>
├── .gitignore
├── README.md
├── LICENSE.md
├── config.yaml
├── scripts
│   ├── script1.py
│   └── script2.R
├── envs
│   └── myenv.yaml
└── Snakefile
</pre>

`snakemake --archive my-workflow.tar.gz`{{execute}}

If above layout is followed, this will archive any code and config files that is under git version control. Further, all input files will be included into the archive. Finally, the software packages of each defined conda environment are included. This results in a self-contained workflow archive that can be re-executed on a vanilla machine that only has Conda and Snakemake installed via

`
tar -xf my-workflow.tar.gz
snakemake -n
`{{execute}}

Note that the archive is platform specific. For example, if created on Linux, it will run on any Linux newer than the minimum version that has been supported by the used Conda packages at the time of archiving (e.g. CentOS 6).

A useful pattern when publishing data analyses is to create such an archive, upload it to Zenodo and thereby obtain a DOI. Then, the DOI can be cited in manuscripts, and readers are able to download and reproduce the data analysis at any time in the future.
