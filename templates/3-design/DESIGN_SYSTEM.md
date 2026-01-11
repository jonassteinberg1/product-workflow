# Design System: [Product Name]

> **Status**: Draft | In Review | Approved  
> **Designer**: [name]  
> **Date**: [YYYY-MM-DD]

---

## Overview

This document defines the design system for [Product Name], including colors, typography, spacing, and component specifications.

**Design Tool**: [Link to Figma/Sketch design system file]

---

## Design Principles

1. **[Principle 1]**: [Description - e.g., "Clarity over cleverness"]
2. **[Principle 2]**: [Description - e.g., "Consistent but not uniform"]
3. **[Principle 3]**: [Description - e.g., "Accessible by default"]
4. **[Principle 4]**: [Description - e.g., "Progressive disclosure"]

---

## Color Palette

### Primary Colors

| Name | Hex | RGB | Usage |
|------|-----|-----|-------|
| Primary | `#[hex]` | rgb(r, g, b) | Primary actions, links |
| Primary Light | `#[hex]` | rgb(r, g, b) | Hover states, backgrounds |
| Primary Dark | `#[hex]` | rgb(r, g, b) | Active states, text on light |

### Secondary Colors

| Name | Hex | RGB | Usage |
|------|-----|-----|-------|
| Secondary | `#[hex]` | rgb(r, g, b) | Secondary actions |
| Secondary Light | `#[hex]` | rgb(r, g, b) | Backgrounds |
| Secondary Dark | `#[hex]` | rgb(r, g, b) | Text |

### Neutral Colors

| Name | Hex | RGB | Usage |
|------|-----|-----|-------|
| Gray 900 | `#[hex]` | rgb(r, g, b) | Primary text |
| Gray 700 | `#[hex]` | rgb(r, g, b) | Secondary text |
| Gray 500 | `#[hex]` | rgb(r, g, b) | Placeholder text |
| Gray 300 | `#[hex]` | rgb(r, g, b) | Borders |
| Gray 100 | `#[hex]` | rgb(r, g, b) | Backgrounds |
| White | `#FFFFFF` | rgb(255, 255, 255) | Surface |

### Semantic Colors

| Name | Hex | Usage |
|------|-----|-------|
| Success | `#[hex]` | Success states, positive actions |
| Warning | `#[hex]` | Warning states, caution |
| Error | `#[hex]` | Error states, destructive actions |
| Info | `#[hex]` | Informational states |

### Dark Mode (if applicable)

| Light Mode | Dark Mode | Usage |
|------------|-----------|-------|
| `#[hex]` | `#[hex]` | Background |
| `#[hex]` | `#[hex]` | Surface |
| `#[hex]` | `#[hex]` | Primary text |
| `#[hex]` | `#[hex]` | Secondary text |

---

## Typography

### Font Family

| Type | Font | Fallback |
|------|------|----------|
| Primary | [Font name] | system-ui, sans-serif |
| Monospace | [Font name] | ui-monospace, monospace |

### Type Scale

| Name | Size | Line Height | Weight | Usage |
|------|------|-------------|--------|-------|
| Display | 48px / 3rem | 1.1 | 700 | Hero headlines |
| H1 | 36px / 2.25rem | 1.2 | 700 | Page titles |
| H2 | 28px / 1.75rem | 1.3 | 600 | Section headers |
| H3 | 22px / 1.375rem | 1.4 | 600 | Subsection headers |
| H4 | 18px / 1.125rem | 1.4 | 600 | Card headers |
| Body Large | 18px / 1.125rem | 1.6 | 400 | Intro paragraphs |
| Body | 16px / 1rem | 1.5 | 400 | Default body text |
| Body Small | 14px / 0.875rem | 1.5 | 400 | Secondary text |
| Caption | 12px / 0.75rem | 1.4 | 400 | Labels, captions |
| Overline | 12px / 0.75rem | 1.4 | 600 | Category labels |

### Font Weights

| Name | Weight | Usage |
|------|--------|-------|
| Regular | 400 | Body text |
| Medium | 500 | Emphasis |
| Semibold | 600 | Headings, buttons |
| Bold | 700 | Strong emphasis |

---

## Spacing

### Spacing Scale

| Token | Value | Usage |
|-------|-------|-------|
| `space-1` | 4px | Tight spacing |
| `space-2` | 8px | Default small |
| `space-3` | 12px | Medium small |
| `space-4` | 16px | Default |
| `space-5` | 20px | Medium |
| `space-6` | 24px | Default large |
| `space-8` | 32px | Large |
| `space-10` | 40px | Section gaps |
| `space-12` | 48px | Large sections |
| `space-16` | 64px | Page sections |

