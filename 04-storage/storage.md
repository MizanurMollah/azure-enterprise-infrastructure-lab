# AZURE ENTERPRISE INFRASTRUCTURE LAB

## Task 04 — Azure Storage Account
### Final Azure Portal Evidence

## 1. Objective
Create an Azure Storage Account for the lab, configure baseline security and data protection, and capture Azure Portal evidence for the GitHub portfolio.

> **Evidence status:** The supplied final screenshot shows the storage-account deployment in progress with the storage resource operation in an accepted state. A post-deployment Storage Account Overview screenshot should be added after the resource is fully provisioned.

## 2. Storage Account Configuration

| Property | Selected value |
|---|---|
| Subscription | `My Test Azure subscription 1` |
| Resource Group | `rg-azure-enterprise_MM` |
| Storage Account Name | `stazureenterprisemm001` |
| Region | Central India |
| Primary Service | Azure Blob Storage / Azure Data Lake Storage |
| Performance | Standard |
| Redundancy | LRS |
| Access Tier | Hot |
| Minimum TLS | 1.2 |
| Secure transfer required | Enabled |
| Anonymous container access | Disabled |
| Encryption | Microsoft-managed keys |

## 3. Advanced Configuration
- Hierarchical namespace: Disabled
- SFTP: Disabled
- NFS v3: Disabled
- Cross-tenant replication: Disabled
- Access tier: Hot
- Managed identity for SMB: Disabled
- Encryption in transit for SMB: Enabled

## 4. Networking Configuration
- Public network access: Enabled
- Public network access scope: All networks
- Private endpoint: None
- Routing preference: Microsoft network routing

A private endpoint configuration dialog was opened during the workflow but was not intended for the initial deployment. Private Endpoint will be treated as a separate advanced networking exercise.

## 5. Data Protection
- Point-in-time restore for containers: Disabled
- Blob soft delete: Enabled — 7 days
- Container soft delete: Enabled — 7 days
- Blob versioning: Disabled
- Blob change feed: Disabled
- Version-level immutability support: Disabled
- Azure Files soft delete: Enabled

## 6. Security
- Secure transfer required: Enabled
- Anonymous container access: Disabled
- Storage account key access: Enabled
- Default Microsoft Entra authorization in portal: Disabled
- Minimum TLS: 1.2
- Microsoft Defender for Storage: Disabled for this learning account

## 7. Encryption
- Encryption type: Microsoft-managed keys (MMK)
- Customer-managed key support: Blobs and files only
- Infrastructure encryption: Disabled

## 8. Deployment Evidence
The final Azure Portal screenshot records the storage-account deployment for `stazureenterprisemm001` under `rg-azure-enterprise_MM`. The deployment page shows the Storage account resource with the operation status accepted while the deployment is being processed.

## 9. Storage Architecture

```text
Azure Subscription
       |
       v
rg-azure-enterprise_MM
       |
       v
stazureenterprisemm001
       |
       +--> Blob Storage
       |      |
       |      +--> project-files (planned, Private)
       |
       +--> Data Protection
       |      +--> Blob soft delete: 7 days
       |      +--> Container soft delete: 7 days
       |
       +--> Security
              +--> Secure transfer
              +--> TLS 1.2
              +--> No anonymous containers
```

## 10. Planned Blob Exercise
After the storage account is fully deployed:
1. Create container `project-files`
2. Set access level to **Private**
3. Upload `azure-storage-test.txt`
4. Verify access through the Azure Portal
5. Capture container and blob screenshots

## 11. Interview Skills Demonstrated
- Azure Storage Account deployment
- Blob Storage fundamentals
- Standard performance
- LRS redundancy
- Hot access tier
- Storage networking
- Secure transfer and TLS
- Soft delete
- Storage encryption
- Microsoft-managed keys
- Anonymous-access controls
- Private Endpoint concept
- Azure Portal deployment verification
- Cost-aware cloud design

## 12. Interview Questions

### Q1. What is an Azure Storage Account?
The Azure resource boundary that provides services such as Blob Storage, Azure Files, queues and tables.

