https://www.katacoda.com/docs

https://www.katacoda.com/docs/scenarios/index-json

```bash
# stepN-verify.sh
#
# Example verifies that the .git directory exists before the user can proceed. Used in https://katacoda.com/courses/git/1
#
# [ -d /home/scrapbook/tutorial/.git ] && echo "done"
#
# Example verifies that at least one Redis container has been created. Used in https://www.katacoda.com/courses/docker/deploying-first-container
#
# (( $(docker ps -a | grep redis 2>/dev/null | wc -l) >= 1 )) && echo \"done\"
```

https://katacoda.com/scenario-examples/

Render port 8500: https://[[HOST_SUBDOMAIN]]-8500-[[KATACODA_HOST]].environments.katacoda.com/

Render port 80: https://[[HOST_SUBDOMAIN]]-80-[[KATACODA_HOST]].environments.katacoda.com/

Display page allowing user to select port:
https://[[HOST_SUBDOMAIN]]-[[KATACODA_HOST]].environments.katacoda.com/

<kbd>Ctrl</kbd>+<kbd>C</kbd>

`echo "Run in Terminal"`{{execute}}
`echo "Send Ctrl+C before running Terminal"`{{execute interrupt}}
`echo "Run in Terminal Host 1"`{{execute HOST1}}
`echo "Run in Terminal Host 2"`{{execute HOST2}}
`echo "Run in Terminal 1"`{{execute T1}}
`echo "Open and Execute in Terminal 2"`{{execute T2}}

```json
"environment": {
  "showdashboard": true,
  "dashboards": [{"name": "Display 80", "port": 80}, {"name": "Display 8080", "port": 8080}],
}
```

Files in a assets directory within the scenario can have files uploaded to the client or host of the environment.

```json
"details": {
  "intro": {
    "code": "foreground.sh"
    "courseData": "background.sh",
  },
  "assets": {
    "client": [
      {
        "file": "docker-compose.yml",
        "target": "~/"
      }
    ],
    "host01": [
      {
        "file": "config.yml",
        "target": "~/"
      }
    ]
  }
}
```


