# Architecture

Simple topology:

Internet --> Security Group (SSH) --> EC2 Instance

Mermaid:
```mermaid
graph LR
  Internet --> SG[Security Group (SSH)]
  SG --> EC2[EC2 Instance]
