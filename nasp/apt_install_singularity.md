- [ ] TODO: what is singularity



Snakemake 
https://snakemake.readthedocs.io/en/stable/snakefiles/deployment.html#distribution-and-reproducibility

`apt-get update \
&& apt-get install -y build-essential \
  libssl-dev uuid-dev libseccomp-dev \
  pkg-config squashfs-tools cryptsetup
`{{execute}}

Download and extract the latest singularity release.

`GIT_TAG=$(curl --silent "https://api.github.com/repos/sylabs/singularity/releases/latest" \
| grep '"tag_name":' \
| sed -E 's/.*"([^"]+)".*/\1/')
curl -L https://github.com/sylabs/singularity/releases/download/${GIT_TAG}/singularity-${GIT_TAG#v}.tar.gz | tar xz
`{{execute}}

Compile and install singularity.

`pushd $HOME/singularity \
&& ./mconfig \
&& pushd ./builddir \
&& make \
&& make install \
&& popd && popd
`{{execute}}

`singularity version`{{execute}}

https://sylabs.io/guides/3.0/admin-guide/admin_quickstart.html


