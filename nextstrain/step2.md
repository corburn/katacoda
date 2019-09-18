Download the [TB Tutorial](https://nextstrain.org/docs/tutorials/tb) dataset
`git clone https://github.com/nextstrain/tb.git && cd tb`{{execute}}

`snakemake --cores $(nproc)`{{execute}} will run the analysis.

``{{open}}

Start the auspice server to view the result
`HOST=0.0.0.0 PORT=4000 node ~/auspice/auspice.js view --datasetDir ./auspice/`{{execute}}

View the result
https://[[HOST_SUBDOMAIN]]-4000-[[KATACODA_HOST]].environments.katacoda.com

Stop the server
`echo "Send Ctrl+C before running Terminal"`{{execute interrupt}}

