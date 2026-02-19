# AIVO Design System Documentation

**Analysis Date**: February 2025
**Version**: 1.0
**App Name**: AIVO E-Commerce
**Framework**: Flutter

---

## 1. COLOR PALETTE

### Primary Brand Color

| Color | Hex Value | RGB | Usage |
|-------|-----------|-----|-------|
| Primary Purple | `#7B61FF` | (123, 97, 255) | Buttons, active states, UI accents |
| Primary Dark | `#6C56DD` | - | Shade 900 of primary material |

**Primary Material Color Palette** (50-900 shades):
- 50: `#EFECFF` (Lightest)
- 100: `#D7D0FF`
- 200: `#BDBOFF`
- 300: `#A390FF`
- 400: `#8F79FF`
- 500: `#7B61FF` (Base)
- 600: `#7359FF`
- 700: `#684FFF`
- 800: `#5E45FF`
- 900: `#6C56DD` (Darkest)

### Neutral Scale - Black/Dark Colors

| Color Name | Hex Value | Opacity | Primary Usage |
|----------|-----------|---------|-----------------|
| `blackColor` | `#16161E` | 100% | Primary text, main UI elements |
| `blackColor80` | `#45454B` | 80% | Secondary text, icons |
| `blackColor60` | `#737378` | 60% | Tertiary text, disabled states |
| `blackColor40` | `#A2A2A5` | 40% | Hint text, metadata, secondary labels |
| `blackColor20` | `#D0D0D2` | 20% | Dividers, borders, subtle lines |
| `blackColor10` | `#E8E8E9` | 10% | Button borders, light backgrounds |
| `blackColor5` | `#F3F3F4` | 5% | Very light backgrounds, subtle fills |

### Neutral Scale - White Colors

| Color Name | Hex Value | Opacity | Primary Usage |
|----------|-----------|---------|-----------------|
| `whiteColor` | `#FFFFFF` | 100% | Pure white backgrounds |
| `whileColor80` | `#CCCCCC` | 80% | Light elements |
| `whileColor60` | `#999999` | 60% | Medium elements |
| `whileColor40` | `#666666` | 40% | Form labels (dark mode) |
| `whileColor20` | `#333333` | 20% | Semi-dark elements |
| `whileColor10` | `#191919` | 10% | Very dark elements |
| `whileColor5` | `#0D0D0D` | 5% | Almost black |

### Semantic Colors

| Color Name | Hex Value | Usage |
|----------|-----------|-------|
| Success (Green) | `#2ED573` | Checkmarks, positive actions, success states |
| Warning (Orange) | `#FFB E21` | Progress indicators, star ratings, discount badges |
| Error (Red) | `#EA5B5B` | Error states, price discounts, alerts |
| Accent (Cyan) | `#31B0D8` | Product pricing in cards |

### Functional Gray Colors

| Color Name | Hex Value | Usage |
|----------|-----------|-------|
| `greyColor` | `#B8B5C3` | Hint text, secondary elements, placeholders |
| `lightGreyColor` | `#F8F8F9` | Input field background (light mode) |
| `darkGreyColor` | `#1C1C25` | Input field background (dark mode) |

---

## 2. TYPOGRAPHY

### Font Families

| Font Name | Family | Files | Primary Usage |
|-----------|--------|-------|-----------------|
| Plus Jakarta | "Plus Jakarta" | .otf (Regular, Medium, Bold) | Body text, UI labels, standard text |
| Grandis Extended | "Grandis Extended" | .ttf (Regular, Thin, Medium, Bold, Black) | Banner discounts, large headings, special CTAs |

**Plus Jakarta Weights Available:**
- Regular (400)
- Medium (500)
- Bold (700)

**Grandis Extended Weights Available:**
- Thin (300)
- Regular (400)
- Medium (500)
- Bold (700)
- Black (900)

### Text Styles Definition

| Style Name | Font Size | Weight | Color | Line Height | Usage |
|-----------|----------|--------|-------|-------------|-------|
| bodyMedium | system default | regular | `blackColor40` | - | Secondary text, metadata |
| titleSmall | 12px | regular | default | - | Product brand names, captions |
| headlineSmall | default | w500 | - | - | Rating numbers |
| titleMedium | default | - | - | - | Secondary headings |
| labelSmall | default | - | - | - | Small labels, footnotes |

