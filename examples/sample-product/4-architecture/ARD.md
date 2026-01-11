# ARD: TaskFlow

> **Status**: ✅ Approved  
> **Tech Lead**: Engineering Team  
> **Date**: 2026-01-10  
> **Last Updated**: 2026-01-10

---

## Overview

| Field | Value |
|-------|-------|
| **PRD** | [PRD.md](../2-definition/PRD.md) |
| **Tech Lead** | Engineering Team |
| **Target Environment** | Production (Vercel + Supabase) |

### Executive Summary

TaskFlow is built as a modern web application using Next.js (React) for the frontend and Supabase for backend services (auth, database, realtime). This stack was chosen for rapid development, built-in realtime capabilities, and excellent developer experience.

---

## Architecture Decision Records (ADRs)

### ADR-001: Full-Stack Framework Selection

| Field | Value |
|-------|-------|
| **Status** | ✅ Accepted |
| **Date** | 2026-01-10 |
| **Deciders** | Engineering Team |

**Context**:
We need a full-stack framework that enables rapid development for a small team while providing excellent UX (fast, responsive).

**Decision**:
Use **Next.js 14** with App Router for the full-stack framework.

**Options Considered**:

| Option | Pros | Cons |
|--------|------|------|
| Next.js 14 | React ecosystem, SSR/SSG, excellent DX, Vercel deployment | React-specific |
| Remix | Great data loading, progressive enhancement | Smaller ecosystem |
| SvelteKit (Chosen: No) | Fast, small bundle | Smaller talent pool |
| **Next.js 14 (Chosen)** | Best balance of ecosystem, performance, DX | React lock-in acceptable |

**Consequences**:
- Positive: Access to massive React ecosystem, easy deployment to Vercel
- Positive: Server components reduce client bundle size
- Negative: Tied to React paradigm

---

### ADR-002: Backend-as-a-Service Selection

| Field | Value |
|-------|-------|
| **Status** | ✅ Accepted |
| **Date** | 2026-01-10 |
| **Deciders** | Engineering Team |

**Context**:
We need auth, database, and realtime capabilities. Building custom backend would slow development significantly.

**Decision**:
Use **Supabase** for backend services.

**Options Considered**:

| Option | Pros | Cons |
|--------|------|------|
| Custom (Node + Postgres) | Full control | Slow development, more maintenance |
| Firebase | Mature, good realtime | Vendor lock-in, NoSQL complexity |
| **Supabase (Chosen)** | Postgres, realtime, auth, open source | Newer, smaller community |

**Consequences**:
- Positive: Built-in auth, realtime subscriptions, Row Level Security
- Positive: Open source, can self-host if needed
- Negative: Dependent on Supabase service reliability

---

### ADR-003: Styling Approach

| Field | Value |
|-------|-------|
| **Status** | ✅ Accepted |
| **Date** | 2026-01-10 |

**Context**:
Need consistent, maintainable styling that's fast to develop.

**Decision**:
Use **Tailwind CSS** with **shadcn/ui** component library.

**Consequences**:
- Positive: Rapid development, consistent design
- Positive: shadcn/ui components are accessible by default
- Negative: HTML can be verbose with utility classes

---

## Tech Stack

| Layer | Technology | Version | Rationale |
|-------|------------|---------|-----------|
| **Frontend** | | | |
| Framework | Next.js | 14.x | ADR-001 |
| UI Library | React | 18.x | Industry standard |
| Styling | Tailwind CSS | 3.x | ADR-003 |
| Components | shadcn/ui | Latest | Accessible, customizable |
| State | Zustand | 4.x | Simple, performant |
| **Backend** | | | |
| BaaS | Supabase | Latest | ADR-002 |
| Database | PostgreSQL | 15.x | Via Supabase |
| Auth | Supabase Auth | Latest | Built-in |
| Realtime | Supabase Realtime | Latest | Built-in |
| **Infrastructure** | | | |
| Hosting | Vercel | N/A | Optimal for Next.js |
| Database | Supabase Cloud | N/A | Managed Postgres |
| Email | Resend | N/A | Simple transactional email |
| **DevOps** | | | |
| CI/CD | GitHub Actions | N/A | Standard |
| Monitoring | Vercel Analytics | N/A | Built-in |

---

## Architecture Diagrams

### High-Level Architecture

```
┌─────────────────────────────────────────────────────────────────┐
│                         CLIENTS                                  │
│  ┌──────────────┐  ┌──────────────┐  ┌──────────────┐           │
│  │   Browser    │  │   Browser    │  │   Browser    │           │
│  │   (React)    │  │   (React)    │  │   (React)    │           │
│  └──────┬───────┘  └──────┬───────┘  └──────┬───────┘           │
└─────────┼─────────────────┼─────────────────┼───────────────────┘
          │                 │                 │
          └────────────────┼─────────────────┘
                           │
                           ▼
┌─────────────────────────────────────────────────────────────────┐
│                         VERCEL                                   │
│  ┌─────────────────────────────────────────────────────────┐    │
│  │                    Next.js App                           │    │
│  │  ┌─────────────┐  ┌─────────────┐  ┌─────────────┐      │    │
│  │  │   Pages/    │  │    API      │  │   Server    │      │    │
│  │  │   Routes    │  │   Routes    │  │ Components  │      │    │
│  │  └─────────────┘  └──────┬──────┘  └─────────────┘      │    │
│  └──────────────────────────┼──────────────────────────────┘    │
└─────────────────────────────┼───────────────────────────────────┘
                              │
                              ▼
┌─────────────────────────────────────────────────────────────────┐
│                        SUPABASE                                  │
│  ┌─────────────┐  ┌─────────────┐  ┌─────────────┐              │
│  │    Auth     │  │  Database   │  │  Realtime   │              │
│  │  (GoTrue)   │  │ (Postgres)  │  │ (Websocket) │              │
│  └─────────────┘  └─────────────┘  └─────────────┘              │
│                                                                  │
│  ┌─────────────┐  ┌─────────────┐                               │
│  │   Storage   │  │    Edge     │                               │
│  │   (S3)      │  │  Functions  │                               │
│  └─────────────┘  └─────────────┘                               │
└─────────────────────────────────────────────────────────────────┘
```

