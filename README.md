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

## Trigger Status

```bash
TOKEN="<token com acesso full repo>"
curl -X POST \
    -H "Authorization: Bearer $TOKEN" \
    -H "Accept: application/vnd.github.v3+json" \
    https://api.github.com/repos/joaopfsouza/linuxtips-github-actions/statuses/<sha commit> \
    -d '{
        "state": "error",
        "context": "external-tests",
        "description": "Simulação de erro via API",
        "target_url": "https://google.com"
    }'
```

```bash
TOKEN="<token com acesso full repo>"
curl -X POST \
    -H "Authorization: Bearer $TOKEN" \
    -H "Accept: application/vnd.github.v3+json" \
    https://api.github.com/repos/joaopfsouza/linuxtips-github-actions/statuses/<sha commit> \
    -d '{
        "state": "success",
        "context": "external-tests",
        "description": "Todos os testes passaram",
        "target_url": "https://google.com"
    }'
```

## Composite


```yaml

name: "Minha Ação Composta"
description: "Exemplo de ação composta"
author: "seu-usuario"

inputs:
  versao:
    description: "Versão da ferramenta"
    required: false
    default: "latest"

runs:
  using: composite
  steps:
    - name: Instala a ferramenta
      shell: bash
      run: |
        echo "Instalando versão ${{ inputs.versao }}"
        # comandos de instalação aqui
```


## Logs & Upload

```yaml

name: Tentativa de visualizar erro

on:
  workflow_dispatch:

jobs:
  teste-erro:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4

      - name: Setup Node
        uses: actions/setup-node@v4
        with:
          node-version: '20'

      - name: Instalação de dependências
        run: npm install

      - name: Pega erro
        run: |
          node index.js >> app.log 2>&1
          tail -15 app.log

      - name: Salva a saída
        uses: actions/upload-artifact@v4
        if: failure()
        with:
          name: full-app-logs
          path: app.log
```

## Referências

- [runner-images](https://github.com/actions/runner-images)
- [GitHub-hosted runners reference](https://docs.github.com/en/actions/reference/runners/github-hosted-runners)
- [Actions - Upload Artifact](https://github.com/actions/upload-artifact)
- [Download a Build Artifact](https://github.com/marketplace/actions/download-a-build-artifact)
- [Workflow syntax for GitHub Actions](https://docs.github.com/en/actions/reference/workflows-and-actions/workflow-syntax#example-of-onworkflow_dispatchinputs)
- [Trigger workflows](https://docs.github.com/en/actions/reference/workflows-and-actions/events-that-trigger-workflowsde)
- [Crontab Guru](https://crontab.guru)
- [Fortalecimento de segurança para o GitHub Actions](https://docs.github.com/pt/enterprise-server@3.13/actions/how-tos/security-for-github-actions/security-guides/security-hardening-for-github-actions)
- [Example contents of the github context](https://docs.github.com/en/actions/reference/workflows-and-actions/contexts#example-contents-of-the-github-context)
- [Comandos de fluxo de trabalho para o GitHub Actions](https://docs.github.com/pt/actions/reference/workflows-and-actions/workflow-commands)
- [Introduction to GitHub Packages](https://docs.github.com/en/packages/learn-github-packages/introduction-to-github-packages)
- [Composite](https://docs.github.com/pt/actions/tutorials/create-actions/create-a-composite-action)