# Release Checklist: [Product Name]

> **Version**: [X.Y.Z]  
> **Release Date**: [YYYY-MM-DD]  
> **Release Manager**: [name]  
> **Status**: Planning | In Progress | Ready | Released

---

## Release Overview

| Field | Value |
|-------|-------|
| **Version** | [X.Y.Z] |
| **Type** | Major | Minor | Patch | Hotfix |
| **Target Date** | [YYYY-MM-DD] |
| **Rollback Plan** | [Link or brief description] |

### Release Summary
[Brief description of what's in this release - key features, fixes, improvements]

---

## Pre-Release Checklist

### Code Complete

- [ ] All features for this release are merged to main/develop
- [ ] All planned bug fixes are merged
- [ ] No open blockers for release
- [ ] Code freeze in effect (if applicable)

### Testing

- [ ] All unit tests passing
- [ ] All integration tests passing
- [ ] All E2E tests passing
- [ ] Manual QA completed
- [ ] Performance testing completed (if applicable)
- [ ] Security testing completed (if applicable)
- [ ] Accessibility testing completed (if applicable)
- [ ] Cross-browser testing completed (if applicable)
- [ ] Mobile testing completed (if applicable)

### Documentation

- [ ] README updated
- [ ] API documentation updated
- [ ] User documentation updated
- [ ] Changelog updated
- [ ] Migration guide written (if breaking changes)
- [ ] Internal runbook updated

### Dependencies

- [ ] All dependencies are up to date
- [ ] No known security vulnerabilities in dependencies
- [ ] License compliance verified

### Infrastructure

- [ ] Database migrations tested
- [ ] Environment variables documented
- [ ] Infrastructure changes applied (Terraform, etc.)
- [ ] Monitoring/alerting configured
- [ ] Scaling settings verified

---

## Release Day Checklist

### Pre-Deployment

- [ ] Notify team of deployment start
- [ ] Verify production environment is healthy
- [ ] Take database backup (if applicable)
- [ ] Verify rollback procedure is ready
- [ ] Create release tag in git

```bash
# Create release tag
git tag -a v[X.Y.Z] -m "Release v[X.Y.Z]"
git push origin v[X.Y.Z]
```

### Deployment Steps

1. **Staging Deployment**
   - [ ] Deploy to staging environment
   - [ ] Run smoke tests on staging
   - [ ] Verify all features work as expected
   - [ ] Get sign-off from QA

2. **Production Deployment**
   - [ ] Start deployment to production
   - [ ] Monitor deployment progress
   - [ ] Verify deployment completed successfully
   - [ ] Run production smoke tests

3. **Verification**
   - [ ] Verify all health checks passing
   - [ ] Verify key user flows work
   - [ ] Verify monitoring shows normal metrics
   - [ ] Verify no errors in logs

### Post-Deployment

- [ ] Notify team of successful deployment
- [ ] Monitor error rates for 30 minutes
- [ ] Monitor performance metrics for 30 minutes
- [ ] Verify no customer-reported issues
- [ ] Update status page (if applicable)

---

## Rollback Procedure

If issues are detected:

### Rollback Triggers
- [ ] Error rate > [X]%
- [ ] Latency > [X]ms (P95)
- [ ] Critical functionality broken
- [ ] Security vulnerability discovered

### Rollback Steps

```bash
# 1. Revert to previous version
[deployment rollback command]

# 2. Verify rollback
[verification steps]

# 3. Notify team
[notification process]
```

### Post-Rollback

- [ ] Document what went wrong
- [ ] Create incident report
- [ ] Schedule post-mortem
- [ ] Plan fix and re-release

---

## Feature Flags

Features controlled by feature flags in this release:

| Flag | Default | Description | Rollout Plan |
|------|---------|-------------|--------------|
| `FEATURE_X_ENABLED` | false | [Description] | 10% → 50% → 100% |
| `NEW_UI_ENABLED` | false | [Description] | Internal → Beta → GA |

### Flag Rollout Schedule

| Date | Flag | Percentage | Notes |
|------|------|------------|-------|
| [Date] | FEATURE_X | 10% | Initial rollout |
| [Date] | FEATURE_X | 50% | Expand if no issues |
| [Date] | FEATURE_X | 100% | Full rollout |

---

## Communication

### Internal Communication

- [ ] Engineering team notified
- [ ] Support team notified
- [ ] Sales team notified (if customer-facing features)
- [ ] Release notes shared internally

### External Communication

- [ ] Changelog published
- [ ] Blog post published (if major release)
- [ ] Social media announcement (if applicable)
- [ ] Email to customers (if applicable)
- [ ] In-app notification (if applicable)

---

## Monitoring Dashboard Links

| Dashboard | Link | Key Metrics |
|-----------|------|-------------|
| Application | [Link] | Error rate, latency |
| Infrastructure | [Link] | CPU, memory, disk |
| Business | [Link] | Signups, conversions |
| Alerts | [Link] | Active alerts |

---

## Release Notes Template

```markdown
# Release v[X.Y.Z] - [YYYY-MM-DD]

## Highlights
- [Major feature/change 1]
- [Major feature/change 2]

## New Features
- [Feature 1] (#PR)
- [Feature 2] (#PR)

## Improvements
- [Improvement 1] (#PR)
- [Improvement 2] (#PR)

## Bug Fixes
- [Fix 1] (#PR)
- [Fix 2] (#PR)

## Breaking Changes
- [Breaking change with migration guide]

## Deprecations
- [Deprecated feature - will be removed in vX.Y.Z]

## Security
- [Security fix] (if applicable)

## Known Issues
- [Known issue with workaround]
```

---

## Sign-Off

| Role | Name | Sign-Off | Date |
|------|------|----------|------|
| Engineering Lead | [Name] | ⬜ | |
| QA Lead | [Name] | ⬜ | |
| Product Manager | [Name] | ⬜ | |
| DevOps/SRE | [Name] | ⬜ | |

---

## Post-Release

### Day 1 (Release Day)

- [ ] Monitor metrics closely
- [ ] Respond to any reported issues
- [ ] Update documentation if needed

### Day 2-3

- [ ] Review error logs and metrics
- [ ] Address any non-critical issues found
- [ ] Collect initial feedback

### Week 1

- [ ] Conduct release retrospective
- [ ] Document lessons learned
- [ ] Plan improvements for next release
- [ ] Full feature flag rollout (if using)

---

## Appendix

### Emergency Contacts

| Role | Name | Contact |
|------|------|---------|
| On-Call Engineer | [Name] | [Phone/Slack] |
| DevOps Lead | [Name] | [Phone/Slack] |
| Engineering Manager | [Name] | [Phone/Slack] |

### Related Documents

- [LAUNCH_PLAN.md](./LAUNCH_PLAN.md)
- [ARD.md](../4-architecture/ARD.md)
- [PRD.md](../2-definition/PRD.md)

