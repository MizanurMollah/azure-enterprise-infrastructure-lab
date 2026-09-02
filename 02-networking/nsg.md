# Task 03 — Azure Network Security Group (NSG)

## Project
**Enterprise Azure Infrastructure, Security & Monitoring Lab**

## Objective
Create an Azure Network Security Group for the web tier as the security-control component of the VNet design.

## Configuration

| Setting | Value |
|---|---|
| Subscription | `My Test Azure subscription 1` |
| Resource Group | `rg-azure-enterprise_MM` |
| Region | Central India |
| NSG Name | `nsg-web-MM` |
| Resource Type | Network Security Group |

## Deployment Evidence

The attached Azure Portal screenshot confirms:

- Deployment succeeded.
- Resource created: `nsg-web-MM`
- Resource type: Network security group
- Resource group: `rg-azure-enterprise_MM`
- Provisioning state: `Succeeded`
- Status: `OK`
- Operation: `Create`

## Security Design

The NSG will protect the web subnet.

Planned inbound rules:

| Priority | Rule | Protocol | Port | Action |
|---:|---|---|---:|---|
| 100 | `Allow-HTTP` | TCP | 80 | Allow |
| 110 | `Allow-HTTPS` | TCP | 443 | Allow |

The Azure default inbound rules remain in place, including the final deny behavior. Administrative ports such as SSH (22) and RDP (3389) should not be exposed broadly to the internet.

## Important Concept

An NSG filters network traffic using security rules based on source, destination, protocol, port, priority, and action. Lower priority numbers are evaluated before higher priority numbers.

An NSG can be associated with a subnet and/or network interface. In this project, the web NSG will be associated with `WebSubnet_MM`.

## What I Learned

- An NSG is a network traffic filtering control in Azure.
- Inbound rules control traffic entering a protected resource/subnet.
- Outbound rules control traffic leaving it.
- Rule priority determines evaluation order.
- A lower numeric priority is evaluated first.
- Security should follow least-privilege principles.
- Web traffic normally uses TCP ports 80 and 443.
- Management ports should be restricted rather than exposed to Any source.

## Interview Questions

### Q1. What is an NSG?
An Azure Network Security Group is a collection of security rules used to allow or deny network traffic to Azure resources.

### Q2. What is the difference between inbound and outbound rules?
Inbound rules control traffic entering the protected resource or subnet. Outbound rules control traffic leaving it.

### Q3. Why is priority important?
Azure evaluates matching NSG rules according to priority. A lower number has higher precedence.

### Q4. What happens when no custom rule allows traffic?
The applicable default NSG rules are evaluated. Azure's default inbound rules include a deny-all rule after the built-in allows.

### Q5. Can an NSG be associated with a subnet?
Yes. An NSG can be associated with a subnet and can also be associated with a network interface.

### Q6. Should SSH or RDP be open to Any?
Normally no. Administrative access should be restricted to trusted source IPs or controlled management mechanisms.

## Result

**NSG resource creation completed successfully.**

The next step is to configure the inbound rules and associate `nsg-web-MM` with `WebSubnet_MM`.

## Next Task Step

1. Open `nsg-web-MM`.
2. Go to **Inbound security rules**.
3. Add `Allow-HTTP` on TCP/80 with priority 100.
4. Add `Allow-HTTPS` on TCP/443 with priority 110.
5. Associate the NSG with `WebSubnet_MM`.
6. Capture screenshots of the rules and subnet association for the portfolio.
