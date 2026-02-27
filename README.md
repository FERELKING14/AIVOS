# AIVO - E-Commerce Mobile App

<p align="center">
  <img src="readme%20image/Build%20you%20shop%20app%20in%20days.png" alt="AIVO E-Commerce App" style="width: 500px; height: auto;">
</p>

<p align="center">
  AIVO is a modern, feature-rich e-commerce mobile application built with Flutter. Designed for both Android and iOS, AIVO provides a seamless shopping experience with 100+ carefully crafted screens covering all essential e-commerce functionality.
</p>

## Features

AIVO includes a comprehensive set of features and screens:

### Core Functionality
- **🔐 Supabase Authentication** - Sign up, login, logout, password recovery
- **✨ SKIP Authentication** - Browse app without login
- **Product Browsing** - Intuitive product search, filters, and discovery
- **Shopping Cart** - Manage items with ease
- **Checkout** - Streamlined payment and order process
- **Order Tracking** - Track your orders in real-time
- **User Profile** - Manage account, addresses, and preferences with login/logout
- **🌐 Multi-language** - English & French (i18n)
- **🎨 Light/Dark Themes** - Full theme support
- **Wallet & Payments** - Secure payment methods and balance management

### UI Components
- **100+ Screens** - Comprehensive screen library covering all shopping scenarios
- **Light & Dark Themes** - Full theme support for both light and dark modes
- **Custom Loading States** - Elegant skeleton loaders for better UX
- **Responsive Design** - Optimized for all device sizes and orientations

### Navigation
- **Bottom Navigation** - Easy access to main sections (Home, Discover, Bookmarks, Cart, Profile)
- **Smooth Transitions** - Polished page transitions and animations
- **Deep Linking** - Complete routing system with named routes

## Architecture

The project is organized with a clean, modular structure:

```
lib/
├── components/        # Reusable UI components
├── models/           # Data models
├── screens/          # Screen pages (organized by feature)
├── route/            # Navigation and routing
├── theme/            # Theme and styling
├── constants.dart    # App constants
├── main.dart         # App entry point
└── entry_point.dart  # Main navigation controller
```

## Screens Included

### Auth & Onboarding
- Onboarding carousel
- Login & Sign up
- Password recovery
- Terms & conditions

### Main Navigation
- **Home** - Featured products and offers
- **Discover** - Browse categories
- **Bookmarks** - Saved items
- **Cart** - Shopping cart management
- **Profile** - User account

### Product Pages
- Product details with reviews
- Product gallery
- Shipping information
- Returns policy
- Size guide
- Store availability

### Checkout & Orders
- Cart review
- Address selection
- Payment methods
- Order confirmation
- Order tracking
- Order history

### User Management
- Profile editing
- Address management
- Notification settings
- Payment methods
- Wallet management
- Help & support

## Technology Stack

- **Flutter** - Cross-platform mobile framework (3.2.0+)
- **Dart** - Programming language (3.0.0+)
- **Supabase** - Backend, PostgreSQL, authentication
- **Material Design** - UI design system
- **Custom Animations** - Smooth transitions and effects
- **SharedPreferences** - Local state persistence

### Backend Integration
- **supabase_flutter: ^2.5.0** - Official Flutter SDK
- **flutter_dotenv: ^5.1.0** - Environment configuration
- **shared_preferences: ^2.2.2** - App state tracking

## Getting Started

