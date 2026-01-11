# PRD: TaskFlow

> **Status**: ✅ Approved  
> **Author**: Product Team  
> **Date**: 2026-01-10  
> **Last Updated**: 2026-01-10

---

## Overview

| Field | Value |
|-------|-------|
| **Problem Statement** | [PROBLEM_STATEMENT.md](../1-discovery/PROBLEM_STATEMENT.md) |
| **Target Users** | Small teams (5-15 people): startups, agencies, freelancer teams |
| **Success Metrics** | 500 WAT, 60% retention, NPS 50+ |
| **Timeline** | MVP: Mar 1 · v1.0: Apr 15 |

### Executive Summary

TaskFlow is a task management app designed specifically for small teams who find enterprise tools too complex and simple todo apps insufficient. We provide the "Goldilocks" solution: powerful enough for team collaboration, simple enough to set up in 5 minutes.

---

## Goals & Success Metrics

### Primary Goals

1. **Reduce task management overhead**: Teams spend <30 min/week on task admin (vs. 3-5 hours today)
2. **Eliminate lost tasks**: Zero tasks fall through the cracks with smart notifications
3. **Enable async collaboration**: Team members always know what to work on next

### Key Performance Indicators (KPIs)

| KPI | Baseline | MVP Target | v1.0 Target | Measurement Method |
|-----|----------|------------|-------------|-------------------|
| Weekly Active Teams | 0 | 100 | 500 | Analytics |
| Tasks created/team/week | N/A | 20+ | 30+ | Analytics |
| 30-day retention | N/A | 40% | 60% | Cohort analysis |
| Time to first task | N/A | < 3 min | < 2 min | Onboarding funnel |

### Non-Goals

Explicitly out of scope for this product:

- [x] Enterprise features (SSO, audit logs, advanced permissions)
- [x] Project management (Gantt, budgets, resource allocation)
- [x] Time tracking
- [x] Native mobile apps (responsive web is sufficient for v1)

---

## User Stories

See detailed user stories in [USER_STORIES.md](./USER_STORIES.md)

### Epic Summary

| Epic | User Stories | Priority | MVP |
|------|--------------|----------|-----|
| E1: Team Setup | US-001, US-002, US-003 | P0 | ✅ |
| E2: Task Management | US-004, US-005, US-006, US-007 | P0 | ✅ |
| E3: Collaboration | US-008, US-009, US-010 | P0 | ✅ |
| E4: Slack Integration | US-011, US-012 | P1 | ❌ |
| E5: AI Features | US-013, US-014 | P2 | ❌ |

---

## Features

### MVP Features (Phase 1)

| ID | Feature | User Story | Priority | Acceptance Criteria |
|----|---------|------------|----------|---------------------|
| F1 | User authentication | US-001 | P0 | Users can sign up/login with email or Google |
| F2 | Team creation | US-002 | P0 | Users can create a team and invite members |
| F3 | Task CRUD | US-004, US-005 | P0 | Create, view, edit, delete tasks |
| F4 | Task assignment | US-006 | P0 | Assign tasks to team members |
| F5 | Task status workflow | US-007 | P0 | Move tasks through Todo → In Progress → Done |
| F6 | Comments | US-008 | P0 | Add comments to tasks |
| F7 | Notifications | US-009 | P0 | Email notifications for assignments, mentions |
| F8 | Dashboard | US-010 | P0 | Personal "My Tasks" view |

#### F1: User Authentication

**Description**: Users can create an account and log in using email/password or Google OAuth. Supports password reset via email.

**User Flow**:
```
Landing Page → Sign Up Form → Email Verification → Team Setup
                    OR
Landing Page → Google OAuth → Team Setup (if new) / Dashboard (if existing)
```

**Acceptance Criteria**:
- [x] Given a new user, when they submit valid email/password, then account is created and verification email sent
- [x] Given a user with unverified email, when they click verification link, then account is activated
- [x] Given a user, when they click "Sign in with Google", then they're authenticated via OAuth
- [x] Given a user who forgot password, when they request reset, then email with reset link is sent

**Edge Cases**:
- [x] Duplicate email: Show "Email already registered" error
- [x] Weak password: Require 8+ characters
- [x] Expired verification link: Allow resend

---

#### F2: Team Creation & Invites

**Description**: Users can create a team, customize it with a name and icon, and invite team members via email. Invited users receive an email with a join link.

**User Flow**:
```
Dashboard → Create Team → Enter Name → Invite Members (optional) → Team Created
```

**Acceptance Criteria**:
- [x] Given a logged-in user, when they create a team, then they become the team owner
- [x] Given a team owner, when they invite an email, then that person receives an invitation email
- [x] Given an invited user, when they click the join link, then they're added to the team
- [x] Given a team, when it has members, then all members can see the team in their sidebar

---

#### F3: Task CRUD

