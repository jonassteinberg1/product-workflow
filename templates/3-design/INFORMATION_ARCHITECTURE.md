# Information Architecture: [Product Name]

> **Status**: Draft | In Review | Approved  
> **Author**: [name]  
> **Date**: [YYYY-MM-DD]

---

## Overview

This document defines the information architecture for [Product Name], including navigation structure, content hierarchy, and user flows.

---

## Site Map

```
[Product Name]
│
├── Home / Dashboard
│   ├── Overview widgets
│   ├── Quick actions
│   └── Recent activity
│
├── [Primary Feature Area 1]
│   ├── [Sub-feature 1.1]
│   ├── [Sub-feature 1.2]
│   └── [Sub-feature 1.3]
│
├── [Primary Feature Area 2]
│   ├── [Sub-feature 2.1]
│   │   ├── [Detail view]
│   │   └── [Edit view]
│   └── [Sub-feature 2.2]
│
├── [Primary Feature Area 3]
│   └── [Sub-features...]
│
├── Settings
│   ├── Profile
│   ├── Preferences
│   ├── Integrations
│   └── Billing (if applicable)
│
└── Help / Support
    ├── Documentation
    ├── FAQ
    └── Contact
```

---

## Navigation Structure

### Primary Navigation

| Item | Icon | Route | Access Level |
|------|------|-------|--------------|
| Dashboard | 🏠 | `/` | All users |
| [Feature 1] | [icon] | `/feature-1` | All users |
| [Feature 2] | [icon] | `/feature-2` | All users |
| [Feature 3] | [icon] | `/feature-3` | Premium only |
| Settings | ⚙️ | `/settings` | All users |

### Secondary Navigation

[Feature 1] submenu:
| Item | Route | Description |
|------|-------|-------------|
| [Sub-feature 1.1] | `/feature-1/sub-1` | [Description] |
| [Sub-feature 1.2] | `/feature-1/sub-2` | [Description] |

### User/Account Menu

| Item | Route | Action |
|------|-------|--------|
| Profile | `/settings/profile` | View/edit profile |
| Preferences | `/settings/preferences` | App preferences |
| Help | `/help` | Documentation |
| Sign Out | - | Logout action |

---

## Page Hierarchy

### Level 1: Top-Level Pages

| Page | Purpose | Entry Points |
|------|---------|--------------|
| Dashboard | Overview and quick access | Primary nav, logo click |
| [Feature 1] | [Purpose] | Primary nav |
| [Feature 2] | [Purpose] | Primary nav |
| Settings | Configuration | User menu |

### Level 2: Feature Pages

| Page | Parent | Purpose |
|------|--------|---------|
| [Sub-feature 1.1] | [Feature 1] | [Purpose] |
| [Sub-feature 1.2] | [Feature 1] | [Purpose] |
| [Detail View] | [Feature 2] | View single item |
| Profile | Settings | User profile management |

### Level 3: Detail/Action Pages

| Page | Parent | Purpose |
|------|--------|---------|
| [Item Detail] | [List View] | View/edit single item |
| [Create New] | [Feature] | Create new item |
| [Confirmation] | [Action] | Confirm destructive action |

---

## Content Types

### Core Entities

| Entity | Description | CRUD | Owner |
|--------|-------------|------|-------|
| [Entity 1] | [Description] | Create, Read, Update, Delete | User |
| [Entity 2] | [Description] | Create, Read, Update | User |
| [Entity 3] | [Description] | Read only | System |

### Entity Relationships

```
┌──────────┐       ┌──────────┐
│ Entity 1 │───────│ Entity 2 │
└──────────┘   n:1 └──────────┘
      │
      │ 1:n
      ▼
┌──────────┐
│ Entity 3 │
└──────────┘
```

### Content Inventory

| Content Type | Location | Format | Update Frequency |
|--------------|----------|--------|------------------|
| User data | [Page] | Form | User-initiated |
| System data | [Page] | Table/List | Real-time |
| Static content | [Page] | Text | Rarely |
| Help content | Help section | Markdown | Monthly |

---

## User Flows

### Flow 1: [Primary User Flow]

