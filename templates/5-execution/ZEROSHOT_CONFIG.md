# Zeroshot Configuration Guide: [Product Name]

> **Author**: [name]  
> **Date**: [YYYY-MM-DD]

---

## Overview

This document provides configuration templates and guidance for running [Zeroshot](https://github.com/covibes/zeroshot) or Ralph-Wiggum against your project's tasks.

---

## Quick Start

### Installation

```bash
# Install zeroshot globally
npm install -g @covibes/zeroshot

# Verify installation
zeroshot --version

# Authenticate with Claude
claude auth login
```

### Basic Usage

```bash
# Run against a GitHub issue
zeroshot <issue-number>

# Run with specific complexity
zeroshot <issue-number> --complexity standard

# Run with PR creation
zeroshot <issue-number> --pr

# Run with full automation (creates and merges PR)
zeroshot <issue-number> --ship
```

---

## Complexity Levels

### Overview

| Complexity | Agents | Validators | Model | Use Case |
|------------|--------|------------|-------|----------|
| TRIVIAL | 1 | 0 | haiku | Typos, config changes |
| SIMPLE | 2 | 1 (generic) | sonnet | Small features |
| STANDARD | 4 | 2 (req, code) | sonnet | Normal features |
| CRITICAL | 7 | 5 (all) | opus (planner) | Security, payments |

### TRIVIAL

Single worker, no validation. For quick, low-risk changes.

```bash
zeroshot <issue> --complexity trivial
```

**Use for**:
- Documentation updates
- Typo fixes
- Simple config changes
- Comment additions

### SIMPLE

Worker with generic validation.

```bash
zeroshot <issue> --complexity simple
```

**Use for**:
- Add new form field
- Simple API endpoint
- UI component (copy existing pattern)
- Bug fixes with clear cause

### STANDARD (Default)

Planner + workers with requirements and code validation.

```bash
zeroshot <issue> --complexity standard
# or just
zeroshot <issue>
```

**Use for**:
- New features
- Refactoring
- Integration work
- Most development tasks

### CRITICAL

Full validation suite including security and adversarial testing.

```bash
zeroshot <issue> --complexity critical
```

**Use for**:
- Authentication/authorization
- Payment processing
- Data migrations
- Security-sensitive code
- External API integrations

---

## Custom Cluster Configurations

### Configuration File Structure

```json
{
  "name": "custom-workflow",
  "description": "Description of this workflow",
  "complexity": "STANDARD",
  "agents": {
    "planner": {
      "model": "sonnet",
      "systemPrompt": "You are a senior engineer planning implementation..."
    },
    "workers": [
      {
        "name": "implementer",
        "model": "sonnet",
        "count": 2
      }
    ],
    "validators": [
      {
        "name": "requirements",
        "model": "sonnet"
      },
      {
        "name": "code",
        "model": "sonnet"
      }
    ]
  },
  "settings": {
    "maxIterations": 5,
    "autoMerge": false,
    "branchPrefix": "feature/"
  }
}
```

### Save Configuration

```bash
# Save as default for this repo
zeroshot config save --name my-config --file ./config.json

# Use saved config
zeroshot <issue> --config my-config
```

---

## Project-Specific Configurations

### Configuration: `standard.json`

For typical feature development:

```json
{
  "name": "standard-feature",
  "complexity": "STANDARD",
  "agents": {
    "planner": {
      "model": "sonnet",
      "systemPrompt": "Plan the implementation following our coding standards. Break work into logical commits."
    },
    "workers": [
      {
        "name": "backend",
        "model": "sonnet",
        "focus": "Backend implementation, API, database"
      },
      {
        "name": "frontend",
        "model": "sonnet", 
        "focus": "Frontend implementation, UI components"
      }
    ],
    "validators": [
      {
        "name": "requirements",
        "model": "sonnet",
        "prompt": "Verify all PRD requirements are met"
      },
      {
        "name": "code",
        "model": "sonnet",
        "prompt": "Review code quality, patterns, and best practices"
      }
    ]
  },
  "settings": {
    "maxIterations": 3,
    "testCommand": "npm test",
    "lintCommand": "npm run lint"
  }
}
```

### Configuration: `critical.json`

For security-critical features:

```json
{
  "name": "critical-security",
  "complexity": "CRITICAL",
  "agents": {
    "planner": {
      "model": "opus",
      "systemPrompt": "Plan security-critical implementation. Consider all attack vectors."
    },
    "workers": [
      {
        "name": "implementer",
        "model": "sonnet",
        "count": 2
      }
    ],
    "validators": [
      {
        "name": "requirements",
        "model": "sonnet"
      },
      {
        "name": "code",
        "model": "sonnet"
      },
      {
        "name": "security",
        "model": "opus",
        "prompt": "Check for OWASP Top 10 vulnerabilities, injection attacks, auth bypasses"
      },
      {
        "name": "tester",
        "model": "sonnet",
        "prompt": "Write and run comprehensive tests including edge cases"
      },
      {
        "name": "adversarial",
        "model": "sonnet",
        "prompt": "Try to break the implementation. Find edge cases and failure modes."
      }
    ]
  },
  "settings": {
    "maxIterations": 5,
    "requireAllValidators": true
  }
}
```

### Configuration: `api-only.json`

For backend-only work:

```json
{
  "name": "api-development",
  "complexity": "STANDARD",
  "agents": {
    "planner": {
      "model": "sonnet"
    },
    "workers": [
      {
        "name": "api-developer",
        "model": "sonnet",
        "count": 2,
        "focus": "API endpoints, services, database operations"
      }
    ],
    "validators": [
      {
        "name": "api-contract",
        "model": "sonnet",
        "prompt": "Verify API matches OpenAPI spec in API_SPEC.yaml"
      },
      {
        "name": "code",
        "model": "sonnet"
      }
    ]
  }
}
```

---

## Environment Setup

### Required Environment Variables

```bash
# Claude API (handled by claude auth)
# ANTHROPIC_API_KEY is set automatically

# GitHub (for PR creation)
export GITHUB_TOKEN="ghp_..."

# Optional: Custom model settings
export ZEROSHOT_MAX_MODEL="sonnet"  # Prevent opus usage
```

### Project-Level Configuration

Create `.zeroshot/config.json` in your repo root:

```json
{
  "defaultComplexity": "STANDARD",
  "testCommand": "npm test",
  "lintCommand": "npm run lint",
  "buildCommand": "npm run build",
  "prTemplate": ".github/PULL_REQUEST_TEMPLATE.md",
  "branchPrefix": "zeroshot/",
  "labels": ["ai-generated"],
  "reviewers": ["@username"]
}
```

---

## Docker Isolation

For isolated execution (recommended for untrusted or risky changes):

```bash
# Run in Docker container
zeroshot <issue> --docker

# With specific credential mounts
zeroshot settings set dockerMounts '["gh", "git", "ssh", "aws"]'
zeroshot <issue> --docker
```

### Docker Mounts Reference

| Mount | Purpose | Files Mounted |
|-------|---------|---------------|
| `gh` | GitHub CLI | `~/.config/gh` |
| `git` | Git config | `~/.gitconfig` |
| `ssh` | SSH keys | `~/.ssh` |
| `aws` | AWS credentials | `~/.aws` |
| `kube` | Kubernetes | `~/.kube` |

---

## Worktree Isolation

For lighter isolation using git worktrees:

```bash
# Auto-enabled with --pr
zeroshot <issue> --pr

# Explicit worktree
zeroshot <issue> --worktree
```

---

## Monitoring & Debugging

### Watch Execution

```bash
# View real-time logs
zeroshot logs <cluster-id>

# View all clusters
zeroshot list
```

### Resume Failed Runs

```bash
# Resume from last checkpoint
zeroshot resume <cluster-id>
```

### Export Results

```bash
# Export to markdown
zeroshot export <cluster-id> --format markdown

# View in database
sqlite3 ~/.zeroshot/cluster-<id>.db "SELECT * FROM messages;"
```

---

## Best Practices

### 1. Start Simple, Increase Complexity

```bash
# First attempt with SIMPLE
zeroshot <issue> --complexity simple

# If it fails, try STANDARD
zeroshot <issue> --complexity standard

# For persistent issues, use CRITICAL
zeroshot <issue> --complexity critical
```

### 2. Write Clear Issue Descriptions

Good issue format for zeroshot:

```markdown
## Summary
[One sentence describing what needs to be done]

## Requirements
- [ ] Requirement 1
- [ ] Requirement 2

## Acceptance Criteria
- [ ] Criterion 1
- [ ] Criterion 2

## Technical Notes
- Relevant file: `src/path/to/file.ts`
- Follow pattern in: `src/path/to/example.ts`
- API spec: See `docs/API_SPEC.yaml`

## Out of Scope
- [What NOT to do]
```

### 3. Link to Documentation

Reference your PRD/ARD in issues:

```markdown
## Context
- PRD: [link to PRD section]
- ARD: [link to ARD section]
- User Story: US-001
```

### 4. Use Appropriate Isolation

| Scenario | Isolation |
|----------|-----------|
| Trusted feature work | No isolation |
| PR review needed | `--worktree` or `--pr` |
| Risky/experimental | `--docker` |
| Full automation | `--ship` |

### 5. Review Before Merge

Even with `--ship`, set up required reviews:

```json
// .zeroshot/config.json
{
  "requireApproval": true,
  "reviewers": ["@tech-lead"]
}
```

---

## Troubleshooting

| Issue | Solution |
|-------|----------|
| `claude: command not found` | `npm i -g @anthropic-ai/claude-code && claude auth login` |
| `gh: command not found` | Install GitHub CLI: `brew install gh` |
| Cluster stuck | `zeroshot resume <id>` |
| Agent keeps failing | Check `zeroshot logs <id>`, clarify requirements |
| Rate limited | Wait or reduce parallel workers |

---

## Related Documents

- [BEADS_TASKS.md](./BEADS_TASKS.md)
- [ARD.md](../4-architecture/ARD.md)
- [Zeroshot Documentation](https://github.com/covibes/zeroshot)

---

**Next Step**: Create your task beads and begin execution!

