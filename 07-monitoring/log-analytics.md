# 07 - Azure Alerts
## Monitoring and Operational Alerting

### Objective
Create and document an operational alert for an Azure resource. The project note calls for an alert rule, condition, action group/notification, and alert history.

> **Current status:** The Azure Monitor alert configuration and action-group creation have been documented. The screenshots supplied so far do **not** yet prove that the final alert rule was saved successfully or that an alert fired and appears in alert history. Those are the remaining validation items.

## 1. Resource
- VM: `vm-web-MM`
- Monitoring service: Azure Monitor
- Alert type: Metric/recommended alert
- Primary condition: Percentage CPU > 80%
- Notification: Email
- Estimated monthly alert cost shown in the portal: $0.00

## 2. Implementation Flow
```text
vm-web-MM
   |
   v
Azure Monitor Alerts
   |
   +--> Condition: Percentage CPU > 80%
   |
   +--> Action: Email / Action Group
   |
   +--> Alert rule
   |
   +--> Alert history (pending validation)
```

## 3. Navigation Troubleshooting
The first screenshot opened a Microsoft Entra / Microsoft 365 group named `Monitoring Alerts`, which was not the VM's Azure Monitor alerting blade. The correct path is:

`Virtual machines -> vm-web-MM -> Monitoring -> Alerts`

This troubleshooting step is retained as portfolio evidence because it demonstrates correct navigation from an initial wrong location to the resource-level Azure Monitor alert experience.

## 4. Alert Configuration
The final intended configuration captured in the screenshots is:

| Setting | Value |
|---|---|
| Resource | `vm-web-MM` |
| Signal | `Percentage CPU` |
| Operator | Greater than |
| Threshold | 80% |
| Notification | Email |
| Other recommended rules | Disabled |
| Estimated monthly alert cost | $0.00 |

The intermediate screenshot briefly had both Percentage CPU and Data Disk IOPS enabled. The corrected screenshot shows only Percentage CPU enabled and Data Disk IOPS disabled.

## 5. Action Group
The recommended-alert flow created an action group successfully. The portal notification confirms:

`Action group created successfully`

The action group is intended to deliver the alert notification by email.

## 6. Alert Naming
Recommended final name:

`vm-web-MM-High-CPU`

Recommended description:

`Alerts when the average VM CPU exceeds 80%.`

## 7. Validation Plan
The remaining validation steps are:

1. Confirm the CPU alert rule is saved and visible under `vm-web-MM -> Monitoring -> Alerts`.
2. Confirm the rule is enabled.
3. Confirm the email/action group is attached.
4. Generate or wait for a CPU threshold breach during testing.
5. Capture the alert state and alert history.
6. Record the final fired/resolved status in this document.

## 8. Evidence Checklist
- [x] Correct VM Alerts page
- [x] CPU threshold condition configured
- [x] Email notification enabled
- [x] Action group creation success captured
- [ ] Alert rule saved successfully
- [ ] Alert fired during validation
- [ ] Alert history captured
- [ ] Final resolved/closed state captured

## 9. GitHub Structure
```text
07-monitoring/
├── README.md
└── screenshots/
    ├── 01-wrong-monitoring-alerts-page.png
    ├── 02-vm-alerts-page.png
    ├── 03-recommended-alerts-initial.png
    ├── 04-cpu-alert-config-corrected.png
    └── 05-action-group-created.png
```

## 10. Git Commit
```bash
cd /d C:\azure-enterprise-infrastructure-lab
git add 07-monitoring
git commit -m "Document Azure Monitor CPU alert"
git push
```

## 11. Interview Skills Demonstrated
- Azure Monitor and metric alerts
- VM operational monitoring
- CPU threshold alerting
- Notification routing
- Action groups
- Alert lifecycle and history
- Troubleshooting Azure Portal navigation
- Cost-aware monitoring

## 12. Interview Questions
### What is an Azure Monitor metric alert?
A rule that evaluates resource metrics against a threshold and can trigger an action when the condition is met.

### Why use CPU > 80%?
It is a simple, meaningful operational signal for demonstrating threshold-based alerting on a VM.

### What is an action group?
A reusable collection of notification/action settings used when an Azure Monitor alert is triggered.

### Why document alert history?
It proves the alert was not only configured but actually evaluated and triggered/resolved during validation.

## 13. Evidence Screenshots
### Figure 1 - Initial navigation - incorrect Monitoring Alerts group page (troubleshooting evidence)

![Initial navigation - incorrect Monitoring Alerts group page (troubleshooting evidence)](./screenshots/01-wrong-monitoring-alerts-page.png)

### Figure 2 - Correct Azure Monitor Alerts page for vm-web-MM

![Correct Azure Monitor Alerts page for vm-web-MM](./screenshots/02-vm-alerts-page.png)

### Figure 3 - Recommended alert setup - initial configuration

![Recommended alert setup - initial configuration](./screenshots/03-recommended-alerts-initial.png)

### Figure 4 - Corrected alert selection - CPU alert on, Data Disk IOPS off, email enabled

![Corrected alert selection - CPU alert on, Data Disk IOPS off, email enabled](./screenshots/04-cpu-alert-config-corrected.png)

### Figure 5 - Action group creation success notification

![Action group creation success notification](./screenshots/05-action-group-created.png)

