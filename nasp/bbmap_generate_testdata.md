We need data to run an analysis. The following will generate a random `reference.fasta` along with a collection of fastq reads and fasta assemblies based on it.

`conda create -y -n bbmap bbmap
conda activate bbmap
`{{execute}}

`randomgenome.sh len=1000 out=reference.fasta
mkdir -pv assemblies
for sample_name in a b c d e f g; do
  mutate.sh \
    id=0.9 \
    in=reference.fasta \
    out=assemblies/${sample_name}.fasta
done
mkdir -pv reads
for sample_name in a b c d e f g; do
  randomreads.sh \
    paired=t \
    snprate=0.5 \
    ref=reference.fasta \
    out1=reads/${sample_name}_1.fq \
    out2=reads/${sample_name}_2.fq \
    len=100 \
    coverage=15
done
`{{execute}}


# Terminal Tips

You can use commands like `pwd`{{execute}} to print the current working directory, `cd /root`{{execute}} to change directories, `ls`{{execute}} to list directory contents, and `cat /root/.bashrc`{{execute}} to print file contents.

---

TODO: the following are links that may be useful for future scenario content.

[Generate an unmapped BAM from FASTQ or aligned BAM](https://gatkforums.broadinstitute.org/gatk/discussion/6484/how-to-generate-an-unmapped-bam-from-fastq-or-aligned-bam)

[Illumina Naming Convention](https://support.illumina.com/help/BaseSpace_OLH_009008/Content/Source/Informatics/BS/NamingConvention_FASTQ-files-swBS.htm)

http://seqanswers.com/forums/archive/index.php/t-48988.html
http://seqanswers.com/forums/showthread.php?t=58221
