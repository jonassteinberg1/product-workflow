# Beads Tasks: TaskFlow

> **Status**: 🔄 In Progress  
> **Author**: Engineering Team  
> **Date**: 2026-01-10

---

## Task Overview

| Milestone | Tasks | Completed | Status |
|-----------|-------|-----------|--------|
| M1: Foundation | 4 | 0 | ⬜ Not Started |
| M2: Core Tasks | 4 | 0 | ⬜ Not Started |
| M3: Collaboration | 3 | 0 | ⬜ Not Started |
| **Total** | **11** | **0** | |

---

## M1: Foundation

### Task 001: Project Setup

| Field | Value |
|-------|-------|
| **Milestone** | M1 - Foundation |
| **Feature** | Infrastructure |
| **Priority** | P0 |
| **Complexity** | SIMPLE |
| **Dependencies** | None |

**Objective**: Initialize Next.js 14 project with TypeScript, Tailwind CSS, and shadcn/ui.

**Requirements**:
- [x] Next.js 14 with App Router
- [x] TypeScript configured
- [x] Tailwind CSS configured
- [x] shadcn/ui initialized
- [x] ESLint + Prettier configured

**Acceptance Criteria**:
- [ ] `npm run dev` starts development server
- [ ] `npm run build` produces production build
- [ ] `npm run lint` passes with no errors
- [ ] Basic landing page renders at `/`

**Files to Create**:
- `package.json` - Dependencies
- `next.config.js` - Next.js config
- `tailwind.config.ts` - Tailwind config
- `tsconfig.json` - TypeScript config
- `app/page.tsx` - Landing page
- `app/layout.tsx` - Root layout

---

### Task 002: Supabase Setup

| Field | Value |
|-------|-------|
| **Milestone** | M1 - Foundation |
| **Feature** | Infrastructure |
| **Priority** | P0 |
| **Complexity** | SIMPLE |
| **Dependencies** | 001 |

**Objective**: Configure Supabase project with database schema and RLS policies.

**Requirements**:
- [x] Supabase client configured
- [x] Database schema created (users, teams, tasks, comments)
- [x] RLS policies enabled
- [x] Environment variables set up

**Acceptance Criteria**:
- [ ] Supabase client connects successfully
- [ ] All tables created with correct schema
- [ ] RLS policies prevent unauthorized access
- [ ] `.env.local.example` documents required variables

**Files to Create**:
- `lib/supabase/client.ts` - Browser client
- `lib/supabase/server.ts` - Server client
- `supabase/migrations/001_initial_schema.sql` - Schema
- `.env.local.example` - Environment template

**Database Schema**:
```sql
-- See ARD for full schema
CREATE TABLE profiles (
  id UUID PRIMARY KEY REFERENCES auth.users(id),
  email TEXT NOT NULL,
  name TEXT,
  avatar_url TEXT,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE TABLE teams (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  name TEXT NOT NULL,
  owner_id UUID REFERENCES profiles(id),
  created_at TIMESTAMPTZ DEFAULT NOW()
);

-- ... (full schema in migration file)
```

---

### Task 003: Auth Implementation

| Field | Value |
|-------|-------|
| **Milestone** | M1 - Foundation |
| **Feature** | F1 - User Authentication |
| **Priority** | P0 |
| **Complexity** | STANDARD |
| **Dependencies** | 001, 002 |

**Objective**: Implement user authentication with email/password and Google OAuth.

**Requirements**:
From PRD (US-001):
- [x] Users can sign up with email and password
- [x] Users can sign in with Google
- [x] Password reset via email
- [x] Email verification

**Acceptance Criteria**:
- [ ] Sign up form creates new user in Supabase Auth
- [ ] Login form authenticates existing users
- [ ] Google OAuth flow works end-to-end
- [ ] Password reset sends email and allows reset
- [ ] Protected routes redirect to login if unauthenticated
- [ ] Auth state persists across page refreshes

**Files to Create/Modify**:
- `app/(auth)/login/page.tsx` - Login page
- `app/(auth)/signup/page.tsx` - Sign up page
- `app/(auth)/reset-password/page.tsx` - Password reset
- `components/auth/login-form.tsx` - Login form component
- `components/auth/signup-form.tsx` - Sign up form component
- `lib/auth/actions.ts` - Server actions for auth
- `middleware.ts` - Route protection