### Layout

| Property | Value |
|----------|-------|
| Max content width | 1200px |
| Sidebar width | 240px |
| Sidebar collapsed | 64px |
| Header height | 64px |
| Mobile breakpoint | 768px |
| Tablet breakpoint | 1024px |

---

## Border Radius

| Token | Value | Usage |
|-------|-------|-------|
| `radius-sm` | 4px | Small elements, tags |
| `radius-md` | 8px | Buttons, inputs |
| `radius-lg` | 12px | Cards, modals |
| `radius-xl` | 16px | Large containers |
| `radius-full` | 9999px | Pills, avatars |

---

## Shadows

| Token | Value | Usage |
|-------|-------|-------|
| `shadow-sm` | `0 1px 2px rgba(0,0,0,0.05)` | Subtle lift |
| `shadow-md` | `0 4px 6px rgba(0,0,0,0.1)` | Cards |
| `shadow-lg` | `0 10px 15px rgba(0,0,0,0.1)` | Dropdowns |
| `shadow-xl` | `0 20px 25px rgba(0,0,0,0.15)` | Modals |

---

## Components

### Buttons

#### Primary Button
```
┌─────────────────┐
│   Button Text   │  Background: Primary
└─────────────────┘  Text: White
                     Padding: 12px 24px
                     Radius: radius-md
```

**States**:
| State | Background | Text | Border |
|-------|------------|------|--------|
| Default | Primary | White | None |
| Hover | Primary Dark | White | None |
| Active | Primary Dark | White | None |
| Disabled | Gray 300 | Gray 500 | None |
| Loading | Primary (50%) | Spinner | None |

#### Secondary Button
```
┌─────────────────┐
│   Button Text   │  Background: Transparent
└─────────────────┘  Text: Primary
                     Border: 1px Primary
```

#### Ghost Button
```
┌─────────────────┐
│   Button Text   │  Background: Transparent
└─────────────────┘  Text: Gray 700
                     Border: None
```

#### Destructive Button
```
┌─────────────────┐
│     Delete      │  Background: Error
└─────────────────┘  Text: White
```

#### Button Sizes
| Size | Height | Padding | Font Size |
|------|--------|---------|-----------|
| Small | 32px | 8px 16px | 14px |
| Medium | 40px | 12px 24px | 16px |
| Large | 48px | 16px 32px | 18px |

---

### Form Elements

#### Text Input
```
┌─────────────────────────────────────┐
│ Placeholder text                    │
└─────────────────────────────────────┘
Height: 40px
Border: 1px Gray 300
Radius: radius-md
Padding: 12px
```

**States**:
| State | Border | Background | Label |
|-------|--------|------------|-------|
| Default | Gray 300 | White | Gray 700 |
| Focus | Primary | White | Primary |
| Error | Error | Error/5% | Error |
| Disabled | Gray 200 | Gray 100 | Gray 400 |

#### Select/Dropdown
```
┌─────────────────────────────────────┐
│ Selected option                   ▼ │
└─────────────────────────────────────┘
```

#### Checkbox
```
☐ Unchecked label
☑ Checked label
```

#### Radio Button
```
○ Unselected option
● Selected option
```

#### Toggle/Switch
```
[○────] Off
[────●] On
```

---

### Cards

```
┌─────────────────────────────────┐
│                                 │
│  Card Title                     │
│                                 │
│  Card content goes here with   │
│  supporting text.               │
│                                 │
│  [Action]           [Action]    │
│                                 │
└─────────────────────────────────┘

Background: White
Border: 1px Gray 200
Radius: radius-lg
Shadow: shadow-md
Padding: space-6
```

---

### Tables

```
┌────────┬────────┬────────┬────────┐
│ Header │ Header │ Header │ Header │  Header: Gray 50 bg, Semibold
├────────┼────────┼────────┼────────┤
│ Cell   │ Cell   │ Cell   │ Cell   │  Row: White bg
├────────┼────────┼────────┼────────┤
│ Cell   │ Cell   │ Cell   │ Cell   │  Alt row: Gray 50 bg (optional)
└────────┴────────┴────────┴────────┘
```

---

### Modals

```
┌──────────────────────────────────────┐
│  Modal Title                    [×]  │
├──────────────────────────────────────┤
│                                      │
│  Modal content                       │
│                                      │
├──────────────────────────────────────┤
│                  [Cancel] [Confirm]  │
└──────────────────────────────────────┘

Overlay: Black 50%
Background: White
Radius: radius-lg
Shadow: shadow-xl
Max width: 500px (sm), 700px (md), 900px (lg)
```

