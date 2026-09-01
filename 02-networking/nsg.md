# 02 — Network Security Group

## Objective
Control inbound and outbound traffic using NSG rules.

## Tasks
- Create an NSG for the application subnet.
- Allow only required traffic.
- Do not open management ports to `0.0.0.0/0` in a production design.
- Associate the NSG with the intended subnet.

## Evidence
- [ ] NSG overview
- [ ] Inbound rules
- [ ] Subnet association

## Notes
For a lab, document any temporary management access and remove it afterward.

## Interview questions
- NSG vs Azure Firewall?
- What is the difference between inbound and outbound rules?
- What does a higher NSG priority mean?
