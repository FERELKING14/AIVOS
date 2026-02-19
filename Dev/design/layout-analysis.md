# AIVO Layout & Architecture Analysis

**Analysis Date**: February 2025
**Version**: 1.0
**App Type**: E-Commerce Mobile Application
**Framework**: Flutter

---

## 1. MAIN APPLICATION STRUCTURE

### 1.1 Entry Point & Initialization

**Main Application Entry** (`lib/main.dart`):
```
MyApp (MaterialApp)
  ├─ Title: "AIVO - E-Commerce App"
  ├─ Theme: AppTheme.lightTheme(context)
  ├─ ThemeMode: Light (hardcoded)
  ├─ Router: router.generateRoute
  └─ Initial Route: onbordingScreenRoute
```

**Application Flow:**
1. App starts at **OnBordingScreen** (5-page carousel)
2. → User proceeds to **LoginScreen** or **SignUpScreen**
3. → Successfully authenticated → **EntryPoint** (main app)
4. → 5-tab bottom navigation system
5. → Various screen navigation via routes

---

## 2. MAIN NAVIGATION SYSTEM

### 2.1 Entry Point (Bottom Navigation)

**File**: `lib/entry_point.dart`

**Architecture**:
```
EntryPoint (StatefulWidget)
  ├─ State: Tracks currentIndex (0-4)
  ├─ PageTransitionSwitcher
  │  └─ FadeThroughTransition (300ms fade)
  │     └─ Dynamic Screen Selection
  ├─ AppBar (Top)
  │  ├─ Logo: Shoplon SVG (100x20)
  │  ├─ Leading: SizedBox (spacing)
  │  └─ Actions
  │     ├─ Search icon → SearchScreen
  │     └─ Notification icon → NotificationsScreen
  └─ BottomNavigationBar
     ├─ Type: Fixed (5 items)
     ├─ Selected Font Size: 12px
     ├─ Color Mode: Icon changes on selection
     └─ Items: (0-4)
        [0] Shop (Home) → HomeScreen
        [1] Discover → DiscoverScreen
        [2] Bookmark → BookmarkScreen
        [3] Bag (Cart) → CartScreen (not implemented, shows "Coming Soon")
        [4] Profile → ProfileScreen
```

