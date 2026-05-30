# CIS Benchmarks — Center for Internet Security

**Jurisdiction:** Global  
**Applies to:** Any organisation operating IT systems — servers, cloud infrastructure, databases, network devices, browsers  
**Administered by:** CIS (Center for Internet Security)  
**Tags:** #compliance #cis #benchmarks #hardening #configuration #security

---

## What It Is

CIS Benchmarks are community-developed, consensus-based configuration guidelines for securely configuring IT systems. They provide specific, step-by-step instructions for hardening operating systems, cloud platforms, databases, web servers, and applications.

There are **100+ CIS Benchmarks** covering virtually every mainstream platform. They are free to download and widely used as the technical foundation for SOC 2 and ISO 27001 controls.

---

## Implementation Levels

Each recommendation in a CIS Benchmark is assigned a level:

| Level | Description | Example |
|:------|:------------|:--------|
| **Level 1** | Practical, broad security. Minimal performance impact. Should be applied to all systems. | Disable unnecessary services, enable firewall |
| **Level 2** | Defence in depth. May affect functionality. For high-security environments. | Kernel module restrictions, advanced audit policies |

---

## Key Benchmarks for Web Platforms

### Linux (Ubuntu/Debian/CentOS)
```
□ Filesystem partitioning — separate /tmp, /var, /home
□ Disable unused filesystems (cramfs, freevxfs, jffs2, hfs)
□ Disable core dumps
□ Enable ASLR (Address Space Layout Randomization)
□ SSH hardening:
    - PermitRootLogin no
    - PasswordAuthentication no (key-based only)
    - MaxAuthTries 4
    - Idle timeout: 300 seconds
□ Disable unused network protocols (DCCP, SCTP)
□ Firewall rules — deny all inbound except required ports
□ Audit daemon enabled — log all privileged commands
□ Password policy — minimum 14 chars, complexity requirements
□ Sudo configured correctly — no NOPASSWD in production
```

### AWS (Amazon Web Services)
```
□ Root account MFA enabled
□ No access keys for root account
□ IAM password policy — 14+ chars, MFA required for console users
□ CloudTrail enabled in all regions
□ S3 buckets — no public access by default (Block Public Access)
□ S3 bucket logging enabled
□ VPC flow logs enabled
□ Security groups — no 0.0.0.0/0 inbound on sensitive ports
□ RDS encryption at rest — enabled
□ RDS not publicly accessible
□ KMS key rotation — enabled for all customer-managed keys
□ GuardDuty enabled
□ Config rules enabled
□ CloudWatch alarms for root login, console login without MFA, security group changes
```

### Docker
```
□ Docker daemon not exposed over TCP without TLS
□ Non-root user in containers
□ Read-only filesystem where possible
□ No --privileged flag
□ Use official/verified base images
□ No secrets in Dockerfile ENV or build args — use secrets management
□ Container resource limits (CPU/memory)
□ Network policies — containers only communicate with what they need
```

### Kubernetes
```
□ API server — no anonymous auth
□ RBAC enabled (default in modern versions)
□ Audit logging enabled on API server
□ etcd encrypted at rest
□ Network policies — deny all by default, whitelist required
□ Pod Security Admission — restrict privileged pods
□ Secrets stored in external secrets manager (not plain k8s secrets)
□ Image scanning in CI/CD pipeline
□ No containers running as root
```

### PostgreSQL / MySQL
```
□ Database not accessible from the public internet
□ Dedicated database user per application — minimal privileges
□ No superuser accounts used by applications
□ Encrypt data at rest — TDE or filesystem encryption
□ Encrypt data in transit — SSL/TLS required
□ Audit logging — log all DDL changes, privileged operations
□ Disable unused features and extensions
□ Regular backups — encrypted, tested
```

---

## CIS Controls (v8)

Separate from Benchmarks, CIS Controls are 18 high-level security practices:

| # | Control | Priority |
|:--|:--------|:---------|
| 1 | Inventory and control of enterprise assets | IG1 |
| 2 | Inventory and control of software assets | IG1 |
| 3 | Data protection | IG1 |
| 4 | Secure configuration of enterprise assets and software | IG1 |
| 5 | Account management | IG1 |
| 6 | Access control management | IG1 |
| 7 | Continuous vulnerability management | IG1 |
| 8 | Audit log management | IG1 |
| 9 | Email and web browser protections | IG1 |
| 10 | Malware defences | IG1 |
| 11 | Data recovery | IG2 |
| 12 | Network infrastructure management | IG2 |
| 13 | Network monitoring and defence | IG2 |
| 14 | Security awareness and skills training | IG2 |
| 15 | Service provider management | IG2 |
| 16 | Application software security | IG2 |
| 17 | Incident response management | IG3 |
| 18 | Penetration testing | IG3 |

IG1 = Implementation Group 1 — minimum security for all organisations.

---

## Related

- [SOC 2](./01-soc2.md) — CIS Benchmarks are commonly used to satisfy SOC 2 controls
- [ISO 27001](./02-iso-27001.md)
- [NIST CSF](./04-nist-csf.md)
- [OWASP ASVS](./03-owasp-asvs.md) — application-level security requirements
