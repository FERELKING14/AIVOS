// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'AIVO';

  @override
  String get appSubtitle => 'E-Commerce App';

  @override
  String get bottomNavShop => 'Shop';

  @override
  String get bottomNavDiscover => 'Discover';

  @override
  String get bottomNavBookmark => 'Bookmark';

  @override
  String get bottomNavBag => 'Bag';

  @override
  String get bottomNavProfile => 'Profile';

  @override
  String get homeTitle => 'Home';

  @override
  String get discoverTitle => 'Discover';

  @override
  String get bookmarkTitle => 'Bookmarks';

  @override
  String get cartTitle => 'Shopping Cart';

  @override
  String get profileTitle => 'Profile';

  @override
  String get popularProducts => 'Popular Products';

  @override
  String get flashSale => 'Flash Sale';

  @override
  String get bestSellers => 'Best Sellers';

  @override
  String get mostPopular => 'Most Popular';

  @override
  String get youMightAlsoLike => 'You might also like';

  @override
  String get categories => 'Categories';

  @override
  String get all => 'All';

  @override
  String get men => 'Men';

  @override
  String get women => 'Women';

  @override
  String get kids => 'Kids';

  @override
  String get seeAll => 'See All';

  @override
  String get search => 'Search';

  @override
  String get notifications => 'Notifications';

  @override
  String get productDetails => 'Product Details';

  @override
  String get productPrice => 'Price';

  @override
  String get productRating => 'Rating';

  @override
  String get productReviews => 'Reviews';

  @override
  String get productReview => 'Review';

  @override
  String get productDescription => 'Description';

  @override
  String get shippingInfo => 'Shipping Information';

  @override
  String get returnsPolicy => 'Returns';

  @override
  String get sizeGuide => 'Size Guide';

  @override
  String get addToCart => 'Add to Cart';

  @override
  String get addedToCart => 'Added to Cart';

  @override
  String get buyNow => 'Buy Now';

  @override
  String get notifyMe => 'Notify Me';

  @override
  String get removeFromCart => 'Remove from Cart';

  @override
  String get cartEmpty => 'Your cart is empty';

  @override
  String cartItemsCount(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count items',
      one: '1 item',
      zero: 'No items',
    );
    return '$_temp0';
  }

  @override
  String get checkout => 'Checkout';

  @override
  String get continueShopping => 'Continue Shopping';

  @override
  String get subtotal => 'Subtotal';

  @override
  String get shipping => 'Shipping';

  @override
  String get tax => 'Tax';

  @override
  String get total => 'Total';

  @override
  String get applyCoupon => 'Apply Coupon';

  @override
  String get couponCode => 'Coupon Code';

  @override
  String get orderConfirmation => 'Order Confirmed';

  @override
  String get orderNumber => 'Order Number';

  @override
  String get estimatedDelivery => 'Estimated Delivery';

  @override
  String get orderTracking => 'Track Order';

  @override
  String get orders => 'Orders';

  @override
  String get orderHistory => 'Order History';

  @override
  String get orderStatus => 'Order Status';

  @override
  String get addresses => 'Addresses';

  @override
  String get addAddress => 'Add Address';

  @override
  String get editAddress => 'Edit Address';

  @override
  String get deleteAddress => 'Delete Address';

  @override
  String get defaultAddress => 'Default Address';

  @override
  String get setAsDefault => 'Set as Default';

  @override
  String get fullName => 'Full Name';

  @override
  String get phoneNumber => 'Phone Number';

  @override
  String get streetAddress => 'Street Address';

  @override
  String get city => 'City';

  @override
  String get state => 'State';

  @override
  String get zipCode => 'Zip Code';

  @override
  String get country => 'Country';

  @override
  String get paymentMethod => 'Payment Method';

  @override
  String get addPaymentMethod => 'Add Payment Method';

  @override
  String get cardName => 'Card Name';

  @override
  String get cardNumber => 'Card Number';

  @override
  String get expiryDate => 'Expiry Date';

  @override
  String get cvv => 'CVV';

  @override
  String get userInfo => 'User Information';

  @override
  String get editProfile => 'Edit Profile';

  @override
  String get firstName => 'First Name';

  @override
  String get lastName => 'Last Name';

  @override
  String get email => 'Email Address';

  @override
  String get updateProfile => 'Update Profile';

  @override
  String get changePassword => 'Change Password';

  @override
  String get currentPassword => 'Current Password';

  @override
  String get newPassword => 'New Password';

  @override
  String get confirmPassword => 'Confirm Password';

  @override
  String get preferences => 'Preferences';

  @override
  String get enableNotifications => 'Enable Notifications';

  @override
  String get emailNotifications => 'Email Notifications';

  @override
  String get pushNotifications => 'Push Notifications';

  @override
  String get smsNotifications => 'SMS Notifications';

  @override
  String get language => 'Language';

  @override
  String get english => 'English';

  @override
  String get french => 'Français';

  @override
  String get selectLanguage => 'Select Language';

  @override
  String get location => 'Location';

  @override
  String get settings => 'Settings';

  @override
  String get helpSupport => 'Help & Support';

  @override
  String get getHelp => 'Get Help';

  @override
  String get faq => 'FAQ';

  @override
  String get contactUs => 'Contact Us';

  @override
  String get aboutApp => 'About AIVO';

  @override
  String get termsConditions => 'Terms & Conditions';

  @override
  String get privacyPolicy => 'Privacy Policy';

  @override
  String get login => 'Login';

  @override
  String get signup => 'Sign Up';

  @override
  String get signup_getStarted => 'Let\'s get started!';

  @override
  String get signup_message =>
      'Please enter your valid data in order to create an account.';

  @override
  String get logout => 'Logout';

  @override
  String get forgotPassword => 'Forgot Password?';

  @override
  String get passwordRecovery => 'Password Recovery';

  @override
  String get enterEmail => 'Enter your email address';

  @override
  String get resetPassword => 'Reset Password';

  @override
  String get sendResetLink => 'Send Reset Link';

  @override
  String get username => 'Username';

  @override
  String get password => 'Password';

  @override
  String get passwordConfirm => 'Confirm Password';

  @override
  String get agreeTerms => 'I agree with Terms & Conditions';

  @override
  String get haveAccount => 'Already have an account?';

  @override
  String get noAccount => 'Don\'t have an account?';

  @override
  String get continue_ => 'Continue';

  @override
  String get next => 'Next';

  @override
  String get back => 'Back';

  @override
  String get save => 'Save';

  @override
  String get cancel => 'Cancel';

  @override
  String get delete => 'Delete';

  @override
  String get edit => 'Edit';

  @override
  String get add => 'Add';

  @override
  String get remove => 'Remove';

  @override
  String get searchProducts => 'Search products';

  @override
  String get noResults => 'No results found';

  @override
  String get filterBy => 'Filter By';

  @override
  String get sortBy => 'Sort By';

  @override
  String get priceRange => 'Price Range';

  @override
  String get rating => 'Rating';

  @override
  String get wishlist => 'Wishlist';

  @override
  String get addToWishlist => 'Add to Wishlist';

  @override
  String get removeFromWishlist => 'Remove from Wishlist';

  @override
  String get savedItems => 'Saved Items';

  @override
  String get noBookmarks => 'No bookmarks yet';

  @override
  String get onSale => 'On Sale';

  @override
  String get discount => 'Discount';

  @override
  String get wallet => 'Wallet';

  @override
  String get balance => 'Balance';

  @override
  String get recharge => 'Recharge';

  @override
  String get transactions => 'Transactions';

  @override
  String get walletHistory => 'Wallet History';

  @override
  String get error => 'Error';

  @override
  String get success => 'Success';

  @override
  String get warning => 'Warning';

  @override
  String get info => 'Information';

  @override
  String get errorOccurred => 'An error occurred';

  @override
  String get tryAgain => 'Try Again';

  @override
  String get loading => 'Loading...';

  @override
  String get comingSoon => 'Coming Soon';

  @override
  String get noInternet => 'No Internet Connection';

  @override
  String get checkConnection => 'Please check your internet connection';

  @override
  String get welcome => 'Welcome to AIVO';

  @override
  String get exploreProducts => 'Explore our amazing products';

  @override
  String get bestDeals => 'Best deals on your favorite items';

  @override
  String get freeShipping => 'Free shipping on orders over 50';

  @override
  String rateStar(Object count) {
    return '$count stars';
  }

  @override
  String get rateReview => 'Rate & Review';

  @override
  String get writeReview => 'Write a Review';

  @override
  String get reviewThanks => 'Thank you for your review!';

  @override
  String get helpful => 'Was this helpful?';

  @override
  String get yes => 'Yes';

  @override
  String get no => 'No';

  @override
  String get report => 'Report';

  @override
  String get deliveryAddress => 'Delivery Address';

  @override
  String get selectAddress => 'Select Address';

  @override
  String get changeAddress => 'Change Address';

  @override
  String get deliveryDate => 'Delivery Date';

  @override
  String get estimatedTime => 'Estimated time';

  @override
  String get orderPlaced => 'Order Placed';

  @override
  String get confirmed => 'Confirmed';

  @override
  String get shipped => 'Shipped';

  @override
  String get outForDelivery => 'Out for Delivery';

  @override
  String get delivered => 'Delivered';

  @override
  String get returnRequested => 'Return Requested';

  @override
  String get returnProcessing => 'Return Processing';

  @override
  String get returnCompleted => 'Return Completed';

  @override
  String get storeAvailability => 'Store Availability';

  @override
  String get checkAvailability => 'Check Availability';

  @override
  String get inStock => 'In Stock';

  @override
  String get outOfStock => 'Out of Stock';

  @override
  String get lowStock => 'Low Stock';

  @override
  String get newItems => 'New items with Free shipping';

  @override
  String get blackFriday => 'Black Friday';

  @override
  String get discountCollection => 'Collection';

  @override
  String get grabYoursNow => 'Grab yours now';

  @override
  String get summerSale => 'Summer Sale';

  @override
  String get specialOffer => 'Special Offer';

  @override
  String get logInTitle => 'Log in';

  @override
  String get forgotPasswordButton => 'Forgot password?';

  @override
  String get dontHaveAccount => 'Don\'t have an account?';

  @override
  String get signUpButton => 'Sign up';

  @override
  String get loginFailedError => 'Login failed';

  @override
  String get signupFailedError => 'Sign up failed';

  @override
  String get passwordResetSent => 'Password reset link sent to your email!';

  @override
  String get resetPasswordError => 'Error resetting password';

  @override
  String get emailPlaceholder => 'Email address';

  @override
  String get passwordPlaceholder => 'Password';

  @override
  String get askQuestion => 'Ask a question';

  @override
  String get askQuestion1 => 'Ask your question';

  @override
  String get yourQuestion => 'Your question...';

  @override
  String get send => 'Send';

  @override
  String get popularFaq => 'Popular FAQ';

  @override
  String get allFaq => 'All FAQ';

  @override
  String get noFaqAvailable => 'No FAQ available at the moment';

  @override
  String get faqLike => 'Like';

  @override
  String get cookiePreferences => 'Cookie Preferences';

  @override
  String get resetPreferences => 'Reset Preferences';

  @override
  String get preferencesReset => 'Preferences reset';

  @override
  String get theme => 'Theme';

  @override
  String get lightTheme => 'Light';

  @override
  String get darkTheme => 'Dark';

  @override
  String get systemTheme => 'System';

  @override
  String get emptyWishlist => 'Your wishlist is empty';

  @override
  String get emptyWishlistDescription =>
      'Add products to your wishlist to find them easily';

  @override
  String get myWishlist => 'My Wishlist';

  @override
  String get deleteAll => 'Delete all';

  @override
  String get addToWishlistError => 'Could not add to wishlist';

  @override
  String get walletTitle => 'Wallet';

  @override
  String get chargeBalance => '+ Charge Balance';

  @override
  String get logoutFailed => 'Logout failed';

  @override
  String get loggedOutSuccessfully => 'Logged out successfully';

  @override
  String get returnsTitle => 'Returns';

  @override
  String get returnsComingSoon => 'Returns (coming soon)';

  @override
  String get helpTitle => 'Get Help';

  @override
  String get helpComingSoon => 'Help (coming soon)';

  @override
  String get selectLanguage2 => 'Select a language';

  @override
  String get searchLanguage => 'Search for a language...';

  @override
  String get connection => 'Settings';

  @override
  String get findItem => 'Find the item you\'ve been looking for';

  @override
  String get getShoppingBags => 'Get those shopping bags filled';

  @override
  String get fastSecurePayment => 'Fast & secure payment';

  @override
  String get paymentOptions =>
      'There are many payment options available for your ease';

  @override
  String get packageTracking => 'Package tracking';

  @override
  String get nearbyStores => 'Nearby stores';

  @override
  String get noBestSellers => 'No best sellers available';

  @override
  String get noProducts => 'No products available';

  @override
  String get noFlashSale => 'No flash sale products';

  @override
  String get noPopularProducts => 'No popular products';

  @override
  String get sizeGuideTitle => 'Size guide';

  @override
  String get checkStores => 'Check stores';

  @override
  String get continueShoppingBtn => 'Continue shopping';

  @override
  String get checkoutBtn => 'Checkout';

  @override
  String get sleevelessRuffleTitle => 'Sleeveless Ruffle';

  @override
  String get findSomething => 'Find something...';

  @override
  String get storeSettings => 'Settings';

  @override
  String reviewsCount(Object count) {
    return '($count Reviews)';
  }

  @override
  String get welcomeBackTitle => 'Welcome back!';

  @override
  String get logInDescription =>
      'Log in with your data that you entered during your registration.';

  @override
  String get logInFailedError => 'Login failed';

  @override
  String get skipButton => 'Skip';

  @override
  String get allFieldsRequired => 'Please fill in all fields';

  @override
  String get themeMode => 'Theme Mode';

  @override
  String get themeAccent => 'Accent Color';

  @override
  String get themeContrast => 'Contrast';

  @override
  String get normal => 'Normal';

  @override
  String get highContrast => 'High Contrast';

  @override
  String get purple => 'Purple';

  @override
  String get skyBlue => 'Sky Blue';

  @override
  String get forestGreen => 'Forest Green';

  @override
  String get orange => 'Orange';

  @override
  String get coral => 'Coral';
}