**Bottom Navigation Bar Styling**:
- **Type**: BottomNavigationBarType.fixed
- **Selected Color**: `primaryColor` (#7B61FF)
- **Unselected Color**: Transparent (dynamic)
- **Item Size**: Fixed with label
- **Label Style**: 12px font
- **Background**: White (light) / Dark grey (dark mode)
- **Top Padding**: 8.0

**Page Transition Details**:
- **Widget**: PageTransitionSwitcher (from `animations` package)
- **Transition Type**: FadeThroughTransition
- **Duration**: 300ms (defaultDuration)
- **Effect**: Smooth fade between tabs (no slide)
- **Curve**: Curves.ease

---

### 2.2 Screen Mapping

| Index | Label | Icon | Route | Screen Class | Status |
|-------|-------|------|-------|--------------|--------|
| 0 | Shop | shop.svg | homeScreenRoute | HomeScreen | ✅ Active |
| 1 | Discover | category.svg | discoverScreenRoute | DiscoverScreen | ✅ Active |
| 2 | Bookmark | bookmark.svg | bookmarkScreenRoute | BookmarkScreen | ✅ Active |
| 3 | Bag | bag.svg | cartScreenRoute | CartScreen | ⚠️ "Coming Soon" |
| 4 | Profile | profile.svg | profileScreenRoute | ProfileScreen | ✅ Active |

---

## 3. SCREEN STRUCTURES & LAYOUTS

### 3.1 Standard Screen Pattern

**Typical Screen Composition**:
```
Scaffold
  ├─ AppBar (optional)
  │  ├─ Leading (back button or none)
  │  ├─ Title (screen name)
  │  └─ Actions (search, filter, etc.)
  ├─ body: SafeArea
  │  └─ CustomScrollView or ListView
  │     ├─ SliverAppBar (optional, with floating option)
  │     ├─ SliverPadding (content wrapper)
  │     │  └─ SliverToBoxAdapter
  │     │     └─ Column or specialized widget
  │     └─ More SliverPadding sections
  └─ bottomSheet or sticky button (optional)
```

**Scrolling Behavior**:
- **CustomScrollView**: Used for complex nested scrolling
- **ListView**: Used for simpler flat lists
- **SingleChildScrollView**: Used for non-scrollable-by-default content

---

### 3.2 Home Screen (`HomeScreen`)

**File**: `lib/screens/home/views/home_screen.dart`

**Layout Structure**:
```
Scaffold
  body: CustomScrollView
    slivers:

      1. SliverPadding (vertical: 16.0)
         └─ OffersCarouselAndCategories
            ├─ OffersCarousel (manual swipe)
            │  └─ 4 banner styles (B/F, Discount, Style3, Summer Sale)
            │  └─ Dot indicators for page tracking
            └─ Categories (horizontal scroll)
               └─ Category chips: All, Men, Women, Kids

      2. SliverPadding (vertical: 24.0)
         └─ PopularProducts
            ├─ Header "Popular Products"
            └─ Horizontal scrolling product grid
               └─ ProductCard (140x220) × 4+

      3. SliverPadding (vertical: 24.0)
         └─ FlashSale
            ├─ Header "Flash Sale"
            └─ Horizontal scrolling product grid
               └─ ProductCard × 4+

      4. SliverPadding (vertical: 24.0)
         └─ BannerSStyle1 (promotional banner)
            ├─ Large discount percentage (60px, Grandis Extended)
            └─ Action button (circular white)

      5. SliverPadding (vertical: 24.0)
         └─ BestSellers
            ├─ Header "Best Sellers"
            └─ Vertical list of SinglelineProductCard
               └─ Each: 256x114 secondary product card

      6. SliverPadding (vertical: 24.0)
         └─ MostPopular
            ├─ Header "Most Popular"
            └─ Horizontal scrolling product grid
               └─ ProductCard × 4+

      7. SliverPadding (vertical: 24.0)
         └─ BannerSStyle5 (secondary promotional)

      8. SliverPadding (vertical: 24.0)
         └─ BestSellers (repeated)
            └─ Vertical list of secondary product cards

      9. SliverPadding (vertical: 24.0)
         └─ [Bottom spacing]
```

**Component Breakdown**:

**OffersCarousel**:
- Manual PageView (no auto-scroll)
- 4 different banner styles displayed as carousel
- Dot indicators at bottom-right
- Aspect ratio: 1.87
- Padding: 16.0

**PopularProducts Component**:
- Header: "Popular Products" (18px, bold)
- SingleChildScrollView (horizontal)
- Product grid with 4+ cards visible
- Card size: 140x220

**Category Chips**:
- Horizontal list of category buttons
- Active: Primary color background, white text, radius 30
- Inactive: Border style, transparent background
- Padding: 16.0 horizontal, 8.0 vertical

---

### 3.3 Discover Screen (`DiscoverScreen`)

**File**: `lib/screens/discover/views/discover_screen.dart`

**Layout Structure**:
```
Scaffold
  appBar: AppBar
    ├─ Title: "Discover"
    ├─ Leading: None
    └─ Actions: None
  body: CustomScrollView
    slivers:

      1. SliverPadding (vertical: 16.0)
         └─ CategoriesSection
            ├─ Header "Categories"
            └─ Grid of category buttons/icons
               └─ Multiple rows of category options

      2. SliverPadding (vertical: 24.0)
         └─ DiscoverCategoriesSection
            ├─ Expandable categories
            │  └─ ExpansionCategory widget (each)
            │     ├─ Category header
            │     └─ Sub-categories list
            └─ Multiple category expansion panels
```

**Key Features**:
- Expandable category lists
- Search capability (optional)
- Grid-based category display
- Nested category hierarchy

---

### 3.4 Product Details Screen (`ProductDetailsScreen`)

**File**: `lib/screens/product/views/product_details_screen.dart`

**Layout Structure**:
```
Scaffold
  appBar: SliverAppBar (floating)
    ├─ Background: Primary color
    ├─ Title: Product name
    └─ Leading: Back button
  body: CustomScrollView
    slivers:

      1. SliverToBoxAdapter
         └─ SafeArea
            └─ ProductImages
               ├─ Image carousel (manual swipe)
               └─ Dot indicators

      2. SliverPadding (vertical: 16.0)
         └─ ProductInfo
            ├─ Product name
            ├─ Brand
            ├─ Price (current & original if discount)
            ├─ Star rating with review count
            ├─ Description
            └─ Size/Color selector (if applicable)

      3. SliverPadding (vertical: 16.0)
         └─ ProductListTile
            ├─ SVG icon
            ├─ Title: "Returns"
            └─ Navigation arrow

      4. SliverPadding (vertical: 16.0)
         └─ ReviewCard
            ├─ Overall rating (big number)
            ├─ Rating breakdown bars
            └─ Total review count

      5. SliverPadding (vertical: 16.0)
         └─ ProductListTile
            ├─ Title: "Reviews"
            └─ Navigation to ProductReviewsScreen

      6. SliverPadding (vertical: 16.0)
         └─ RelatedProducts
            ├─ Header "You might also like"
            ├─ Horizontal scrolling grid
            └─ ProductCard × 4+

      7. SliverPadding (vertical: 16.0)
         └─ [Bottom spacing]

  bottomNavigationBar: CartButton or NotifyMeCard
    ├─ CartButton: Shows price + shopping bag icon
    └─ NotifyMeCard: Notify when back in stock
```

**ProductImages Carousel**:
- Manual swipe-based navigation
- Page indicator dots (visible when multiple images)
- Pages: Cached network images
- Aspect ratio: Automatic from image

**ProductInfo Section**:
- Grid-based layout or column with separated sections
- Price color: Cyan (#31B0D8)
- Discount display: Red background (-50% badge)
- Rating stars: Yellow/warning color

---

### 3.5 Profile Screen (`ProfileScreen`)

**File**: `lib/screens/profile/views/profile_screen.dart`

**Layout Structure**:
```
Scaffold
  body: ListView

    1. ProfileCard
       ├─ User avatar (circular image)
       ├─ User name
       ├─ User email
       └─ Edit profile button (navigates to UserInfoScreen)

    2. SliverPadding or Padding (vertical: 24.0)
       └─ NetworkImageWithLoader
          └─ Promotional banner image

    3. Section: "Account"
       ├─ ProfileMenuListTile (Orders)
       ├─ ProfileMenuListTile (Returns)
       ├─ ProfileMenuListTile (Wishlist/Bookmarks)
       └─ Divider

    4. Section: "Personalization"
       ├─ ProfileMenuListTile (Notifications)
       └─ ProfileMenuListTile (Preferences)
       └─ Divider

    5. Section: "Settings"
       ├─ ProfileMenuListTile (Language)
       ├─ ProfileMenuListTile (Location)
       └─ Divider

    6. Section: "Help & Support"
       ├─ ProfileMenuListTile (Get Help)
       └─ ProfileMenuListTile (FAQ)

    7. ElevatedButton (Logout)
       └─ Background: Error color
       └─ Text: White
       └─ Full width
```

**ProfileMenuListTile Component**:
- Leading: SVG icon (24x24)
- Title: Menu item name (14px, black)
- Trailing: Forward arrow icon
- Divider below (if not last item)
- Tap: Navigate or trigger action

**Section Headers**:
- Missing in current implementation (title in ListTile)
- Could be added as Padding + Text

---

### 3.6 Cart Screen (`CartScreen`)

**File**: `lib/screens/checkout/views/cart_screen.dart`

**Current Status**: Shows "Coming Soon" message

**Future Structure** (typical e-commerce):
```
Scaffold
  appBar: AppBar (title: "Shopping Cart")
  body:
    ├─ If empty:
    │  └─ EmptyStateWidget
    └─ If has items:
       └─ ListView
          ├─ CartItemCard ×N
          │  ├─ Product image
          │  ├─ Product name & price
          │  ├─ Quantity selector
          │  └─ Remove button
          └─ CartSummary
             ├─ Subtotal
             ├─ Shipping (if applicable)
             ├─ Tax (if applicable)
             └─ Total
  bottomNavigationBar: CartButton
    └─ Checkout button
```

---

### 3.7 Bookmark Screen (`BookmarkScreen`)

**File**: `lib/screens/bookmark/views/bookmark_screen.dart`

**Layout Structure**:
```
Scaffold
  appBar: AppBar (title: "Bookmarks")
  body: ListView or GridView
    ├─ If empty:
    │  └─ EmptyStateWidget with "No bookmarks" message
    └─ If has items:
       └─ Grid or List of ProductCard items
          └─ Products user has saved/wishlist
```

---

## 4. COMMON UI PATTERNS

### 4.1 Horizontal Scrolling Lists

**Pattern**:
```
Padding (horizontal: 16.0)
  └─ Column
     ├─ Row (header)
     │  ├─ Text (title)
     │  └─ Trailing (optional "See All")
     ├─ SingleChildScrollView (horizontal axis)
     │  └─ Row with products/items
     │     └─ [Item] × N
```

**Usage Locations**:
- Popular Products (HomeScreen)
- Flash Sale (HomeScreen)
- Most Popular (HomeScreen)
- Product images carousel
- Related products (ProductDetailsScreen)

**Spacing**:
- Section header to content: 8.0 dp
- Between scrollable items: 8.0 dp
- Outer padding: 16.0 dp from edges

### 4.2 Grid Layouts

**Product Grid Pattern**:
- Used for displaying multiple products
- Calculated dynamically based on screen width
- Typical: 2 columns per row (for 140x220 cards)
- Spacing between items: 8.0 dp

**Category Grid Pattern**:
- Grid of category buttons
- Variable columns (2-3 typically)
- Button size: Adaptive

### 4.3 Card in List Pattern

**Structure**:
```
Column
  ├─ InkWell or ListTile
  │  ├─ Leading: Icon/Image (optional)
  │  ├─ Title: Text
  │  ├─ Subtitle: Text (optional)
  │  └─ Trailing: Arrow or action icon
  └─ Divider (height: 1)
```

**Usage**:
- Profile menu items
- Navigation list items
- Settings options

**Styling**:
- Padding: 16.0 (horizontal), 8.0 (vertical)
- Divider: 1px, `blackColor20` color
- Icon size: 24x24
- Font size: 14px

### 4.4 Modal Bottom Sheet Pattern

**Default Configuration**:
```
showModalBottomSheet(
  context: context,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.vertical(top: Radius.circular(24.0))
  ),
  builder: (context) => SingleChildScrollView(
    child: Padding(
      padding: EdgeInsets.all(16.0),
      child: [Content Widget]
    )
  )
)
```

**Specifications**:
- **Height**: 75% of screen (customizable)
- **Border Radius**: 24.0 (top corners only)
- **Background**: Scaffold background color
- **Barrier Color**: Colors.black54 (semi-transparent)
- **Clip Behavior**: ClipRRect
- **Dismissible**: True (swipe down to close)
- **Content Padding**: 16.0

**Usage**:
- Filter options
- Sort options
- Additional information modals
- Product variant selection

### 4.5 Section with Header Pattern

**Standard Structure**:
```
Padding (horizontal: 16.0, vertical: 24.0)
  └─ Column
     ├─ Row
     │  ├─ Expanded
     │  │  └─ Text (title, 18px, bold)
     │  └─ GestureDetector (See All link)
     │     └─ Text ("See All", 12px, primary color)
     ├─ SizedBox (height: 8.0)
     └─ [Content Widget]
```

**Font Styling**:
- **Title**: 18px, weight 500-700
- **"See All" link**: 12px, primary color (#7B61FF)
- **Content**: Variable based on items

---

## 5. NAVIGATION ROUTING SYSTEM

**File**: `lib/route/router.dart`

**Routing Implementation**:
- **Type**: Named routes with `generateRoute`
- **Pattern**: Route string matching with `PageRoute` builders

**Main Routes** (all implemented):
```
onbordingScreenRoute: → OnBordingScreen
loginScreenRoute: → LoginScreen
signupScreenRoute: → SignUpScreen
passwordRecoveryScreenRoute: → PasswordRecoveryScreen
entryPointScreenRoute: → EntryPoint

homeScreenRoute: → HomeScreen
discoverScreenRoute: → DiscoverScreen
bookmarkScreenRoute: → BookmarkScreen
cartScreenRoute: → CartScreen
profileScreenRoute: → ProfileScreen

productDetailsScreenRoute: → ProductDetailsScreen
productReviewsScreenRoute: → ProductReviewsScreen
productBuyNowScreenRoute: → ProductBuyNowScreen

searchScreenRoute: → SearchScreen
onSaleScreenRoute: → OnSaleScreen
kidsScreenRoute: → KidsScreen

userInfoScreenRoute: → UserInfoScreen
addressesScreenRoute: → AddressesScreen
ordersScreenRoute: → OrdersScreen
prefferencesScreenRoute: → PreferencesScreen
notificationsScreenRoute: → NotificationsScreen (variants)
walletScreenRoute: → WalletScreen
```

**Route Arguments** (when applicable):
- ProductDetailsScreen: Product ID/data
- Routes are pushed with `Navigator.pushNamed(context, routeName)`

---

## 6. COMPONENT REUSABILITY MAPPING

### 6.1 Frequently Used Components

| Component | Usage Count | Locations |
|-----------|------------|-----------|
| ProductCard | High | Home, Search, Category, Related items |
| SecondaryProductCard | Medium | Best sellers, Order lists |
| BannerS/M | High | Home, promotional sections |
| NetworkImageWithLoader | High | Product images, banners, profiles |
| ListTile variants | High | Profile, orders, settings |
| ReviewCard | Medium | Product details, review screens |
| CartButton | Multiple | Bottom of product screens |
| DotIndicator | Medium | Image carousels, page indicators |

### 6.2 Component Placement Rules

**Product Cards**:
- Grid layout for browsing (140x220)
- List layout for "best sellers" rows (256x114)
- "Related products" section uses grid layout

**Banners**:
- Promotional sections in HomeScreen
- Full-width SliverPadding wrapper
- Vertical spacing: 24.0 between banners

**Images**:
- NetworkImageWithLoader for all remote images
- Default border radius: 16.0 (or 12.0 in cards)
- Error state: Placeholder icon

---

## 7. STATE MANAGEMENT APPROACH

**Current Implementation**:
- **StatefulWidget**: Used for simple local state (page index, form state)
- **StatelessWidget**: Presentational components
- **Navigation**: Direct `Navigator` calls (push/pop)

**Data Flow**:
- No centralized state management package currently
- Each screen manages its own state independently
- Context-based navigation

---

## 8. SCREEN DIMENSIONS & BREAKPOINTS

### 8.1 Fixed Sizes

| Dimension | Size | Component |
|-----------|------|-----------|
| Product Card | 140×220 | Grid product card |
| Secondary Product Card | 256×114 | List/best seller card |
| Payment Card | 2.0 aspect ratio | CardInfo |
| Circular Button | 48×48 | Banner action |
| Category Chip | 36 height | Category buttons |

### 8.2 Flexible Dimensions

- **Banner Width**: Full screen width (no padding reduction typically)
- **Screen Padding**: 16.0 dp standard
- **List Height**: Flexible, wrapped in SingleChildScrollView if needed
- **Modal Height**: 75% of `MediaQuery.of(context).size.height`

---

## 9. WIDGET TREE DEPTH & OPTIMIZATION

**Typical Tree Depth**:
- **Light Screens**: 5-8 levels (Scaffold → AppBar, Body sections)
- **Complex Screens**: 8-12 levels (ProductDetailsScreen with multiple nested scrolls)
- **Cards**: 4-6 levels (Card → Content → Sub-content)

**Optimization Techniques Used**:
- **CustomScrollView**: Efficient nested scrolling
- **Builder patterns**: For item lists to avoid rebuilding all
- **Const constructors**: Used where possible for widget reuse
- **NetworkImageWithLoader**: Cached images to prevent redundant fetches

---

## 10. RESPONSIVENESS STRATEGY

**Media Query Usage**:
```dart
MediaQuery.of(context).size.height // Screen height
MediaQuery.of(context).size.width   // Screen width
MediaQuery.of(context).padding      // Safe area
```

**Common Responsive Patterns**:
- Modal height: `75% of screen height`
- Product grid: `2 columns` (hardcoded, could be dynamic)
- Padding scales with content area (fixed at 16.0)
- No dynamic column switching implemented

**Orientation Support**:
- Portrait: Default assumption
- Landscape: Not explicitly optimized in current screens

---

## 11. ACCESSIBILITY PATTERNS

**Implemented**:
- Semantic buttons (InkWell, OutlinedButton, ElevatedButton)
- Text contrast (dark on light, light on dark)
- Hit targets: Minimum 48×48 dp

**Not Implemented**:
- Semantics widget for screen readers
- Tooltip support
- Alternative text for images

---

## SUMMARY

### Key Architectural Decisions:
1. **Bottom Navigation**: 5-tab fixed bar for main navigation
2. **CustomScrollView**: Used for complex nested scroll layouts
3. **Page Transitions**: Smooth fade-through for tab switching
4. **Component Reuse**: 88 custom components across app
5. **Styled Variants**: Multiple banner and product card styles
6. **Fixed Layouts**: Many components use fixed sizes for predictability

### Design Consistency:
- Uniform spacing (16.0 dp base unit)
- Consistent border radius (12.0 dp default)
- Primary color hierarchy (purple #7B61FF)
- Standard padding/margin application throughout

---

**Document Status**: Complete
**Last Updated**: February 2025
**Used for**: Multilingue system implementation baseline
