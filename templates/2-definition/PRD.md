# PRD: [Product Name]

> **Status**: Draft | In Review | Approved  
> **Author**: [name]  
> **Date**: [YYYY-MM-DD]  
> **Last Updated**: [YYYY-MM-DD]

---

## Overview

| Field | Value |
|-------|-------|
| **Problem Statement** | [Link to PROBLEM_STATEMENT.md](../1-discovery/PROBLEM_STATEMENT.md) |
| **Target Users** | [Primary persona from problem statement] |
| **Success Metrics** | [Link to metrics in problem statement] |
| **Timeline** | MVP: [Date] · v1.0: [Date] |

### Executive Summary

[2-3 sentence summary of what we're building and why. This should be readable by anyone in 30 seconds.]

---

## Goals & Success Metrics

### Primary Goals

1. **[Goal 1]**: [Measurable outcome]
2. **[Goal 2]**: [Measurable outcome]
3. **[Goal 3]**: [Measurable outcome]

### Key Performance Indicators (KPIs)

| KPI | Baseline | MVP Target | v1.0 Target | Measurement Method |
|-----|----------|------------|-------------|-------------------|
| [KPI 1] | [Current] | [Target] | [Target] | [How measured] |
| [KPI 2] | [Current] | [Target] | [Target] | [How measured] |
| [KPI 3] | [Current] | [Target] | [Target] | [How measured] |

### Non-Goals

Explicitly out of scope for this product:

- [ ] [Non-goal 1]
- [ ] [Non-goal 2]
- [ ] [Non-goal 3]

---

## User Stories

See detailed user stories in [USER_STORIES.md](./USER_STORIES.md)

### Epic Summary

| Epic | User Stories | Priority | MVP |
|------|--------------|----------|-----|
| [Epic 1: Core Functionality] | US-001, US-002, US-003 | P0 | ✅ |
| [Epic 2: User Management] | US-004, US-005 | P0 | ✅ |
| [Epic 3: Integrations] | US-006, US-007 | P1 | ❌ |
| [Epic 4: Analytics] | US-008, US-009 | P2 | ❌ |

---

## Features

### MVP Features (Phase 1)

| ID | Feature | User Story | Priority | Acceptance Criteria |
|----|---------|------------|----------|---------------------|
| F1 | [Feature name] | US-001 | P0 | [Link or inline criteria] |
| F2 | [Feature name] | US-002 | P0 | [Criteria] |
| F3 | [Feature name] | US-003 | P0 | [Criteria] |
| F4 | [Feature name] | US-004 | P0 | [Criteria] |

#### F1: [Feature Name]

**Description**: [Detailed description of what this feature does]

**User Flow**:
```
[Step 1] → [Step 2] → [Step 3] → [Outcome]
```

**Acceptance Criteria**:
- [ ] Given [precondition], when [action], then [expected result]
- [ ] Given [precondition], when [action], then [expected result]
- [ ] Given [precondition], when [action], then [expected result]

**Edge Cases**:
- [ ] [Edge case 1]: [Expected behavior]
- [ ] [Edge case 2]: [Expected behavior]

**Dependencies**: [Other features or external systems required]

---

#### F2: [Feature Name]

[Repeat the same structure for each feature]

---

### Phase 2 Features

| ID | Feature | User Story | Priority | Notes |
|----|---------|------------|----------|-------|
| F5 | [Feature name] | US-005 | P1 | [Notes] |
| F6 | [Feature name] | US-006 | P1 | [Notes] |

[Brief descriptions - detail to be added when approaching Phase 2]

---

### Future Considerations

Features we may build later (not committed):

- [ ] [Future feature 1]
- [ ] [Future feature 2]
- [ ] [Future feature 3]

---

## UX Requirements

### Design Principles

1. **[Principle 1]**: [Description]
2. **[Principle 2]**: [Description]
3. **[Principle 3]**: [Description]

### Wireframes & Mockups

- Information Architecture: [Link to INFORMATION_ARCHITECTURE.md](../3-design/INFORMATION_ARCHITECTURE.md)
- Wireframes: [Link to WIREFRAMES.md](../3-design/WIREFRAMES.md)
- Design System: [Link to DESIGN_SYSTEM.md](../3-design/DESIGN_SYSTEM.md)

### Key Screens

| Screen | Purpose | Wireframe |
|--------|---------|-----------|
| [Screen 1] | [Purpose] | [Link] |
| [Screen 2] | [Purpose] | [Link] |
| [Screen 3] | [Purpose] | [Link] |

### Interaction Patterns

- **Navigation**: [Tab bar / Sidebar / etc.]
- **Data Entry**: [Form patterns, validation approach]
- **Feedback**: [Loading states, success/error states]
- **Responsive**: [Mobile-first / Desktop-first / Adaptive]

---

## Technical Requirements

### Architecture

See [ARD.md](../4-architecture/ARD.md) for detailed technical architecture.

### Key Technical Constraints

| Constraint | Requirement | Rationale |
|------------|-------------|-----------|
| Performance | [e.g., < 2s page load] | [Why this matters] |
| Scale | [e.g., Support 10K concurrent users] | [Growth projections] |
| Availability | [e.g., 99.9% uptime] | [Business requirement] |
| Security | [e.g., SOC 2 compliant] | [Customer requirement] |

### Integrations

| System | Type | Priority | Notes |
|--------|------|----------|-------|
| [System 1] | Required | P0 | [Integration details] |
| [System 2] | Optional | P1 | [Integration details] |

### Data Requirements

| Data Entity | Source | Storage | Retention |
|-------------|--------|---------|-----------|
| [Entity 1] | [Source] | [Storage type] | [Retention policy] |
| [Entity 2] | [Source] | [Storage type] | [Retention policy] |

---

## Release Plan

### MVP Scope

**In Scope**:
- [ ] F1: [Feature]
- [ ] F2: [Feature]
- [ ] F3: [Feature]
- [ ] F4: [Feature]

**Out of Scope** (moved to Phase 2):
- [ ] F5: [Feature]
- [ ] F6: [Feature]

### Milestones

| Milestone | Target Date | Deliverables |
|-----------|-------------|--------------|
| M1: Foundation | [Date] | [Deliverables] |
| M2: Core Features | [Date] | [Deliverables] |
| M3: MVP Complete | [Date] | [Deliverables] |
| M4: Beta Launch | [Date] | [Deliverables] |
| M5: GA Launch | [Date] | [Deliverables] |

### Launch Criteria

MVP is ready to launch when:

- [ ] All P0 features complete and tested
- [ ] Performance targets met
- [ ] Security review passed
- [ ] Documentation complete
- [ ] Support team trained
- [ ] Monitoring/alerting in place

---

## Risks & Mitigations

| Risk | Likelihood | Impact | Mitigation |
|------|------------|--------|------------|
| [Risk 1] | High/Med/Low | High/Med/Low | [Mitigation strategy] |
| [Risk 2] | High/Med/Low | High/Med/Low | [Mitigation strategy] |
| [Risk 3] | High/Med/Low | High/Med/Low | [Mitigation strategy] |

---

## Open Questions

Questions that need answers before/during development:

- [ ] [Question 1] - Owner: [Name] - Due: [Date]
- [ ] [Question 2] - Owner: [Name] - Due: [Date]
- [ ] [Question 3] - Owner: [Name] - Due: [Date]

---

## Appendix

### Glossary

| Term | Definition |
|------|------------|
| [Term 1] | [Definition] |
| [Term 2] | [Definition] |

### Related Documents

- [PROBLEM_STATEMENT.md](../1-discovery/PROBLEM_STATEMENT.md)
- [USER_RESEARCH.md](../1-discovery/USER_RESEARCH.md)
- [COMPETITIVE_ANALYSIS.md](../1-discovery/COMPETITIVE_ANALYSIS.md)
- [ARD.md](../4-architecture/ARD.md)

### Revision History

| Version | Date | Author | Changes |
|---------|------|--------|---------|
| 0.1 | [Date] | [Name] | Initial draft |
| 0.2 | [Date] | [Name] | [Changes] |

---

**Next Step**: Complete [USER_STORIES.md](./USER_STORIES.md), then proceed to [Design phase](../3-design/)

