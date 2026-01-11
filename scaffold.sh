#!/bin/bash

# Product Workflow Scaffold Script
# Usage: ./scaffold.sh <project-name> <target-directory>
#
# This script copies all workflow templates into a new project
# and replaces placeholders with the project name.

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Get script directory (where templates live)
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TEMPLATES_DIR="$SCRIPT_DIR/templates"

# Functions
print_usage() {
    echo "Usage: $0 <project-name> <target-directory>"
    echo ""
    echo "Arguments:"
    echo "  project-name      Name of your product (used in template placeholders)"
    echo "  target-directory  Directory where the project will be created/scaffolded"
    echo ""
    echo "Examples:"
    echo "  $0 \"My Awesome App\" ./my-awesome-app"
    echo "  $0 \"TaskFlow\" /Users/me/projects/taskflow"
    echo ""
}

print_step() {
    echo -e "${BLUE}==>${NC} $1"
}

print_success() {
    echo -e "${GREEN}✓${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}!${NC} $1"
}

print_error() {
    echo -e "${RED}✗${NC} $1"
}

# Validate arguments
if [ $# -lt 2 ]; then
    print_error "Missing required arguments"
    echo ""
    print_usage
    exit 1
fi

PROJECT_NAME="$1"
TARGET_DIR="$2"

# Validate templates exist
if [ ! -d "$TEMPLATES_DIR" ]; then
    print_error "Templates directory not found: $TEMPLATES_DIR"
    exit 1
fi

# Create target directory if it doesn't exist
print_step "Creating target directory: $TARGET_DIR"
mkdir -p "$TARGET_DIR"

# Create docs directory structure
DOCS_DIR="$TARGET_DIR/docs"
print_step "Creating documentation structure in $DOCS_DIR"

mkdir -p "$DOCS_DIR/1-discovery"
mkdir -p "$DOCS_DIR/2-definition"
mkdir -p "$DOCS_DIR/3-design"
mkdir -p "$DOCS_DIR/4-architecture"
mkdir -p "$DOCS_DIR/5-execution"
mkdir -p "$DOCS_DIR/6-release"

# Copy templates
print_step "Copying templates..."

# Discovery phase
cp "$TEMPLATES_DIR/1-discovery/PROBLEM_STATEMENT.md" "$DOCS_DIR/1-discovery/"
cp "$TEMPLATES_DIR/1-discovery/USER_RESEARCH.md" "$DOCS_DIR/1-discovery/"
cp "$TEMPLATES_DIR/1-discovery/COMPETITIVE_ANALYSIS.md" "$DOCS_DIR/1-discovery/"
print_success "Discovery templates copied"

# Definition phase
cp "$TEMPLATES_DIR/2-definition/PRD.md" "$DOCS_DIR/2-definition/"
cp "$TEMPLATES_DIR/2-definition/USER_STORIES.md" "$DOCS_DIR/2-definition/"
print_success "Definition templates copied"

# Design phase
cp "$TEMPLATES_DIR/3-design/INFORMATION_ARCHITECTURE.md" "$DOCS_DIR/3-design/"
cp "$TEMPLATES_DIR/3-design/WIREFRAMES.md" "$DOCS_DIR/3-design/"
cp "$TEMPLATES_DIR/3-design/DESIGN_SYSTEM.md" "$DOCS_DIR/3-design/"
print_success "Design templates copied"

# Architecture phase
cp "$TEMPLATES_DIR/4-architecture/ARD.md" "$DOCS_DIR/4-architecture/"
cp "$TEMPLATES_DIR/4-architecture/TECH_DESIGN.md" "$DOCS_DIR/4-architecture/"
cp "$TEMPLATES_DIR/4-architecture/API_SPEC.yaml" "$DOCS_DIR/4-architecture/"
print_success "Architecture templates copied"

# Execution phase
cp "$TEMPLATES_DIR/5-execution/BEADS_TASKS.md" "$DOCS_DIR/5-execution/"
cp "$TEMPLATES_DIR/5-execution/ZEROSHOT_CONFIG.md" "$DOCS_DIR/5-execution/"
print_success "Execution templates copied"

# Release phase
cp "$TEMPLATES_DIR/6-release/RELEASE_CHECKLIST.md" "$DOCS_DIR/6-release/"
cp "$TEMPLATES_DIR/6-release/LAUNCH_PLAN.md" "$DOCS_DIR/6-release/"
print_success "Release templates copied"

# Replace placeholders with project name
print_step "Customizing templates with project name: $PROJECT_NAME"

# Use different sed syntax for macOS vs Linux
if [[ "$OSTYPE" == "darwin"* ]]; then
    # macOS
    find "$DOCS_DIR" -type f -name "*.md" -exec sed -i '' "s/\[Product Name\]/$PROJECT_NAME/g" {} \;
    find "$DOCS_DIR" -type f -name "*.yaml" -exec sed -i '' "s/\[Product Name\]/$PROJECT_NAME/g" {} \;
else
    # Linux
    find "$DOCS_DIR" -type f -name "*.md" -exec sed -i "s/\[Product Name\]/$PROJECT_NAME/g" {} \;
    find "$DOCS_DIR" -type f -name "*.yaml" -exec sed -i "s/\[Product Name\]/$PROJECT_NAME/g" {} \;
fi

print_success "Placeholders replaced"

# Create a project-level README
print_step "Creating project documentation index..."

cat > "$DOCS_DIR/README.md" << EOF
# $PROJECT_NAME - Product Documentation

This folder contains all product documentation following the problem-to-product workflow.

## Workflow Phases

| Phase | Status | Documents |
|-------|--------|-----------|
| 1. Discovery | ⬜ Not Started | [Problem Statement](1-discovery/PROBLEM_STATEMENT.md), [User Research](1-discovery/USER_RESEARCH.md), [Competitive Analysis](1-discovery/COMPETITIVE_ANALYSIS.md) |
| 2. Definition | ⬜ Not Started | [PRD](2-definition/PRD.md), [User Stories](2-definition/USER_STORIES.md) |
| 3. Design | ⬜ Not Started | [Information Architecture](3-design/INFORMATION_ARCHITECTURE.md), [Wireframes](3-design/WIREFRAMES.md), [Design System](3-design/DESIGN_SYSTEM.md) |
| 4. Architecture | ⬜ Not Started | [ARD](4-architecture/ARD.md), [Tech Design](4-architecture/TECH_DESIGN.md), [API Spec](4-architecture/API_SPEC.yaml) |
| 5. Execution | ⬜ Not Started | [Beads Tasks](5-execution/BEADS_TASKS.md), [Zeroshot Config](5-execution/ZEROSHOT_CONFIG.md) |
| 6. Release | ⬜ Not Started | [Release Checklist](6-release/RELEASE_CHECKLIST.md), [Launch Plan](6-release/LAUNCH_PLAN.md) |

## Getting Started

1. **Start with Discovery**: Fill out the [Problem Statement](1-discovery/PROBLEM_STATEMENT.md)
2. **Define Requirements**: Create the [PRD](2-definition/PRD.md) and [User Stories](2-definition/USER_STORIES.md)
3. **Design the Solution**: Document [Information Architecture](3-design/INFORMATION_ARCHITECTURE.md) and create [Wireframes](3-design/WIREFRAMES.md)
4. **Plan the Architecture**: Write the [ARD](4-architecture/ARD.md) and [Technical Design](4-architecture/TECH_DESIGN.md)
5. **Execute with AI**: Generate tasks using [Beads](5-execution/BEADS_TASKS.md) and run with [Zeroshot](5-execution/ZEROSHOT_CONFIG.md)
6. **Launch**: Follow the [Release Checklist](6-release/RELEASE_CHECKLIST.md) and [Launch Plan](6-release/LAUNCH_PLAN.md)

## Phase Gates

Before proceeding to the next phase, ensure:

- **Discovery → Definition**: Problem validated, success metrics defined
- **Definition → Design**: PRD approved, user stories complete
- **Design → Architecture**: Wireframes reviewed, design system defined
- **Architecture → Execution**: ARD approved, tasks generated
- **Execution → Release**: All tasks complete, tests passing

---

*Generated by [product-workflow](https://github.com/jonassteinberg1/product-workflow)*
EOF

print_success "Documentation index created"

# Create .gitkeep files for empty directories (in case user wants to add assets)
mkdir -p "$DOCS_DIR/assets"
touch "$DOCS_DIR/assets/.gitkeep"

# Summary
echo ""
echo -e "${GREEN}========================================${NC}"
echo -e "${GREEN}  Scaffold Complete!${NC}"
echo -e "${GREEN}========================================${NC}"
echo ""
echo "Project: $PROJECT_NAME"
echo "Location: $TARGET_DIR/docs"
echo ""
echo "Next steps:"
echo "  1. cd $TARGET_DIR"
echo "  2. Open docs/1-discovery/PROBLEM_STATEMENT.md"
echo "  3. Start documenting your problem!"
echo ""
echo "Documentation structure:"
echo "  docs/"
echo "  ├── 1-discovery/"
echo "  │   ├── PROBLEM_STATEMENT.md"
echo "  │   ├── USER_RESEARCH.md"
echo "  │   └── COMPETITIVE_ANALYSIS.md"
echo "  ├── 2-definition/"
echo "  │   ├── PRD.md"
echo "  │   └── USER_STORIES.md"
echo "  ├── 3-design/"
echo "  │   ├── INFORMATION_ARCHITECTURE.md"
echo "  │   ├── WIREFRAMES.md"
echo "  │   └── DESIGN_SYSTEM.md"
echo "  ├── 4-architecture/"
echo "  │   ├── ARD.md"
echo "  │   ├── TECH_DESIGN.md"
echo "  │   └── API_SPEC.yaml"
echo "  ├── 5-execution/"
echo "  │   ├── BEADS_TASKS.md"
echo "  │   └── ZEROSHOT_CONFIG.md"
echo "  └── 6-release/"
echo "      ├── RELEASE_CHECKLIST.md"
echo "      └── LAUNCH_PLAN.md"
echo ""