**Implementation Notes**:
- Use Supabase Auth helpers for Next.js
- Implement as Server Actions for form submissions
- Use middleware for route protection

---

### Task 004: CI/CD Setup

| Field | Value |
|-------|-------|
| **Milestone** | M1 - Foundation |
| **Feature** | Infrastructure |
| **Priority** | P0 |
| **Complexity** | SIMPLE |
| **Dependencies** | 001 |

**Objective**: Set up GitHub Actions for CI and Vercel for deployment.

**Requirements**:
- [x] Lint on PR
- [x] Build on PR
- [x] Auto-deploy to Vercel on merge to main

**Acceptance Criteria**:
- [ ] PRs run lint and build checks
- [ ] Merges to main auto-deploy to Vercel
- [ ] Preview deployments for PRs

**Files to Create**:
- `.github/workflows/ci.yml` - CI workflow
- `vercel.json` - Vercel config (if needed)

---

## M2: Core Tasks

### Task 005: Task CRUD Backend

| Field | Value |
|-------|-------|
| **Milestone** | M2 - Core Tasks |
| **Feature** | F3 - Task CRUD |
| **Priority** | P0 |
| **Complexity** | STANDARD |
| **Dependencies** | 002, 003 |

**Objective**: Implement server-side task creation, reading, updating, and deletion.

**Requirements**:
From PRD (US-004, US-005):
- [x] Create task with title, description, status, priority, due date
- [x] Read tasks (list and single)
- [x] Update task fields
- [x] Soft delete tasks

**Acceptance Criteria**:
- [ ] `createTask` action creates task in database
- [ ] `getTasks` returns tasks for user's teams
- [ ] `updateTask` modifies task fields
- [ ] `deleteTask` soft-deletes (sets deleted_at)
- [ ] RLS prevents access to other teams' tasks

**Files to Create**:
- `lib/tasks/actions.ts` - Server actions
- `lib/tasks/queries.ts` - Database queries
- `types/task.ts` - TypeScript types

---

### Task 006: Task CRUD Frontend

| Field | Value |
|-------|-------|
| **Milestone** | M2 - Core Tasks |
| **Feature** | F3 - Task CRUD |
| **Priority** | P0 |
| **Complexity** | STANDARD |
| **Dependencies** | 005 |

**Objective**: Build UI for task list, task creation modal, and task detail view.

**Requirements**:
- [x] Task list view with filtering
- [x] Create task modal/form
- [x] Task detail slide-over or modal
- [x] Edit task inline or in detail view

**Acceptance Criteria**:
- [ ] Task list displays all team tasks
- [ ] "New Task" button opens creation form
- [ ] Clicking task opens detail view
- [ ] Edit/delete actions work from detail view
- [ ] Optimistic updates for snappy UX

**Files to Create**:
- `app/(dashboard)/[teamId]/tasks/page.tsx` - Task list page
- `components/tasks/task-list.tsx` - Task list component
- `components/tasks/task-card.tsx` - Individual task card
- `components/tasks/create-task-dialog.tsx` - Create modal
- `components/tasks/task-detail.tsx` - Detail view

---

### Task 007: Board View

| Field | Value |
|-------|-------|
| **Milestone** | M2 - Core Tasks |
| **Feature** | F5 - Task Status Workflow |
| **Priority** | P0 |
| **Complexity** | STANDARD |
| **Dependencies** | 006 |

**Objective**: Implement Kanban-style board view with drag-and-drop.

**Requirements**:
From PRD (US-007):
- [x] Board with columns: Todo, In Progress, Done
- [x] Drag-and-drop to change status
- [x] Visual indication of task priority

**Acceptance Criteria**:
- [ ] Board displays tasks in status columns
- [ ] Dragging task to new column updates status
- [ ] Status change persists to database
- [ ] Board updates in real-time (Supabase realtime)

**Files to Create**:
- `app/(dashboard)/[teamId]/board/page.tsx` - Board page
- `components/board/board-view.tsx` - Board component
- `components/board/board-column.tsx` - Column component
- `components/board/draggable-task.tsx` - Draggable task

