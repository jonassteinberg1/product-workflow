# Evolution Tracker

This directory tracks the evolution of each product-workflow phase as we build real products. The purpose is to:

1. **Document what actually happened** when building each phase
2. **Extract patterns** that can improve the base templates
3. **Provide guidance** for future products using this workflow

---

## How to Use

When you complete a phase (discovery, definition, design, etc.) for a product:

1. Create a file: `{phase}-evolution.md`
2. Document the high-level steps taken
3. Note what worked, what didn't, what was missing from templates
4. Identify generalizable patterns

---

## Evolution Documents

| Phase | Document | Status |
|-------|----------|--------|
| 1-Discovery | [1-discovery-evolution.md](./1-discovery-evolution.md) | ✅ Complete |
| 2-Definition | - | Pending |
| 3-Design | - | Pending |
| 4-Architecture | - | Pending |
| 5-Execution | - | Pending |
| 6-Release | - | Pending |

---

## Feedback Loop

After building 2-3 products:

1. Review all evolution docs
2. Identify common patterns across products
3. Update base templates in `/templates/`
4. Update scaffold.sh to include new automation
5. This directory becomes the "lessons learned" archive
