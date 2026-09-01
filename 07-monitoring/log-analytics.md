# 07 — Log Analytics

## Objective
Create/use a Log Analytics workspace and understand centralized logs.

## Tasks
- Create a workspace for the lab.
- Connect supported resources where appropriate.
- Run a basic KQL query.
- Save one useful query in this document.

## Example KQL
```kusto
AzureActivity
| take 20
```

## Evidence
- [ ] Workspace
- [ ] Logs query
- [ ] Query result

## Interview questions
- Metrics vs logs?
- What is KQL?
- Why centralize logs?