**Implementation Notes**:
- Use `@dnd-kit` for drag and drop
- Subscribe to Supabase realtime for live updates

---

### Task 008: Task Assignment

| Field | Value |
|-------|-------|
| **Milestone** | M2 - Core Tasks |
| **Feature** | F4 - Task Assignment |
| **Priority** | P0 |
| **Complexity** | STANDARD |
| **Dependencies** | 005, 006 |

**Objective**: Allow assigning tasks to team members.

**Requirements**:
From PRD (US-006):
- [x] Assign task to team member
- [x] Show assignee avatar on task card
- [x] "My Tasks" filter shows assigned tasks

**Acceptance Criteria**:
- [ ] Task form includes assignee dropdown
- [ ] Assignee can be changed from task detail
- [ ] Task cards show assignee avatar
- [ ] "My Tasks" view filters to current user's tasks

**Files to Modify**:
- `components/tasks/task-card.tsx` - Add avatar
- `components/tasks/create-task-dialog.tsx` - Add assignee field
- `app/(dashboard)/my-tasks/page.tsx` - My Tasks page

---

## M3: Collaboration

### Task 009: Comments

| Field | Value |
|-------|-------|
| **Milestone** | M3 - Collaboration |
| **Feature** | F6 - Comments |
| **Priority** | P0 |
| **Complexity** | SIMPLE |
| **Dependencies** | 006 |

**Objective**: Add comment functionality to tasks.

**Requirements**:
- [x] Add comment to task
- [x] View comments on task detail
- [x] Delete own comments

**Acceptance Criteria**:
- [ ] Comment form appears in task detail
- [ ] Comments display with author and timestamp
- [ ] Users can delete their own comments
- [ ] Comments load in real-time

---

### Task 010: Notifications

| Field | Value |
|-------|-------|
| **Milestone** | M3 - Collaboration |
| **Feature** | F7 - Notifications |
| **Priority** | P0 |
| **Complexity** | STANDARD |
| **Dependencies** | 008, 009 |

**Objective**: Send email notifications for task assignments and mentions.

**Requirements**:
- [x] Email on task assignment
- [x] Email on comment mention (@username)

**Acceptance Criteria**:
- [ ] Assignee receives email when assigned
- [ ] Users receive email when @mentioned in comment
- [ ] Emails use professional template (Resend)
- [ ] Notification preferences (future: in-app toggle)

---

### Task 011: Team Invites

| Field | Value |
|-------|-------|
| **Milestone** | M3 - Collaboration |
| **Feature** | F2 - Team Creation |
| **Priority** | P0 |
| **Complexity** | STANDARD |
| **Dependencies** | 003 |

**Objective**: Allow team owners to invite members via email.

**Requirements**:
- [x] Invite by email address
- [x] Invitation email with join link
- [x] Accept invitation flow

**Acceptance Criteria**:
- [ ] Team settings shows "Invite Member" button
- [ ] Entering email sends invitation
- [ ] Invitation email contains secure join link
- [ ] Clicking link adds user to team (creates account if needed)

---

## Execution Commands

```bash
# Run foundation tasks
zeroshot run --config standard.json --bead M1-foundation/001-project-setup.md
zeroshot run --config standard.json --bead M1-foundation/002-supabase-setup.md
zeroshot run --config standard.json --bead M1-foundation/003-auth-implementation.md
zeroshot run --config simple.json --bead M1-foundation/004-ci-cd-setup.md

# Run core task features
zeroshot run --config standard.json --bead M2-core-tasks/005-task-crud-backend.md
zeroshot run --config standard.json --bead M2-core-tasks/006-task-crud-frontend.md
zeroshot run --config standard.json --bead M2-core-tasks/007-board-view.md
zeroshot run --config standard.json --bead M2-core-tasks/008-task-assignment.md

# Run collaboration features
zeroshot run --config simple.json --bead M3-collaboration/009-comments.md
zeroshot run --config standard.json --bead M3-collaboration/010-notifications.md
zeroshot run --config standard.json --bead M3-collaboration/011-team-invites.md
```

---

## Related Documents

- [ARD.md](../4-architecture/ARD.md)
- [PRD.md](../2-definition/PRD.md)
- [ZEROSHOT_CONFIG.md](./ZEROSHOT_CONFIG.md)

