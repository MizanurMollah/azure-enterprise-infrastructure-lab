# 05 — AZURE SQL / SQL SERVER ON AZURE VM

## Portfolio Documentation

### Project Scope

This portfolio entry documents two related Microsoft SQL deployment patterns used in the Azure Enterprise Lab:

1. **Azure SQL Database (PaaS)** — managed database service using `sqldb-enterprise-MM` and logical server `sqlserver-enterprise-mm-2026`.
2. **SQL Server on Azure VM (IaaS)** — planned installation of Microsoft SQL Server directly inside the existing Windows VM `vm-web-MM`.

> **Important status note:** The Azure SQL Database/server deployment and VM/RDP connectivity are evidenced by screenshots. The actual **SQL Server installation inside `vm-web-MM` is not yet evidenced by an installer/service/SSMS screenshot in this conversation.** Therefore, the SQL Server-on-VM installation section below is a step-by-step implementation plan, not a claim that installation has already been completed.

## 1. Architecture

```text
Azure Subscription
        |
        v
rg-azure-enterprise_MM
        |
        +-------------------------------+
        |                               |
        v                               v
  vm-web-MM                       Azure SQL Database
  Windows Server 2025             sqldb-enterprise-MM
        |                               |
        | (planned IaaS SQL)             |
        v                               v
  SQL Server 2022                    Logical Server
  Developer Edition                 sqlserver-enterprise-mm-2026
  (planned)                               |
        |                                 |
        +------ application/data ---------+
```

## 2. Existing Azure VM

| Property | Value |
|---|---|
| VM | `vm-web-MM` |
| OS | Windows Server 2025 Datacenter |
| VM Size | `Standard B2ts_v2` |
| Region | Central India |
| Availability Zone | 2 |
| VNet | `vnet-azure-enterprise-MM` |
| Subnet | `WebSubnet_MM` |
| Private IP | `10.0.1.4` |
| Public IP | `20.244.97.131` |
| NIC | `vm-web-mm993` |

The VM is already deployed and has been successfully accessed through RDP.

## 3. Existing Azure SQL Database

| Property | Value |
|---|---|
| Database | `sqldb-enterprise-MM` |
| Logical server | `sqlserver-enterprise-mm-2026` |
| Server FQDN | `sqlserver-enterprise-mm-2026.database.windows.net` |
| Region | Central India |
| SQL connection port | TCP 1433 |
| Free offer | Applied during creation flow |

The resource group screenshot shows both the SQL database and logical server deployed successfully.

## 4. Why Install SQL Server Inside the VM?

Azure SQL Database and SQL Server on an Azure VM are different deployment models.

### Azure SQL Database

- Microsoft-managed PaaS
- Less infrastructure administration
- Built-in service management
- You primarily manage database-level configuration and data

### SQL Server on Azure VM

- IaaS approach
- Windows Server is under your administration
- SQL Server installation and configuration are under your control
- You manage SQL services, instance settings, patching, backups, and OS/SQL security

This distinction is a strong interview topic because it demonstrates knowledge of **PaaS vs IaaS**.

## 5. SQL Server on VM — Planned Implementation

### 5.1 RDP into the VM

RDP to:

`vm-web-MM`

A successful RDP session has already been captured.

### 5.2 Download SQL Server

Inside the Windows VM, download the official **SQL Server Developer Edition** installer from Microsoft.

For a learning environment, use Developer Edition only for development/testing, not production.

### 5.3 Installation Center

Choose:

**Installation → New SQL Server stand-alone installation**

Run the setup rule checks.

### 5.4 Edition

Select:

**Developer**

### 5.5 Feature Selection

Select:

`Database Engine Services`

Leave unrelated optional features unselected for the initial lab.

### 5.6 Instance Configuration

Use:

**Default instance**

Expected instance name:

`MSSQLSERVER`

### 5.7 Service Configuration

Use the installer defaults for the first learning deployment unless a later exercise requires dedicated service accounts.

### 5.8 Database Engine Configuration

Select:

**Mixed Mode (SQL Server authentication and Windows authentication)**

Then:

- Set a strong SQL administrator password.
- Add the current Windows administrator as a SQL Server administrator.

**Never store the SQL password in GitHub or screenshots.**

### 5.9 Install

Click **Install** and wait for:

`Installation completed successfully`

## 6. Verify SQL Server Service

Inside the VM, open PowerShell:

```powershell
Get-Service MSSQLSERVER
```

Expected state:

```text
Status    Name
------    ----
Running   MSSQLSERVER
```

## 7. Install SQL Server Management Studio

Install the current **SQL Server Management Studio (SSMS)** separately.

Then connect:

```text
Server type: Database Engine
Server name: localhost
Authentication: Windows Authentication
```

Successful SSMS connection will prove that the SQL Server Database Engine is operational inside the Azure VM.

## 8. Create a Local VM SQL Database

In SSMS:

```sql
CREATE DATABASE EnterpriseLabDB;
GO

USE EnterpriseLabDB;
GO

CREATE TABLE Customers
(
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(100),
    City VARCHAR(100)
);
GO

INSERT INTO Customers (CustomerID, CustomerName, City)
VALUES
(1, 'Customer One', 'Kolkata'),
(2, 'Customer Two', 'Delhi'),
(3, 'Customer Three', 'Mumbai');
GO

SELECT *
FROM Customers;
GO
```

This provides actual T-SQL evidence rather than only a software-installation screenshot.

## 9. VM-to-Azure SQL Connectivity

The existing Windows VM can also connect to the separately deployed Azure SQL Database.

The VM's outbound public IP was verified from PowerShell as:

`20.244.97.131`

For a basic connectivity test, the Azure SQL logical server firewall can allow that specific IP.

Test from the VM:

```powershell
Test-NetConnection sqlserver-enterprise-mm-2026.database.windows.net -Port 1433
```

Expected result:

```text
TcpTestSucceeded : True
```

This proves TCP reachability to the Azure SQL endpoint.

## 10. Azure SQL Firewall Design

Preferred learning configuration:

```text
Rule name: Allow-VM-Web-MM
Start IP:  20.244.97.131
End IP:    20.244.97.131
```

Do not use a broad `0.0.0.0/0`-style rule for the portfolio lab.

## 11. Cost Control

The Azure SQL creation workflow initially displayed an expensive Hyperscale configuration.

The Free offer was then applied and the portal showed:

- Compute: `$0.00`
- Storage: `$0.00`
- Overage billing: Disabled

This is an important cost-management lesson: always inspect the selected compute tier and pricing before deploying.

The same cost-awareness principle was applied when selecting the B-series Azure VM.

## 12. Security Considerations

### SQL Server on VM

- Keep Windows patched.
- Keep SQL Server patched.
- Restrict inbound SQL port `1433`.
- Avoid exposing SQL Server directly to the internet unless explicitly required.
- Prefer private network connectivity for production-style deployments.
- Use least-privilege SQL logins and Windows/Entra authentication where appropriate.
- Never publish credentials.

### Azure SQL Database

- Use narrowly scoped firewall rules.
- Avoid broad public access.
- Prefer Private Endpoint/private connectivity for production designs.
- Use appropriate authentication and RBAC.

## 13. Interview Questions

### Q1. Azure SQL Database vs SQL Server on Azure VM?

Azure SQL Database is PaaS; Microsoft manages most underlying infrastructure. SQL Server on an Azure VM is IaaS; you manage the operating system and SQL Server.

### Q2. Why install SQL Server on the VM?

It provides experience with full SQL Server administration, instance configuration, service management, and OS/SQL integration.

### Q3. What is the default SQL Server instance?

`MSSQLSERVER`.

### Q4. What port does SQL Server commonly use?

TCP `1433` for the default Database Engine instance.

### Q5. Why use Mixed Mode?

It supports both Windows authentication and SQL Server authentication for learning and compatibility scenarios.

### Q6. Why not expose port 1433 to Any?

It unnecessarily increases the attack surface. Restrict it to trusted sources or use private networking.

### Q7. Why use Developer Edition for learning?

It is intended for development/testing and provides a full-featured SQL Server environment without being intended for production workloads.

## 14. Evidence Collected

The attached screenshots currently prove:

- Azure SQL databases page
- SQL logical server creation
- SQL authentication configuration
- SQL deployment progress
- SQL operation details
- SQL resources in the resource group
- Azure SQL Query Editor
- Free offer/cost configuration
- VM RDP access
- VM outbound public IP
- VM Overview
- VM Network Settings

The screenshots **do not yet prove** that SQL Server has been installed inside the VM. Those screenshots should be captured after the installation steps above.

## 15. Required SQL Server-on-VM Screenshots

```text
05-azure-sql/
├── azure-sql-database/
│   └── screenshots/
└── sql-server-on-vm/
    └── screenshots/
        ├── 01-sql-server-installer.png
        ├── 02-feature-selection.png
        ├── 03-instance-configuration.png
        ├── 04-mixed-mode-authentication.png
        ├── 05-installation-success.png
        ├── 06-sql-service-running.png
        ├── 07-ssms-connected.png
        ├── 08-database-created.png
        └── 09-t-sql-query-result.png
```

## 16. GitHub Commit

```bash
cd /d C:\azure-enterprise-infrastructure-lab
git add 05-azure-sql
git commit -m "Document Azure SQL and SQL Server on VM lab"
git push
```

## 17. Completion Checklist

- [x] Azure SQL Database deployed
- [x] SQL logical server deployed
- [x] Free SQL offer applied during creation flow
- [x] Cost checked before deployment
- [x] VM deployed and running
- [x] RDP to VM verified
- [x] VM outbound IP verified
- [x] Azure SQL Query Editor accessed
- [x] Resource group evidence captured