### Prerequisites
- Flutter 3.35 or higher
- Dart 3.0.0 or higher
- Supabase account (https://supabase.com)
- Android SDK 21+ or iOS 12+

### Installation

1. Clone the repository
```bash
git clone https://github.com/ferelking8/AIVOS.git
cd AIVOS
```

2. Setup Supabase credentials
```bash
cp .env.example .env
# Edit .env with your Supabase credentials
```

3. Install dependencies
```bash
flutter pub get
```

4. Run the app
```bash
flutter run
```

## 🔐 Supabase Integration

### Configuration

Create a `.env` file (not committed):
```env
SUPABASE_URL=https://your-project.supabase.co
SUPABASE_PUBLISH_KEY=sb_publishable_xxxxx
```

### Authentication Flow

```
First Launch → OnBoarding (shown once) → EntryPoint (default)
                                              ↓
                                      Profile Tab
                                      ├─ NOT Logged In: "Login" button
                                      └─ Logged In: Show profile + "Logout" button
```

### Features
- ✅ Sign up with email
- ✅ Login with credentials
- ✅ Logout functionality
- ✅ Password recovery (email reset)
- ✅ Session persistence
- ✅ First launch tracking
- ✅ SKIP authentication to browse

### Services

**SupabaseAuthService** (`lib/services/supabase_auth_service.dart`)
- `login(email, password)` - Authenticate user
- `signUp(email, password)` - Create account
- `logout()` - Sign out user
- `resetPassword(email)` - Send password reset email
- `isLoggedIn` - Check auth status
- `userEmail` - Get current user email

**SupabaseService** (`lib/services/supabase_service.dart`)
- `getPopularProducts()` - Products tagged as popular
- `getFlashSaleProducts()` - Flash sale items
- `getBestSellersProducts()` - Best sellers
- `getKidsProducts()` - Kids collection
- `getProductsByCategory(id)` - Filter by category
- `searchProducts(query)` - Search products
- `getCategories()` - All categories

### Database

Tables:
- `products` - Products with tags, pricing, inventory
- `categories` - Product categories
- `orders` - Customer orders (future use)

See `dev/md/SUPABASE_SETUP.md` for detailed documentation.

## Development

### Building

Build an Android APK:
```bash
flutter build apk --release
```

Build an iOS app:
```bash
flutter build ios --release
```

### Customization

The app is highly customizable:
- **Colors & Branding** - Update in `lib/theme/app_theme.dart`
- **Assets** - Add your images to `assets/images/`
- **Strings** - Centralize text in constants or use localization
- **API Integration** - Connect to your backend in the data models

## Project Structure Details

## Project Structure Details

### /lib
```
lib/
├── services/              # 🔐 Business logic
│   ├── supabase_auth_service.dart    # Authentication
│   └── supabase_service.dart         # Data access
├── models/               # Data models
│   ├── product_model.dart
│   └── category_model.dart
├── screens/              # UI screens (organized by feature)
│   ├── auth/             # Login, Signup, Password Recovery
│   ├── home/
│   ├── profile/          # 👤 Login/Logout
│   ├── discover/
│   ├── bookmark/
│   ├── cart/
│   └── ... (15+ more)
├── components/           # Reusable widgets
├── route/                # Navigation
├── theme/                # Theming
├── constants.dart
├── entry_point.dart      # Bottom navigation (5 tabs)
└── main.dart             # App entry point
```

### /dev - Development Resources

```
dev/
├── README.md             # Overview of dev resources
├── sql/                  # SQL scripts for Supabase
│   ├── show_structure.sql
│   ├── fill_products_complete.sql
│   ├── seed_data.sql
│   └── README.md
├── scripts/              # Shell utilities
│   ├── explore_db.sh
│   ├── get_db_structure.sh
│   ├── test_columns.sh
│   └── README.md
├── md/                   # Documentation
│   ├── SUPABASE_SETUP.md
│   └── README.md
└── docs/                 # Additional docs folder
    └── README.md
```

### /assets
```
assets/
├── images/               # Image files
├── icons/                # SVG icons
├── fonts/                # Custom fonts
├── screens/              # Screen mockups
└── ... (images, flags, etc)
```

## Performance Optimization

- Skeleton loading states for smoother UX
- Cached image loading
- Efficient list rendering with builders
- Optimized page transitions

## 📚 Development Resources

All development tools, scripts, and documentation are in the `/dev` folder:

- **[dev/README.md](dev/README.md)** - Overview of development resources
- **[dev/md/SUPABASE_SETUP.md](dev/md/SUPABASE_SETUP.md)** - Complete Supabase integration guide
- **[dev/sql/](dev/sql/)** - SQL scripts for database setup and seeding
- **[dev/scripts/](dev/scripts/)** - Shell utilities for exploring and managing Supabase
- **[dev/docs/](dev/docs/)** - Additional architecture and design documentation

## Future Enhancements

Potential areas for expansion:
- Replace product mocks with real Supabase queries
- Real-time notifications
- Advanced search and filtering
- Social features (reviews, ratings, recommendations)
- Payment gateway integration
- Analytics and user tracking

## License

This project is proprietary and confidential.

## Support

For questions or support, please refer to the project documentation or contact the development team.

---

**Built with ❤️ using Flutter**
