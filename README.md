# linuxtips-github-actions

Git Flow - Rulesets

## Api Deployment Curl

```bash
TOKEN="<classic token full access in REPO>"
curl -X POST \
    -H "Authorization: Bearer $TOKEN" \
    -H "Accept: application/vnd.github.v3+json" \
    https://api.github.com/repos/joaopfsouza/linuxtips-github-actions/deployments \
    -d '{
        "ref": "main",
        "required_contexts": [],
        "environment": "production",
        "descrption": "Deployment triggered by cURL request"
    }'
```

## Triger Discussion

Necessário habilitar a feature de discussion. En Settings -> Features, habilitar discussions.

## Referências

- [runner-images](https://github.com/actions/runner-images)
- [GitHub-hosted runners reference](https://docs.github.com/en/actions/reference/runners/github-hosted-runners)
- [Actions - Upload Artifact](https://github.com/actions/upload-artifact)
- [Download a Build Artifact](https://github.com/marketplace/actions/download-a-build-artifact)
- [Workflow syntax for GitHub Actions](https://docs.github.com/en/actions/reference/workflows-and-actions/workflow-syntax#example-of-onworkflow_dispatchinputs)
- [Trigger workflows](https://docs.github.com/en/actions/reference/workflows-and-actions/events-that-trigger-workflowsde)
- [Crontab Guru](https://crontab.guru)