### Font Sizes Used Across App

| Size | Weight | Font | Primary Usage |
|------|--------|------|-----------------|
| 10px | regular | Plus Jakarta | Discount tag text, brand names, secondary labels |
| 12px | regular | Plus Jakarta | Product titles, prices, category buttons, input labels |
| 14px | regular | Plus Jakarta | ListTile text, standard body |
| 16px | w500 | Plus Jakarta | AppBar title, card headings |
| 18px | - | Plus Jakarta | Section headings |
| 28px | w900 | Grandis Extended | Banner promotional text |
| 31px | w900 | Grandis Extended | Large banner text |
| 60px | bold | Grandis Extended | Huge discount percentage in banners |

**Font Size Height Multiplier:**
- Standard: 1.0 (line height = font size)
- Input labels: 1.0

---

## 3. SPACING SYSTEM

### Base Unit

**Primary Spacing Unit**: `defaultPadding = 16.0` logical pixels (dp)

All spacing in the app is derived from this single unit for consistency.

### Standard Spacing Values

| Value | Size (dp) | Base Unit | Primary Usage |
|-------|----------|-----------|-----------------|
| Smallest | 2.0 | `defaultPadding / 8` | Micro-adjustments, rare |
| Extra Small | 4.0 | `defaultPadding / 4` | Minimal gaps |
| Small | 8.0 | `defaultPadding / 2` | Between adjacent elements, card internal padding |
| Standard | 16.0 | `defaultPadding` | Main spacing unit, container padding |
| Medium | 24.0 | `defaultPadding * 1.5` | Section spacing, vertical gaps |
| Large | 32.0 | `defaultPadding * 2` | Large section breaks |

### Padding Applications

| Component | Horizontal | Vertical | Usage |
|-----------|-----------|----------|-------|
| Container/Card | 16.0 | 16.0 | Standard padding all sides |
| Section wrapper | 16.0 | 8.0 | Symmetric padding for content sections |
| SliverPadding (vertical) | - | 24.0 | Space between major sections |
| Product card internal | 8.0 | 8.0 | Small spacing within product cards |
| Input field | 12.0 (internal) | 12.0 | Padding inside form inputs |
| Modal bottom sheet | 16.0 | 16.0 | Content padding inside modals |

### Gaps Between Elements

| Gap Size | Value (dp) | Usage |
|----------|-----------|-------|
| Minimal gap | 4.0 | Between label and input |
| Small gap | 8.0 | Between form fields, list items |
| Standard gap | 16.0 | Between sections, main spacing |
| Large gap | 24.0-32.0 | Between major content sections |

---

## 4. BORDER RADIUS

### Primary Border Radius

| Radius Name | Value (dp) | Ratio to Base | Primary Usage |
|-----------|-----------|---------------|-----------------|
| Default | 12.0 | 1x | Input fields, buttons, cards, image containers |
| Small | 6.0 | 0.5x | Checkboxes, smaller components |
| Large | 24.0 | 2x | Modal bottom sheets (top corners), large containers |
| Circular | 30.0+ | flexible | Category chips, circular buttons, pill shapes |

### Specific Border Radius Applications

| Component | Border Radius | Details |
|-----------|---------------|---------|
| Input fields (all states) | 12.0 | All corners, applied to OutlineInputBorder |
| Elevated buttons | 12.0 | Full width action buttons |
| Outlined buttons | 12.0 | Alternative buttons |
| Product cards | 12.0 | Grid/list product cards |
| Image containers | 12.0 | NetworkImageWithLoader default |
| Container cards | 12.0 | Standard card containers |
| Review cards | 12.0 | Review display cards |
| Discount tag | 12.0 | Discount badge on product cards |
| Checkbox | 6.0 | Half of default radius |
| Modal bottom sheet | 24.0 (top only) | Top corners, 2x default radius |
| Banner containers | 0.0 | Full-bleed banner images |
| Category button | 30.0+ | Pill-shaped for category pills |
| Skeleton placeholders | 16.0 | Loading placeholders |

