# AZURE ENTERPRISE INFRASTRUCTURE LAB

## Task 04 — Windows Virtual Machine
### Final Azure Portal Evidence

## 1. Objective
Deploy and validate a Windows Server virtual machine as the web/compute workload for the Azure Enterprise Infrastructure Lab. The task demonstrates Azure compute, networking, security controls, remote administration, monitoring evidence, troubleshooting, and cost-aware resource selection.

## 2. Final VM Configuration

| Property | Confirmed value |
|---|---|
| Subscription | `My Test Azure subscription 1` |
| Resource Group | `rg-azure-enterprise_MM` |
| Virtual Machine | `vm-web-MM` |
| Region | Central India |
| Availability Zone | Zone 2 |
| Status | Running |
| Operating System | Windows Server 2025 Datacenter |
| Architecture | x64 |
| VM Size | `Standard B2ts_v2` |
| vCPUs | 2 |
| RAM | 1 GiB |
| VNet | `vnet-azure-enterprise-MM` |
| Subnet | `WebSubnet_MM` |
| Subnet range | `10.0.1.0/24` |
| Private IP | `10.0.1.4` |
| Public IP | `20.244.97.131` |
| Primary NIC | `vm-web-mm993` |
| VM-level NSG shown in final Network settings | `vm-web-MM-nsg` |
| Subnet-level NSG | `nsg-web-MM` |
| Tag | `Application Owner = MM` |

> **Public GitHub safety:** the original screenshots contain live public IP/account information. Sanitize or blur sensitive/current infrastructure identifiers before publishing screenshots in a public repository.

## 3. Azure Skills Demonstrated

- Azure Virtual Machine deployment
- Windows Server administration
- VM sizing and cost awareness
- Availability Zone selection
- Azure VNet and subnet integration
- Private/public IP identification
- Network Security Group usage
- RDP remote administration
- VM disk configuration
- Boot diagnostics
- Activity Log investigation
- Deployment verification
- Troubleshooting and configuration correction
- Resource lifecycle and cleanup awareness

## 4. VM Size Selection and Cost Control

The creation flow showed several availability and sizing constraints. An NC-series GPU VM was rejected as unnecessary for this learning lab because its displayed price was much higher. A D-series option was also constrained by availability zone. A B-series option was then selected.

Final deployed size: `Standard B2ts_v2`.

The Azure Portal showed an estimated **0.0204 USD/hour** during the VM creation flow. The VM should be stopped/deallocated when not in use, and unnecessary public-IP/compute resources should be removed after the lab.

## 5. Disk Configuration

- OS disk size: Image default
- OS disk type: Premium SSD / Premium_LRS
- Managed disks: Yes
- Delete OS disk with VM: Yes
- Ephemeral OS disk: None
- Data disks: None
- Key management: Platform-managed key
- Ultra Disk compatibility: Off
- Encryption at host: Not enabled

## 6. Networking Configuration

### Final network path

```text
Internet
   |
   | RDP / HTTP / HTTPS
   v
Public IP 20.244.97.131
   |
   v
NIC vm-web-mm993
   |
   +--> VM-level NSG vm-web-MM-nsg
   |
   v
WebSubnet_MM 10.0.1.0/24
   |
   +--> Subnet NSG nsg-web-MM
   |
   v
VNet vnet-azure-enterprise-MM
```

The final Network settings screenshot confirms the NIC, VNet/subnet, public IP, private IP, accelerated networking, and both NSG layers.

### Security observation

The final environment shows both a subnet-level NSG and a NIC-level NSG. This can provide layered control, but the project should document why both are required. If one layer is redundant, review it during the hardening/cleanup phase.

## 7. NSG Rules Observed

| Priority | Rule / Name shown | Port | Protocol | Action |
|---:|---|---:|---|---|
| 100 | `Allow-HTTP` | 80 | TCP | Allow |
| 110 | `Allow-HTTP1` | 443 | TCP | Allow |
| 120 | `NEWACC` | 3389 | TCP | Allow |

Azure default inbound rules are also present, including the final deny-all behavior.

For clean portfolio documentation, rename the HTTPS rule to `Allow-HTTPS` and give the RDP rule a descriptive name. RDP should be restricted to a trusted source IP rather than broadly exposed.

## 8. RDP Validation

A successful Native RDP session was established to `vm-web-MM`. This demonstrates public-IP connectivity, TCP 3389 access, and successful Windows remote administration.

RDP should not remain broadly exposed to the internet in a production-style environment. Restrict the source IP or use a controlled management service.

## 9. Activity Log and Troubleshooting Evidence

The VM Activity Log shows:

- `Create or Update Virtual Machine` — Succeeded
- `Health Event Resolved`
- `Health Event Updated`

This demonstrates Azure resource-operation review and basic health-event investigation.

## 10. Management Configuration

- System-assigned managed identity: Off
- Microsoft Entra ID login: Off
- Backup: Off
- Site Recovery: Off
- Periodic assessment: Off
- Hotpatch: Off
- Patch orchestration: Automatic by OS
- Auto-shutdown: Off at creation

For this learning environment, configure auto-shutdown after validating the lab workflow to reduce unnecessary VM runtime.

## 11. Monitoring Configuration

- Boot diagnostics: On
- Recommended alert rules: Off
- OS guest diagnostics: Off
- Application health monitoring: Off