```
┌─────────┐     ┌─────────┐     ┌─────────┐     ┌─────────┐
│ Entry   │────▶│ Step 1  │────▶│ Step 2  │────▶│ Success │
│ Point   │     │         │     │         │     │         │
└─────────┘     └─────────┘     └─────────┘     └─────────┘
                     │
                     ▼ (error)
                ┌─────────┐
                │ Error   │
                │ State   │
                └─────────┘
```

**Steps**:
1. **Entry Point**: [How user arrives]
2. **Step 1**: [Action/screen]
3. **Step 2**: [Action/screen]
4. **Success**: [Outcome]
5. **Error Handling**: [What happens on failure]

### Flow 2: [Secondary User Flow]

```
[Diagram similar to above]
```

**Steps**:
1. [Step description]
2. [Step description]
3. [Step description]

### Flow 3: [Onboarding Flow]

```
┌─────────┐     ┌─────────┐     ┌─────────┐     ┌─────────┐     ┌─────────┐
│ Sign Up │────▶│ Verify  │────▶│ Profile │────▶│ Tutorial│────▶│Dashboard│
│         │     │ Email   │     │ Setup   │     │         │     │         │
└─────────┘     └─────────┘     └─────────┘     └─────────┘     └─────────┘
```

---

## Search & Discovery

### Search Functionality

| Feature | Scope | Implementation |
|---------|-------|----------------|
| Global search | All entities | Search bar in header |
| Filtered search | Within feature | Filter controls |
| Quick find | Keyboard shortcut | Cmd/Ctrl + K |

### Search Results Structure

```
Search Results for "[query]"

[Entity Type 1] (X results)
├── Result 1 - [preview]
├── Result 2 - [preview]
└── View all →

[Entity Type 2] (X results)
├── Result 1 - [preview]
└── View all →
```

### Filtering & Sorting

| List View | Available Filters | Default Sort |
|-----------|-------------------|--------------|
| [Entity 1 List] | Status, Date, Owner | Date (newest) |
| [Entity 2 List] | Category, Status | Name (alpha) |

---

## URL Structure

### Route Patterns

| Pattern | Example | Page |
|---------|---------|------|
| `/` | `/` | Dashboard |
| `/[feature]` | `/projects` | Feature list |
| `/[feature]/new` | `/projects/new` | Create new |
| `/[feature]/[id]` | `/projects/123` | Detail view |
| `/[feature]/[id]/edit` | `/projects/123/edit` | Edit view |
| `/settings/[section]` | `/settings/profile` | Settings section |

### Query Parameters

| Parameter | Used On | Purpose |
|-----------|---------|---------|
| `?q=` | Search results | Search query |
| `?filter=` | List views | Active filter |
| `?sort=` | List views | Sort order |
| `?page=` | List views | Pagination |

---

## Accessibility Considerations

### Navigation
- [ ] All navigation items keyboard accessible
- [ ] Skip links for main content
- [ ] Breadcrumbs for deep pages
- [ ] Current page indicator in nav

### Content Structure
- [ ] Proper heading hierarchy (h1 → h2 → h3)
- [ ] Landmarks (nav, main, aside, footer)
- [ ] Descriptive link text
- [ ] Alt text for all images

### Forms
- [ ] Labels for all inputs
- [ ] Error messages associated with fields
- [ ] Focus management on errors
- [ ] Clear success/error states

---

## Mobile Considerations

### Navigation Adaptation

| Desktop | Mobile |
|---------|--------|
| Sidebar nav | Bottom tab bar |
| Secondary nav in sidebar | Hamburger menu |
| Hover states | Tap targets (44px min) |

### Content Priority

| Screen | Desktop | Mobile |
|--------|---------|--------|
| Dashboard | Full widgets | Condensed cards |
| List views | Table | Cards |
| Forms | Multi-column | Single column |

---

## Appendix

### Glossary

| Term | Definition |
|------|------------|
| [Term 1] | [Definition] |
| [Term 2] | [Definition] |

### Related Documents

- [WIREFRAMES.md](./WIREFRAMES.md)
- [DESIGN_SYSTEM.md](./DESIGN_SYSTEM.md)
- [PRD.md](../2-definition/PRD.md)

---

**Next Step**: Create wireframes in [WIREFRAMES.md](./WIREFRAMES.md)

