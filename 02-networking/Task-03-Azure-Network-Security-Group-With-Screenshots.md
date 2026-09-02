# Task 03 — Azure Network Security Group (NSG)

**Project:** Enterprise Azure Infrastructure, Security & Monitoring Lab

## Objective
Create and configure an Azure Network Security Group for the web tier, add controlled HTTP/HTTPS inbound access, and associate the NSG with the web subnet.

## Environment

| Setting | Value |
|---|---|
| Subscription | `My Test Azure subscription 1` |
| Resource Group | `rg-azure-enterprise_MM` |
| Region | Central India |
| NSG | `nsg-web-MM` |
| VNet | `vnet-azure-enterprise-MM` |
| Web Subnet | `WebSubnet_MM` (`10.0.1.0/24`) |

## Configuration Completed

1. Created `nsg-web-MM`.
2. Added inbound HTTP rule: priority `100`, TCP port `80`, Allow.
3. Added inbound HTTPS rule: priority `110`, TCP port `443`, Allow. The rule is functionally correct; its current name appears as `Allow-HTTP1` and should be renamed to `Allow-HTTPS` when the resource lock is temporarily handled.
4. Associated `nsg-web-MM` with `WebSubnet_MM`.
5. Verified the subnet association in the NSG.

## Security Rules

| Direction | Priority | Name | Protocol | Port | Action |
|---|---:|---|---|---:|---|
| Inbound | 100 | `Allow-HTTP` | TCP | 80 | Allow |
| Inbound | 110 | `Allow-HTTP1` *(rename to Allow-HTTPS)* | TCP | 443 | Allow |
| Inbound | 65000 | `AllowVNetInBound` | Any | Any | Allow |
| Inbound | 65001 | `AllowAzureLoadBalancerInBound` | Any | Any | Allow |
| Inbound | 65500 | `DenyAllInBound` | Any | Any | Deny |

## Resource Lock Observation
An accidental outbound HTTP rule was created during the exercise. Its deletion was blocked because the resource group has a `CanNotDelete` lock (`PortfolioResourceLock`). This demonstrates how Azure Resource Locks prevent protected resources from being deleted. The lock should be temporarily removed only when cleanup is required, then re-enabled.

## Final Architecture
```text
Internet
   |
   | TCP 80 / 443
   v
nsg-web-MM
   |
   v
WebSubnet_MM (10.0.1.0/24)
   |
   v
vnet-azure-enterprise-MM
```

## Interview Points

- **What is an NSG?** A Network Security Group is a collection of rules that allow or deny network traffic to Azure subnets and/or network interfaces.
- **Why priority?** Lower numeric priority is evaluated before higher numeric priority.
- **Why TCP 80?** HTTP web traffic normally uses TCP port 80.
- **Why TCP 443?** HTTPS web traffic normally uses TCP port 443.
- **Why associate the NSG with the subnet?** Creating the NSG alone does not apply its rules to the subnet; association makes the NSG part of the subnet's traffic-control configuration.
- **Should SSH/RDP be open to Any?** Normally no; management access should be restricted to trusted sources or controlled management services.

## Evidence Screenshots

### 01 — Create NSG: Basics

![01 — Create NSG: Basics](./03324c62-6829-432d-b080-8cf5b2ae47cf.png)

### 02 — NSG deployment succeeded

![02 — NSG deployment succeeded](./a16bd26f-d0e7-4c8c-b760-5e7bbe38ac6a.png)

### 03 — Add inbound security rule

![03 — Add inbound security rule](./910ee68a-5b9e-4abc-ba0e-c4223b68243d.png)

### 04 — NSG rules after configuration

![04 — NSG rules after configuration](./39bc2fb2-622e-496f-98af-2f0f90fcc248.png)

### 05 — Outbound rule deletion blocked by CanNotDelete lock

![05 — Outbound rule deletion blocked by CanNotDelete lock](./b70c6569-fbfb-45d0-96fa-35eaff4d2db2.png)

### 06 — Associate subnet dialog

![06 — Associate subnet dialog](./f3395630-ae2c-4071-8fad-295332420d5e.png)

### 07 — Final NSG-to-WebSubnet association

![07 — Final NSG-to-WebSubnet association](./8a32ee94-10c7-4152-af7e-251dbcf4fb4c.png)

## Result
**Task 03 completed:** NSG created, web traffic rules configured, and `nsg-web-MM` associated with `WebSubnet_MM`.

## Next Step
Build the web compute layer using an Azure VM and connect it to `WebSubnet_MM`, while keeping costs controlled within the Azure free credit.