# AZURE ENTERPRISE INFRASTRUCTURE LAB

## Task 05 — Windows VM Security Hardening & Cost Control
### Current State + Hardening Plan

## 1. Objective

Review the deployed Windows VM from a security, networking, remote-access, and cost-control perspective and document the hardening actions to be completed.

> **Status:** This document records the current verified state and the planned hardening work. The changes listed in the pending checklist have **not** yet been claimed as completed.

## 2. Current Environment

| Property | Current value |
|---|---|
| Subscription | `My Test Azure subscription 1` |
| Resource Group | `rg-azure-enterprise_MM` |
| VM | `vm-web-MM` |
| Region | Central India (Zone 2) |
| Operating System | Windows Server 2025 Datacenter |
| VM Size | `Standard B2ts_v2` |
| VNet | `vnet-azure-enterprise-MM` |
| Subnet | `WebSubnet_MM` |
| Private IP | `10.0.1.4` |
| Public IP | `20.244.97.131` |

## 3. Evidence Confirmed

### VM Network Settings

The current Network settings show:

- NIC: `vm-web-mm993`
- VNet/Subnet: `vnet-azure-enterprise-MM / WebSubnet_MM`
- Public IP: `20.244.97.131`
- Private IP: `10.0.1.4`
- Accelerated networking: Enabled
- Subnet NSG: `nsg-web-MM`
- VM/NIC-level NSG: `vm-web-MM-nsg`

### VM Status

The VM Overview confirms that `vm-web-MM` is in **Running** state.

### RDP

A Native RDP session was successfully established to the Windows VM. This confirms that the current remote-access path is working.

### Activity Log

The VM Activity Log shows:

- `Create or Update Virtual Machine` — Succeeded
- `Health Event Resolved`
- `Health Event Updated`

## 4. Security Review

The current configuration exposes TCP 3389 for RDP. For a production-style configuration, RDP should be restricted to a trusted administrator source rather than broadly exposed.

The project also shows both:

- `nsg-web-MM` at the subnet level
- `vm-web-MM-nsg` at the NIC/VM level

This layered configuration should be intentionally documented or simplified so that security policy is not duplicated unnecessarily.

## 5. Planned Hardening Actions

### 5.1 Restrict RDP

Change the RDP rule from a broad source to the administrator's current public IP using `/32`.

Recommended rule name:

`Allow-RDP-Admin-IP`

Recommended port:

`3389/TCP`

Recommended source:

`<ADMIN_PUBLIC_IP>/32`

Do not publish the real administrator IP in the public GitHub repository.

### 5.2 Clean HTTPS rule naming

The existing 443 rule was previously created with the name:

`Allow-HTTP1`

Rename it to:

`Allow-HTTPS`

Keep:

- Priority: `110`
- Protocol: TCP
- Port: `443`
- Action: Allow

### 5.3 Review NSG layering

Review whether both `nsg-web-MM` and `vm-web-MM-nsg` are intentionally required.

Document the final decision:

- Subnet-level NSG for web-tier controls
- NIC-level NSG only when a separate host-specific policy is required

### 5.4 Cost Control

The Windows VM should not remain powered on when the learning environment is idle.

Configure an appropriate VM auto-shutdown schedule or use deliberate stop/deallocate procedures after lab work.

## 6. Why These Changes Matter

| Area | Why it matters |
|---|---|
| RDP restriction | Reduces unnecessary exposure of Windows administration |
| HTTPS naming | Makes security policy readable and auditable |
| NSG review | Prevents unclear or redundant security controls |
| Auto-shutdown | Reduces unnecessary compute consumption |
| Activity Log | Provides an audit trail for resource operations |

## 7. Interview Questions

### Q1. Why should RDP not normally be open to Any?

Because RDP is an administrative service. Broad internet exposure increases the attack surface. Access should be restricted to trusted sources or managed through a secure administrative service.

### Q2. Can a subnet and NIC both have NSGs?

Yes. Azure supports NSGs at both levels. When multiple layers apply, effective traffic rules must be considered together.

### Q3. Why use a `/32` source for RDP?

A `/32` represents one IPv4 address, allowing the administrative rule to be limited to one known public source.

### Q4. What is the difference between Stop and Deallocate for an Azure VM?

For cost management, deallocation is important because compute resources are released. Simply stopping from inside the guest OS is not equivalent to Azure VM deallocation for billing purposes.

### Q5. How did you troubleshoot RDP?

I verified the VM state, reviewed Network settings and NSG rules, confirmed the public IP and port 3389 path, and validated access using Native RDP.

## 8. Current Evidence Screenshots

### Current VM Network Settings evidence

![Current VM Network Settings evidence](./screenshots/01-vm-network-settings-current.png)

### VM Overview showing Running status

![VM Overview showing Running status](./screenshots/02-vm-overview-running.png)

### Successful Native RDP connection

![Successful Native RDP connection](./screenshots/03-rdp-success.png)

### VM Activity Log evidence

![VM Activity Log evidence](./screenshots/04-vm-activity-log.png)

## 9. Completion Checklist

- [x] VM Network Settings captured
- [x] VM Running state captured
- [x] Successful RDP session captured
- [x] Activity Log reviewed
- [ ] Restrict RDP to trusted administrator IP
- [ ] Rename 443 rule to `Allow-HTTPS`
- [ ] Review subnet/NIC NSG layering
- [ ] Configure VM auto-shutdown
- [ ] Re-test RDP after hardening
- [ ] Capture post-hardening screenshots
- [ ] Update GitHub README
- [ ] Commit and push changes
- [ ] Sanitize public-IP/account details before public upload

## 10. Result

The VM's current operational state has been verified. The next phase is security hardening and cost control, followed by post-change validation.

## 11. Next Step

Complete the RDP source restriction first. Then review the VM-level NSG before making any deletion or structural change.