---

## Data Model

### Entity Relationship Diagram

```
┌──────────────┐       ┌──────────────┐       ┌──────────────┐
│    users     │       │    teams     │       │    tasks     │
├──────────────┤       ├──────────────┤       ├──────────────┤
│ id (PK)      │       │ id (PK)      │◄──────│ id (PK)      │
│ email        │       │ name         │       │ team_id (FK) │
│ name         │       │ created_at   │       │ title        │
│ avatar_url   │       │ owner_id(FK) │───────│ description  │
│ created_at   │       └──────────────┘       │ status       │
└──────┬───────┘              │               │ priority     │
       │                      │               │ assignee_id  │
       │         ┌────────────┘               │ due_date     │
       │         │                            │ created_by   │
       │         ▼                            │ created_at   │
       │  ┌──────────────┐                    └──────────────┘
       │  │ team_members │                           │
       │  ├──────────────┤                           │
       └──│ user_id (FK) │                           │
          │ team_id (FK) │                           ▼
          │ role         │                    ┌──────────────┐
          │ joined_at    │                    │   comments   │
          └──────────────┘                    ├──────────────┤
                                              │ id (PK)      │
                                              │ task_id (FK) │
                                              │ user_id (FK) │
                                              │ content      │
                                              │ created_at   │
                                              └──────────────┘
```

### Key Tables

| Entity | Description | Storage | Retention |
|--------|-------------|---------|-----------|
| users | User accounts | Supabase Auth + profiles table | Indefinite |
| teams | Team/workspace | Postgres | Indefinite |
| team_members | Team membership | Postgres | Indefinite |
| tasks | Task items | Postgres | Indefinite (soft delete) |
| comments | Task comments | Postgres | Indefinite |

---

## Security Considerations

### Authentication & Authorization

- [x] Authentication: Supabase Auth (email/password, Google OAuth)
- [x] Authorization: Row Level Security (RLS) policies in Postgres
- [x] Session: JWT tokens, 1 hour expiry, refresh tokens

### Row Level Security Policies

```sql
-- Users can only see teams they're members of
CREATE POLICY "Users can view their teams"
ON teams FOR SELECT
USING (id IN (
  SELECT team_id FROM team_members WHERE user_id = auth.uid()
));

-- Users can only see tasks in their teams
CREATE POLICY "Users can view team tasks"
ON tasks FOR SELECT
USING (team_id IN (
  SELECT team_id FROM team_members WHERE user_id = auth.uid()
));
```

---

## Milestones → Execution

### Development Phases

| Milestone | Features | Est. Complexity | Zeroshot Config | Target Date |
|-----------|----------|-----------------|-----------------|-------------|
| M1: Foundation | Auth, DB, CI/CD | STANDARD | standard.json | Jan 25 |
| M2: Core Tasks | Task CRUD, Board | CRITICAL | critical.json | Feb 10 |
| M3: Collaboration | Comments, Notifications | STANDARD | standard.json | Feb 25 |
| M4: MVP Launch | Polish, Launch | SIMPLE | simple.json | Mar 1 |

### Beads Task Mapping

See [BEADS_TASKS.md](../5-execution/BEADS_TASKS.md) for detailed task breakdown.

```
taskflow/
├── M1-foundation/
│   ├── 001-project-setup.md         (SIMPLE)
│   ├── 002-supabase-setup.md        (SIMPLE)
│   ├── 003-auth-implementation.md   (STANDARD)
│   └── 004-ci-cd-setup.md           (SIMPLE)
│
├── M2-core-tasks/
│   ├── 005-task-crud-backend.md     (STANDARD)
│   ├── 006-task-crud-frontend.md    (STANDARD)
│   ├── 007-board-view.md            (STANDARD)
│   └── 008-task-assignment.md       (STANDARD)
│
└── M3-collaboration/
    ├── 009-comments.md              (SIMPLE)
    ├── 010-notifications.md         (STANDARD)
    └── 011-team-invites.md          (STANDARD)
```

---

## Related Documents

- [PRD.md](../2-definition/PRD.md)
- [BEADS_TASKS.md](../5-execution/BEADS_TASKS.md)
- [ZEROSHOT_CONFIG.md](../5-execution/ZEROSHOT_CONFIG.md)

---

**Next Step**: Generate execution tasks in [BEADS_TASKS.md](../5-execution/BEADS_TASKS.md)