**Description**: Core task management - create tasks with title, description, due date, and priority. View tasks in list or board view. Edit and delete tasks.

**Acceptance Criteria**:
- [x] Given a team member, when they create a task, then it appears in the team's task list
- [x] Given a task, when viewing it, then title, description, status, assignee, and due date are shown
- [x] Given a task creator or assignee, when they edit a task, then changes are saved
- [x] Given a task, when it's deleted, then it's removed (soft delete with 30-day recovery)

---

#### F4: Task Assignment

**Description**: Tasks can be assigned to one team member. Assignee receives notification and sees task in "My Tasks".

**Acceptance Criteria**:
- [x] Given a task, when I assign it to a team member, then they receive an email notification
- [x] Given I'm assigned a task, when I view "My Tasks", then I see all tasks assigned to me
- [x] Given a task with an assignee, when I view the task, then the assignee's avatar is shown

---

#### F5: Task Status Workflow

**Description**: Tasks move through statuses: Todo → In Progress → Done. Support Kanban board view for visual status management.

**Acceptance Criteria**:
- [x] Given a new task, when created, then status is "Todo"
- [x] Given a task in "Todo", when I drag to "In Progress", then status updates
- [x] Given a task in "Done", when 7 days pass, then it auto-archives (hidden from board)
- [x] Given the board view, when I view it, then tasks are grouped by status columns

---

### Phase 2 Features

| ID | Feature | User Story | Priority | Notes |
|----|---------|------------|----------|-------|
| F9 | Slack integration | US-011, US-012 | P1 | Create tasks from Slack, get notifications |
| F10 | Due date reminders | US-013 | P1 | Smart reminders before due dates |

---

## UX Requirements

### Design Principles

1. **Speed over features**: Every action should feel instant (<100ms perceived)
2. **Keyboard-first**: Power users can do everything without touching mouse
3. **Minimal chrome**: Content (tasks) should dominate, not UI

### Wireframes & Mockups

- Information Architecture: [INFORMATION_ARCHITECTURE.md](../3-design/INFORMATION_ARCHITECTURE.md)
- Wireframes: [WIREFRAMES.md](../3-design/WIREFRAMES.md)
- Design System: [DESIGN_SYSTEM.md](../3-design/DESIGN_SYSTEM.md)

### Key Screens

| Screen | Purpose | Status |
|--------|---------|--------|
| Dashboard | Personal task view, team overview | Wireframed |
| Board View | Kanban-style task management | Wireframed |
| Task Detail | View/edit single task | Wireframed |
| Team Settings | Manage members, team config | Wireframed |

---

## Technical Requirements

### Architecture

See [ARD.md](../4-architecture/ARD.md) for detailed technical architecture.

### Key Technical Constraints

| Constraint | Requirement | Rationale |
|------------|-------------|-----------|
| Performance | < 200ms API response, < 2s page load | Core differentiator is speed |
| Scale | Support 1000 concurrent users | Target for 6 months post-launch |
| Availability | 99.5% uptime | Acceptable for SMB market |
| Security | Standard auth, encrypted data | No special compliance needed |

### Integrations

| System | Type | Priority | Notes |
|--------|------|----------|-------|
| Slack | OAuth + Webhooks | P1 | Phase 2 |
| Google OAuth | Authentication | P0 | MVP |

---

## Release Plan

### MVP Scope

**In Scope**:
- [x] F1: User authentication
- [x] F2: Team creation & invites
- [x] F3: Task CRUD
- [x] F4: Task assignment
- [x] F5: Task status workflow
- [x] F6: Comments
- [x] F7: Notifications
- [x] F8: Dashboard

**Out of Scope** (moved to Phase 2):
- [ ] F9: Slack integration
- [ ] F10: Due date reminders
- [ ] AI features

### Milestones

| Milestone | Target Date | Deliverables |
|-----------|-------------|--------------|
| M1: Foundation | Jan 25 | Auth, database, CI/CD |
| M2: Core Tasks | Feb 10 | Task CRUD, board view |
| M3: Collaboration | Feb 25 | Comments, notifications, invites |
| M4: MVP Launch | Mar 1 | Beta release |
| M5: v1.0 | Apr 15 | Slack integration, polish |

---

## Risks & Mitigations

| Risk | Likelihood | Impact | Mitigation |
|------|------------|--------|------------|
| Real-time sync complexity | Medium | High | Use established solution (Supabase realtime) |
| Slow adoption | Medium | High | Focus on one niche (startups) initially |
| Feature creep | High | Medium | Strict PRD freeze after approval |

---

## Open Questions

- [x] ~~Pricing model?~~ → $8/user/month, free for up to 3 users
- [ ] Should completed tasks auto-archive? → Yes, after 7 days

---

**Next Step**: ✅ Proceed to [Architecture](../4-architecture/ARD.md)