---

### Navigation

#### Sidebar Item
```
┌──────────────────────┐
│  [Icon]  Label       │
└──────────────────────┘

Default: Transparent bg, Gray 700 text
Hover: Gray 100 bg
Active: Primary/10% bg, Primary text
```

#### Tab Navigation
```
┌────────┬────────┬────────┐
│ Tab 1  │ Tab 2  │ Tab 3  │
└────────┴────────┴────────┘

Active: Primary border-bottom, Primary text
Inactive: No border, Gray 500 text
```

---

### Alerts/Notifications

```
┌──────────────────────────────────────┐
│ [Icon]  Alert message text      [×]  │
└──────────────────────────────────────┘

Success: Success bg/10%, Success text
Warning: Warning bg/10%, Warning text
Error: Error bg/10%, Error text
Info: Info bg/10%, Info text
```

---

### Badges/Tags

```
┌─────────┐
│  Label  │
└─────────┘

Padding: 4px 8px
Radius: radius-sm or radius-full
Font: Caption size
```

---

## Icons

### Icon Library
- Primary: [Lucide Icons / Heroicons / etc.]
- Size: 16px (small), 20px (default), 24px (large)
- Stroke: 1.5px - 2px

### Common Icons

| Action | Icon | Usage |
|--------|------|-------|
| Add | `plus` | Create new items |
| Edit | `pencil` | Edit actions |
| Delete | `trash` | Delete actions |
| Search | `search` | Search functionality |
| Settings | `cog` | Settings/config |
| User | `user` | Profile/account |
| Close | `x` | Close/dismiss |
| Menu | `menu` | Mobile menu |
| Check | `check` | Success/complete |
| Warning | `alert-triangle` | Warnings |
| Error | `x-circle` | Errors |
| Info | `info` | Information |

---

## Animation & Motion

### Timing
| Token | Duration | Easing | Usage |
|-------|----------|--------|-------|
| `fast` | 100ms | ease-out | Micro-interactions |
| `normal` | 200ms | ease-in-out | Default transitions |
| `slow` | 300ms | ease-in-out | Complex animations |
| `slower` | 500ms | ease-in-out | Page transitions |

### Common Animations
- **Fade**: Opacity 0 → 1
- **Slide**: Transform translateY(10px) → 0
- **Scale**: Transform scale(0.95) → 1
- **Spin**: Rotate 360deg (loading)

---

## Accessibility

### Color Contrast
- Normal text: 4.5:1 minimum
- Large text: 3:1 minimum
- UI components: 3:1 minimum

### Focus States
- All interactive elements must have visible focus
- Focus ring: 2px solid Primary, 2px offset

### Touch Targets
- Minimum size: 44px × 44px
- Minimum spacing: 8px

---

## CSS Variables Reference

```css
:root {
  /* Colors */
  --color-primary: #[hex];
  --color-primary-light: #[hex];
  --color-primary-dark: #[hex];
  --color-secondary: #[hex];
  --color-success: #[hex];
  --color-warning: #[hex];
  --color-error: #[hex];
  --color-info: #[hex];
  
  /* Neutrals */
  --color-gray-900: #[hex];
  --color-gray-700: #[hex];
  --color-gray-500: #[hex];
  --color-gray-300: #[hex];
  --color-gray-100: #[hex];
  
  /* Typography */
  --font-family: '[Font]', system-ui, sans-serif;
  --font-mono: '[Font]', ui-monospace, monospace;
  
  /* Spacing */
  --space-1: 4px;
  --space-2: 8px;
  --space-4: 16px;
  --space-6: 24px;
  --space-8: 32px;
  
  /* Radius */
  --radius-sm: 4px;
  --radius-md: 8px;
  --radius-lg: 12px;
  
  /* Shadows */
  --shadow-sm: 0 1px 2px rgba(0,0,0,0.05);
  --shadow-md: 0 4px 6px rgba(0,0,0,0.1);
  --shadow-lg: 0 10px 15px rgba(0,0,0,0.1);
}
```

---

## Related Documents

- [INFORMATION_ARCHITECTURE.md](./INFORMATION_ARCHITECTURE.md)
- [WIREFRAMES.md](./WIREFRAMES.md)
- [ARD.md](../4-architecture/ARD.md)

---

**Next Step**: Proceed to [Architecture phase](../4-architecture/)