Dedicated Azure Monitor and Log Analytics configuration will be completed in the monitoring task.

## 12. Implementation Summary

1. Started Windows VM creation in Central India.
2. Evaluated VM sizes and rejected oversized/GPU options for cost control.
3. Selected `Standard B2ts_v2`.
4. Selected Windows Server 2025 Datacenter.
5. Used `vnet-azure-enterprise-MM`.
6. Used `WebSubnet_MM (10.0.1.0/24)`.
7. Configured a public IP for lab RDP access.
8. Preserved subnet-level `nsg-web-MM`.
9. Completed VM deployment successfully.
10. Verified Running state.
11. Verified public/private IP configuration.
12. Verified NSGs in Network settings.
13. Established successful RDP connectivity.
14. Reviewed Activity Log for deployment and health events.

## 13. GitHub Evidence Structure

```text
04-virtual-machine/
├── Task-04-Azure-Windows-VM-Final-Documentation.md
└── screenshots/
    ├── 01-vm-windows-basics.png
    ├── 02-vm-size-availability-zone.png
    ├── 03-vm-bseries-options.png
    ├── 04-vm-inbound-ports.png
    ├── 05-vm-disks.png
    ├── 06-vm-networking-generated-vnet.png
    ├── 07-vm-networking-correct-vnet.png
    ├── 08-vm-networking-subnet-nsg.png
    ├── 09-vm-management.png
    ├── 10-vm-monitoring.png
    ├── 11-vm-advanced.png
    ├── 12-vm-deployment-in-progress.png
    ├── 13-vm-overview-final.png
    ├── 14-vm-network-settings-final.png
    ├── 15-vm-overview-running.png
    ├── 16-vm-rdp-success.png
    └── 17-vm-activity-log.png
```

## 14. Git Commit

```bash
cd /d C:\azure-enterprise-infrastructure-lab
git add .
git commit -m "Complete Azure Windows VM deployment and validation"
git push
```

## 15. Completion Checklist

- [x] Windows Server VM created
- [x] Central India selected
- [x] Zone 2 deployment completed
- [x] Low-cost B-series size selected
- [x] Project VNet selected
- [x] Web subnet selected
- [x] Public IP created
- [x] VM deployment succeeded
- [x] VM running state verified
- [x] Network settings verified
- [x] NSG evidence captured
- [x] RDP connectivity verified
- [x] Activity Log reviewed
- [x] Complete screenshot evidence collected
- [x] Documentation prepared
- [ ] Rename 443 rule to `Allow-HTTPS`
- [ ] Rename/restrict RDP rule
- [ ] Review whether both subnet and NIC NSGs are required
- [ ] Configure auto-shutdown
- [ ] Create Git commit
- [ ] Push to GitHub
- [ ] Sanitize public screenshots before public upload

## 16. Evidence Screenshots

### Windows VM creation basics checkpoint.

![Windows VM creation basics checkpoint.](./screenshots/01-vm-windows-basics.png)

### VM size selection showing availability-zone constraints.

![VM size selection showing availability-zone constraints.](./screenshots/02-vm-size-availability-zone.png)

### B-series VM size options available in the subscription.

![B-series VM size options available in the subscription.](./screenshots/03-vm-bseries-options.png)

### Inbound-port selection during VM creation.

![Inbound-port selection during VM creation.](./screenshots/04-vm-inbound-ports.png)

### VM disk configuration.

![VM disk configuration.](./screenshots/05-vm-disks.png)

### Initial networking checkpoint showing a generated VNet/subnet before correction.

![Initial networking checkpoint showing a generated VNet/subnet before correction.](./screenshots/06-vm-networking-generated-vnet.png)

### Networking checkpoint after selecting the project VNet and Web subnet.

![Networking checkpoint after selecting the project VNet and Web subnet.](./screenshots/07-vm-networking-correct-vnet.png)

### Networking checkpoint showing the existing subnet NSG association.

![Networking checkpoint showing the existing subnet NSG association.](./screenshots/08-vm-networking-subnet-nsg.png)

### VM management configuration.

![VM management configuration.](./screenshots/09-vm-management.png)

### VM monitoring configuration.

![VM monitoring configuration.](./screenshots/10-vm-monitoring.png)

### VM advanced configuration.

![VM advanced configuration.](./screenshots/11-vm-advanced.png)

### Deployment checkpoint showing VM, NIC, NSG and Public IP resources.

![Deployment checkpoint showing VM, NIC, NSG and Public IP resources.](./screenshots/12-vm-deployment-in-progress.png)

### Final VM Overview after successful deployment.

![Final VM Overview after successful deployment.](./screenshots/13-vm-overview-final.png)

### Final VM Network settings, including IPs, subnet and security groups.

![Final VM Network settings, including IPs, subnet and security groups.](./screenshots/14-vm-network-settings-final.png)

### Final VM Overview showing the VM running.

![Final VM Overview showing the VM running.](./screenshots/15-vm-overview-running.png)

### Successful Native RDP connection to the Windows VM.

![Successful Native RDP connection to the Windows VM.](./screenshots/16-vm-rdp-success.png)

### VM Activity Log showing successful create/update and health events.

![VM Activity Log showing successful create/update and health events.](./screenshots/17-vm-activity-log.png)

## 17. Next Azure Task

**Task 05 — Windows VM hardening, IIS, RDP source restriction and cost control.**