---

## 5. BUTTON STYLES

### Elevated Button Theme

**Styling:**
- **Padding**: 16.0 all sides (EdgeInsets.all(16.0))
- **Background Color**: `primaryColor` (#7B61FF)
- **Foreground Color**: White
- **Minimum Size**: width: double.infinity, height: 32.0
- **Border Radius**: 12.0
- **Shape**: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0))
- **Elevation**: 0 (flat)
- **Text Color**: White
- **Font Size**: Default (12-14px by context)

**Usage Context:**
- Primary action buttons
- Form submission buttons
- Call-to-action buttons
- "Continue", "Next", "Add to Cart" type buttons

### Outlined Button Theme

**Styling:**
- **Padding**: 8.0-16.0 (context dependent)
- **Border Width**: 1.5
- **Border Color**: Configurable (`blackColor10` default)
- **Minimum Size**: width: double.infinity, height: 32.0
- **Border Radius**: 12.0
- **Shape**: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0))
- **Elevation**: 0
- **Background**: Transparent
- **Text Color**: Primary color or black

**Usage Context:**
- Secondary action buttons
- Alternative options
- Product card buttons
- Less prominent actions

**Product Card Button Variant:**
- Size: 140x220 (fixed)
- Padding: 8.0
- Full-height, full-width OutlinedButton within card

### Text Button Theme

