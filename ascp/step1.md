`curl -LO https://download.asperasoft.com/download/sw/cli/3.9.2/ibm-aspera-cli-3.9.2.1426.c59787a-linux-64-release.sh
bash ibm-aspera-cli-3.9.2.1426.c59787a-linux-64-release.sh
echo 'export PATH=$HOME/.aspera/cli/bin:$PATH' >> $HOME/.bash_profile
echo 'export MANPATH=$HOME/.aspera/cli/share/man:$MANPATH' >> $HOME/.bash_profile
source $HOME/.bash_profile
`{{execute}}

```
Installing IBM Aspera CLI

Installation into $HOME/.aspera/cli successful

Optional installation steps:

  To include aspera in your PATH, run this command (or add it to .bash_profile):
    export PATH=$HOME/.aspera/cli/bin:$PATH

  To install the man page, run the following command:
    export MANPATH=$HOME/.aspera/cli/share/man:$MANPATH
```


```
# download assemblies by species tax_id
# awk
# - NR skips the header rows
# - $7 == 1773 filters rows by species tax_id matching TB (1773)
# - $20 prints the ftp directory column
# sed strips the URI prefix and appends the assembly filename assuming the filename prefix matches the directory name
```

`TAX_ID=1773`{{execute}}

`curl -sf https://ftp.ncbi.nlm.nih.gov/genomes/ASSEMBLY_REPORTS/assembly_summary_genbank.txt \
  | awk -v TAX_ID=${TAX_ID:-1773} -F $'\t' 'NR > 2 && $7 == TAX_ID { print $20 }' \
  | sed -E 's|^ftp://ftp.ncbi.nlm.nih.gov(/.*/(.*))|\1/\2_genomic.fna.gz|' > aspera_file_list`{{execute}}

`$HOME/.aspera/cli/bin/ascp \
  -i $HOME/.aspera/cli/etc/asperaweb_id_dsa.openssh \
  --mode recv \
  --host ftp.ncbi.nlm.nih.gov \
  --user anonftp \
  -k1 -Tr -l100m \
  --file-list aspera_file_list \
  --partial-file-suffix .aspx.part ./`{{execute}}


- [ ] TODO: add this function to the ~/.bashrc and use it to download a file from the NCBI FTP server.
  This is a commandline equivalent/alternative to using the Aspera browser extension.

<pre class="file" data-target="clipboard">
ncbi() {
  path=${1#*ftp.ncbi.nlm.nih.gov}
  [[ -n "${path} " ]] || exit 1
  $HOME/.aspera/cli/bin/ascp -k1 -Tr -l200m \
      -i $HOME/.aspera/cli/etc/asperaweb_id_dsa.openssh \
      anonftp@ftp.ncbi.nlm.nih.gov:${path} .
} 
</pre>


`ncbi ftp://ftp.ncbi.nlm.nih.gov/genomes/ASSEMBLY_REPORTS/assembly_summary_genbank.txt`{{execute}}


`sed -E 's|(.RR)([0-9][0-9][0-9])(.*)|/sra/sra-instant/reads/ByRun/sra/\1/\1\2/\1\2\3/\1\2\3.sra|' sra_result.csv > aspera_file_list
~/.aspera/cli/bin/ascp \
    -i ~/.aspera/cli/etc/asperaweb_id_dsa.openssh \
    --mode recv \
    --host ftp.ncbi.nlm.nih.gov \
    --user anonftp \
    -k1 -Tr -l100m \
    --file-list aspera_file_list \
    .`{{execute}}
# followup with sratoolit prefetch for anything missing