### Q2. What is Blob Storage?
Azure object storage for unstructured data such as files, images, documents and backups.

### Q3. What is LRS?
Locally redundant storage designed for redundancy within the local Azure storage scope and commonly used for low-cost development and learning workloads.

### Q4. Why use the Hot tier?
For data expected to be accessed frequently.

### Q5. Why enable soft delete?
To provide a recovery window for accidentally deleted blobs or containers.

### Q6. Why disable anonymous container access?
To prevent containers from being exposed for anonymous public reading.

### Q7. Why require TLS 1.2?
To require a modern secure transport protocol for supported storage requests.

### Q8. Microsoft-managed vs customer-managed keys?
Microsoft-managed keys are managed by Microsoft. Customer-managed keys provide customer control over key lifecycle and are commonly integrated with Azure Key Vault.

### Q9. Public network access vs Private Endpoint?
Public network access uses the public endpoint/network path; a Private Endpoint provides private connectivity from an Azure virtual network.

## 13. Implementation Summary
1. Selected the Azure subscription.
2. Reused `rg-azure-enterprise_MM`.
3. Configured `stazureenterprisemm001`.
4. Selected Central India.
5. Selected Blob Storage as the primary service.
6. Selected Standard performance and LRS redundancy.
7. Selected Hot access tier.
8. Enabled Blob and container soft delete for seven days.
9. Disabled anonymous container access.
10. Required secure transfer and TLS 1.2.
11. Selected Microsoft-managed encryption keys.
12. Kept networking simple and did not add a private endpoint.
13. Started the storage-account deployment.
14. Captured the deployment evidence screenshot.

## 14. GitHub Evidence Structure

```text
04-storage/
├── storage.md
└── screenshots/
    ├── 01-storage-basics.png
    ├── 02-storage-advanced.png
    ├── 03-storage-networking.png
    ├── 04-storage-private-endpoint-dialog.png
    ├── 05-storage-data-protection.png
    ├── 06-storage-security.png
    ├── 07-storage-encryption.png
    └── 08-storage-deployment.png
```

## 15. Git Commit

```bash
cd /d C:\azure-enterprise-infrastructure-lab
git add .
git commit -m "Complete Azure storage account task"
git push
```

## 16. Completion Checklist
- [x] Storage Account configuration completed
- [x] Standard performance selected
- [x] LRS redundancy selected
- [x] Hot access tier selected
- [x] Secure transfer enabled
- [x] TLS 1.2 selected
- [x] Anonymous container access disabled
- [x] Blob soft delete enabled
- [x] Container soft delete enabled
- [x] Microsoft-managed encryption selected
- [x] Deployment initiated
- [x] Screenshots collected
- [ ] Confirm deployment completed
- [ ] Capture Storage Account Overview
- [ ] Create private `project-files` container
- [ ] Upload test blob
- [ ] Verify blob access
- [ ] Capture container/blob screenshots
- [ ] Update final documentation with post-deployment evidence
- [ ] Commit and push to GitHub

## 17. Evidence Screenshots

### Storage Account — Basics

![Storage Account — Basics](./screenshots/01-storage-basics.png)

### Storage Account — Advanced

![Storage Account — Advanced](./screenshots/02-storage-advanced.png)

### Storage Account — Networking

![Storage Account — Networking](./screenshots/03-storage-networking.png)

### Private endpoint dialog opened during workflow

![Private endpoint dialog opened during workflow](./screenshots/04-storage-private-endpoint-dialog.png)

### Storage Account — Data protection

![Storage Account — Data protection](./screenshots/05-storage-data-protection.png)

### Storage Account — Security

![Storage Account — Security](./screenshots/06-storage-security.png)

### Storage Account — Encryption

![Storage Account — Encryption](./screenshots/07-storage-encryption.png)

### Storage Account — Deployment evidence

![Storage Account — Deployment evidence](./screenshots/08-storage-deployment.png)

## 18. Next Azure Task

**Task 04A — Blob Container, Upload, Access Control and Lifecycle**