**Styling:**
- **Foreground Color**: `primaryColor` (#7B61FF)
- **Padding**: Default
- **Background**: Transparent
- **Elevation**: 0

**Usage Context:**
- Dialog actions
- Links styled as buttons
- Lightweight actions

### Specialized Buttons

**Category Button (Custom):**
- **Height**: 36.0
- **Padding**: Horizontal 16.0, Vertical auto-centered
- **Active State**: Primary background with white text
- **Inactive State**: Transparent background with border (`dividerColor`), dark text
- **Border Radius**: Varies (circular: 30.0+)
- **Font Size**: 12.0

**Circular Action Button (Banner):**
- **Size**: 48x48 (fixed)
- **Background**: White
- **Shape**: Circle (BorderRadius.circular(30.0))
- **Icon**: Black icon inside
- **Usage**: Floating action in banners (promotions)

**OutlinedActiveButton (Toggle Button):**
- **Default State**: Outlined style (border, transparent background)
- **Active State**: Filled with primary color background, white text
- **Toggle Behavior**: Can switch between states
- **Border Radius**: 12.0

---

## 6. INPUT FIELD STYLING

### Light Mode Input Decoration

**Base Properties:**
- **Fill Color**: `lightGreyColor` (#F8F8F9)
- **Filled**: true
- **Hint Style Color**: `greyColor` (#B8B5C3)
- **Border Type**: OutlineInputBorder
- **Border Radius**: 12.0
- **Border Color (default)**: Transparent
- **Content Padding**: 12.0 (EdgeInsets.all(12.0))

**Focused State:**
- **Border**: OutlineInputBorder
- **Border Color**: `primaryColor` (#7B61FF)
- **Border Radius**: 12.0
- **Border Width**: 2.0 (implied by focus)

**Error State:**
- **Border**: OutlineInputBorder
- **Border Color**: `errorColor` (#EA5B5B)
- **Border Radius**: 12.0

**Label Style:**
- **Font Size**: 12.0
- **Line Height**: 1.0
- **Color**: blackColor (or custom)

### Dark Mode Input Decoration

**Base Properties:**
- **Fill Color**: `darkGreyColor` (#1C1C25)
- **Filled**: true
- **Hint Style Color**: `whileColor40` (#666666)
- **Border Type**: OutlineInputBorder
- **Border Radius**: 12.0
- **Border Color (default)**: Transparent
- **Content Padding**: 12.0

**Focused/Error States:** Same as light mode

### CVV Field Variant

**Special Properties:**
- **Prefix Icon**: SVG icon (credit card)
- **Max Length**: 4 characters
- **Input Formatter**: FilteringTextInputFormatter.digitsOnly
- **Hint Text**: "CVV"
- **Keyboard Type**: Number
- **All other properties**: Same as standard field

---

## 7. CARD & CONTAINER STYLING

### Standard Card Container

**Properties:**
- **Padding**: 16.0 all sides
- **Border**: None (uses fill color instead)
- **Border Radius**: 12.0
- **Background Color**: Theme-dependent (white in light, dark grey in dark)
- **Box Shadow**: Custom per component (see below)
- **Elevation**: 0 (flat design)

### Review Card

**Properties:**
- **Padding**: 16.0 all sides
- **Background**: Theme text color with 0.035 opacity
- **Border Radius**: 12.0
- **Layout**: Row with Expanded children (rating info + breakdown)
- **Full Width**: true

### Product Card (Grid Style)

**Properties:**
- **Fixed Size**: 140 x 220 logical pixels
- **Internal Padding**: 8.0
- **Border Radius**: 12.0 (OutlinedButton shape)
- **Image Aspect Ratio**: 1.15 (landscape-ish)
- **Layout**:
  ```
  Column:
    - Image container (AspectRatio 1.15)
      - NetworkImageWithLoader
      - Discount tag (optional, positioned)
    - Text info (Padding 8.0)
      - Brand name (10px)
      - Product title (12px)
      - Price display
  ```
- **Button Type**: OutlinedButton

### Product Card (List/Secondary Style)

**Properties:**
- **Fixed Size**: 256 x 114 logical pixels
- **Internal Padding**: 8.0
- **Border Radius**: 12.0
- **Layout**: Row (image left, info right)
- **Image Width**: ~100px
- **Info Section**: Expanded right side
- **Button Type**: OutlinedButton

### Banner Containers

**BannerS (Small):**
- **Aspect Ratio**: 2.56
- **Image Overlay**: Colors.black45 (semi-transparent dark)
- **Content**: Centered or positioned overlay
- **Full Width**: true

**BannerM (Medium):**
- **Aspect Ratio**: 1.87
- **Image Overlay**: Colors.black45
- **Content**: Flexible positioning

**BannerL (Large):**
- **Aspect Ratio**: Flexible (image-based)
- **Image Overlay**: Colors.black45
- **Full Height**: true

### Card Info (Payment Card)

**Properties:**
- **Aspect Ratio**: 2.0
- **Border Radius**: 24.0 (2x default)
- **Background Color**: `primaryColor` or custom gradient
- **Pattern Overlay**: SVG pattern on bottom section (10% opacity)
- **Padding**: 16.0
- **Content**:
  - Top section: Cardholder name, chip icon
  - Middle: Card number (masked)
  - Bottom: Expiry date, CVV (with pattern)
- **Selection Indicator**: Checkmark (top right)

---

## 8. SHADOW & ELEVATION PATTERNS

### AppBar Theme

- **Elevation**: 0.0 (flat design, no shadow)
- **Background Color**: Scaffold background
- **Border**: None
- **Height**: Default (56.0)

### Modal Bottom Sheet

- **Border Radius**: Top corners only, 24.0 (2x default)
- **Background**: Scaffold background color
- **Elevation**: 16.0 (elevated above content)
- **Clip Behavior**: ClipRRect
- **Shape**: RoundedRectangleBorder (top corners only)
- **Barrier Color**: Colors.black54 (semi-transparent overlay)

### DataTable Theme

**Container/Decoration:**
- **Column Spacing**: 24.0
- **Heading Row Color**:
  - Light mode: Colors.black12 (light grey)
  - Dark mode: Colors.white10 (subtle white)
- **Border**: 1px solid
  - Light mode: Colors.black12
  - Dark mode: Colors.white10
- **Border Radius**: 12.0
- **Divider Color**: Matches border

### Skeleton/Loading Elements

**Background Opacity Pattern:**
- **Icon Color Opacity**: 0.04 × layer count
- **Base Opacity**: 4% per layer
- **Border Radius**: 16.0
- **Height**: Configurable (default: 24.0)
- **Width**: Configurable

**Circle Skeleton Variant:**
- **Shape**: BoxShape.circle
- **Size**: Configurable (default: 24.0)
- **Opacity**: Same pattern as rectangular

### Scrollbar Theme

- **Track Color**: `primaryColor` (#7B61FF)
- **Thickness**: 8.0
- **Track Visibility**: false (auto-show on scroll)
- **Border Radius**: 4.0

---

## 9. THEME VARIANTS

### Light Mode (Default)

**Overall Brightness**: Light
**App Background**: White (#FFFFFF)
**Text Color**: `blackColor` (#16161E)
**Secondary Text**: `blackColor40` (#A2A2A5)
**Divider/Border**: `blackColor20` (#D0D0D2)
**Input Background**: `lightGreyColor` (#F8F8F9)
**App Bar Background**: White

### Dark Mode (Available)

**Overall Brightness**: Dark
**App Background**: Very dark grey/black
**Text Color**: White
**Secondary Text**: `whileColor40` (#666666)
**Divider/Border**: Colors.white10
**Input Background**: `darkGreyColor` (#1C1C25)
**App Bar Background**: `blackColor` (#16161E)

*(Note: Full dark theme implementation in app_theme.dart)*

---

## 10. ANIMATION & TRANSITION DURATIONS

| Duration | Value | Usage |
|----------|-------|-------|
| Default Duration | 300ms | Page transitions, state changes |
| Slow Motion | 500ms | Optional slow animations |
| Fast | 150ms | Hover states, quick feedbacks |

**Transit Curves Used:**
- `Curves.ease` - General transitions
- `Curves.easeOutCubic` - Carousel animations
- `Curves.easeInOut` - Modal animations
- `Curves.linear` - Timer-based animations

**Page Transitions:**
- EntryPoint: `FadeThroughTransition` (300ms)
- Modal: Custom bottom sheet slide
- Navigation: Standard Material transitions

---

## 11. SCALING AND RESPONSIVENESS

### Device-Specific Adaptations

- **Responsive Design**: Uses `MediaQuery` for screen-aware scaling
- **Max Width**: Typically full device width (no max-width constraint)
- **List/Grid Layouts**: Adapt to screen width
- **Modal Height**: 75% of screen (customizable per modal)

### Aspect Ratios (Key Components)

| Component | Aspect Ratio | Flexible | Notes |
|-----------|-------------|----------|-------|
| ProductCard image | 1.15 | No | Fixed, landscape-ish |
| CardInfo | 2.0 | No | Payment card |
| BannerM | 1.87 | No | Medium promotional |
| BannerS | 2.56 | No | Small promotional |
| BannerL | Variable | Yes | Large full-screen |
| OffersCarousel | 1.87 | No | Home screen carousel |

---

## 12. ICON SIZES & STYLING

### Standard Icon Sizes

| Size | Usage |
|------|-------|
| 10px | Tiny badges, overlays |
| 16px | Button icons, small elements |
| 20px | Standard UI icons |
| 24px | Navigation icons, action icons |
| 30px | Large action buttons |
| 48px | Circular action buttons (banners) |

**Icon Colors:**
- **Primary**: `blackColor` (#16161E) on light backgrounds
- **Secondary**: `blackColor40` (#A2A2A5) for secondary actions
- **Accent**: `primaryColor` (#7B61FF) for highlighted icons
- **Error**: `errorColor` (#EA5B5B) for alerts

---

## 13. SUMMARY TABLE

| Design Element | Value | Reference |
|--|--|--|
| **Primary Color** | #7B61FF | `primaryColor` constant |
| **Primary Font** | Plus Jakarta | "Plus Jakarta" |
| **Display Font** | Grandis Extended | "Grandis Extended" |
| **Base Spacing** | 16.0 dp | `defaultPadding` |
| **Default Radius** | 12.0 dp | `defaultBorderRadious` |
| **Large Radius** | 24.0 dp | 2x default |
| **Default Duration** | 300ms | `defaultDuration` |
| **Error Color** | #EA5B5B | `errorColor` |
| **Success Color** | #2ED573| `successColor` |
| **Warning Color** | #FFB E21 | `warningColor` |

---

**Document Generated**: Comprehensive analysis of AIVO design system
**Last Updated**: February 2025
**Status**: Complete and Ready for Implementation
