// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Amharic (`am`).
class AppLocalizationsAm extends AppLocalizations {
  AppLocalizationsAm([String locale = 'am']) : super(locale);

  @override
  String get appTitle => 'AIVO';

  @override
  String get appSubtitle => 'ኢኮሚርስ ሚኒስትር';

  @override
  String get bottomNavShop => 'ራስ';

  @override
  String get bottomNavDiscover => 'ያወቁ';

  @override
  String get bottomNavBookmark => 'ምልክት';

  @override
  String get bottomNavBag => 'ከረጢት';

  @override
  String get bottomNavProfile => 'መገለጫ';

  @override
  String get homeTitle => 'ቤት';

  @override
  String get discoverTitle => 'ያወቁ';

  @override
  String get bookmarkTitle => 'ምልክቶች';

  @override
  String get cartTitle => 'ግዢ ሳጥን';

  @override
  String get profileTitle => 'መገለጫ';

  @override
  String get popularProducts => 'ታዋቂ ምርቶች';

  @override
  String get flashSale => 'ብልጭ ሽያጭ';

  @override
  String get bestSellers => 'ታላቅ አሸናፊ';

  @override
  String get mostPopular => 'በጣም ታዋቂ';

  @override
  String get youMightAlsoLike => 'ምናልባት ይወዱት';

  @override
  String get categories => 'ምድቦች';

  @override
  String get all => 'ሁሉ';

  @override
  String get men => 'ወንዶች';

  @override
  String get women => 'ሴቶች';

  @override
  String get kids => 'ልጆች';

  @override
  String get seeAll => 'ሁሉንም ይመልከቱ';

  @override
  String get search => 'ፈልግ';

  @override
  String get notifications => 'ማሳወቂያዎች';

  @override
  String get productDetails => 'ምርት ዝርዝሮች';

  @override
  String get productPrice => 'ዋጋ';

  @override
  String get productRating => 'ደረጃ';

  @override
  String get productReviews => 'ግምገማ';

  @override
  String get productReview => 'ግምገማ';

  @override
  String get productDescription => 'መግለጫ';

  @override
  String get shippingInfo => 'መላኪያ መረጃ';

  @override
  String get returnsPolicy => 'ተመላሾች';

  @override
  String get sizeGuide => 'መጠን መመሪያ';

  @override
  String get addToCart => 'ወደ ሳጥን ጨምር';

  @override
  String get addedToCart => 'ወደ ሳጥን ተጨምሮ';

  @override
  String get buyNow => 'አሁን ግዙ';

  @override
  String get notifyMe => 'ያሳውቁኝ';

  @override
  String get removeFromCart => 'ከሳጥን ወግደው';

  @override
  String get cartEmpty => 'ሳጥንዎ ባዶ ነው';

  @override
  String cartItemsCount(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ዕቃዎች',
      one: '1 ዕቃ',
      zero: 'ምንም ዕቃ የሉም',
    );
    return '$_temp0';
  }

  @override
  String get checkout => 'ገዛ';

  @override
  String get continueShopping => 'ግዋብ ጥበቡ';

  @override
  String get subtotal => 'ንኡስ ጠቅላላ';

  @override
  String get shipping => 'መላኪያ';

  @override
  String get tax => 'ታክስ';

  @override
  String get total => 'ጠቅላላ';

  @override
  String get applyCoupon => 'ኩፖን ይተግብሩ';

  @override
  String get couponCode => 'ኩፖን ኮድ';

  @override
  String get orderConfirmation => 'ትዕዛዝ ተረጋገጠ';

  @override
  String get orderNumber => 'የትዕዛዝ ቁጥር';

  @override
  String get estimatedDelivery => 'ተገምተው ተውሰደ';

  @override
  String get orderTracking => 'ትዕዛዝ ይከታተሉ';

  @override
  String get orders => 'ትዕዛዞች';

  @override
  String get orderHistory => 'የትዕዛዝ ታሪክ';

  @override
  String get orderStatus => 'የትዕዛዝ ሁኔታ';

  @override
  String get addresses => 'አድራሻዎች';

  @override
  String get addAddress => 'አድራሻ ጨምር';

  @override
  String get editAddress => 'አድራሻ ያርትዑ';

  @override
  String get deleteAddress => 'አድራሻ ይሰርዙ';

  @override
  String get defaultAddress => 'ነባር አድራሻ';

  @override
  String get setAsDefault => 'እንደ ነባር ተወስኑ';

  @override
  String get fullName => 'ሙሉ ስም';

  @override
  String get phoneNumber => 'ስልክ ቁጥር';

  @override
  String get streetAddress => 'መንገድ አድራሻ';

  @override
  String get city => 'ከተማ';

  @override
  String get state => 'ስቴት';

  @override
  String get zipCode => 'ዝ ኮድ';

  @override
  String get country => 'ሃገር';

  @override
  String get paymentMethod => 'የክፍያ ዘዴ';

  @override
  String get addPaymentMethod => 'የክፍያ ዘዴ ጨምር';

  @override
  String get cardName => 'ካርድ ስም';

  @override
  String get cardNumber => 'ካርድ ቁጥር';

  @override
  String get expiryDate => 'ማለፊያ ወቅት';

  @override
  String get cvv => 'CVV';

  @override
  String get userInfo => 'የተጠቃሚ መረጃ';

  @override
  String get editProfile => 'መገለጫ ያርትዑ';

  @override
  String get firstName => 'ጸሀፊ ስም';

  @override
  String get lastName => 'ስሙ';

  @override
  String get email => 'ኢሜል አድራሻ';

  @override
  String get updateProfile => 'መገለጫ ያሻሽሉ';

  @override
  String get changePassword => 'ይለፍ ቃል ይቀይሩ';

  @override
  String get currentPassword => 'አሁን ያለ ይለፍ ቃል';

  @override
  String get newPassword => 'አዲስ ይለፍ ቃል';

  @override
  String get confirmPassword => 'ይለፍ ቃል ያረጋግጡ';

  @override
  String get preferences => 'ምርጫዎች';

  @override
  String get enableNotifications => 'ማሳወቂያዎች ይቻሉ';

  @override
  String get emailNotifications => 'ኢሜል ማሳወቂያዎች';

  @override
  String get pushNotifications => 'ማሳወቂያዎች ይግፉ';

  @override
  String get smsNotifications => 'ኤስኤምኤስ ማሳወቂያዎች';

  @override
  String get language => 'ቋንቋ';

  @override
  String get english => 'English';

  @override
  String get french => 'Français';

  @override
  String get selectLanguage => 'ቋንቋ ይምረጡ';

  @override
  String get location => 'ቦታ';

  @override
  String get settings => 'ቅንብሮች';

  @override
  String get helpSupport => 'እርዳታ & ድጋፍ';

  @override
  String get getHelp => 'እርዳታ ይያዙ';

  @override
  String get faq => 'ጊዜ ብዙ ጊዜ ጠየቁ ጥያቄዎች';

  @override
  String get contactUs => 'ያገኙን';

  @override
  String get aboutApp => 'AIVO ስለ';

  @override
  String get termsConditions => 'ውሎች & ሁኔታዎች';

  @override
  String get privacyPolicy => 'ግላዊነት ግበር';

  @override
  String get login => 'ግባ';

  @override
  String get signup => 'ተመዝገቡ';

  @override
  String get signup_getStarted => 'ስታርት ወሰድ!';

  @override
  String get signup_message => 'ወደ ሂሳብ ለመፍጠር እባክዎን ትክክለኛ milwaukee ያስገቡ።';

  @override
  String get logout => 'ውጣ';

  @override
  String get forgotPassword => 'ይለፍ ቃል ረስተዋል?';

  @override
  String get passwordRecovery => 'ይለፍ ቃል ስ';

  @override
  String get enterEmail => 'ኢሜል አድራሻዎን ያስገቡ';

  @override
  String get resetPassword => 'ይለፍ ቃል ዳግም ያስጀምሩ';

  @override
  String get sendResetLink => 'ዳግም ያስጀምሩ ቁልፍ ይላኩ';

  @override
  String get username => 'ተጠቃሚ ስም';

  @override
  String get password => 'ይለፍ ቃል';

  @override
  String get passwordConfirm => 'ይለፍ ቃል ያረጋግጡ';

  @override
  String get agreeTerms => 'ውሎች & ሁኔታዎች ከዚህ ጋር 同意します';

  @override
  String get haveAccount => 'ቀድሞ ሂሳብ አለቦት?';

  @override
  String get noAccount => 'ሂሳብ የሉትም?';

  @override
  String get continue_ => 'ቀጥል';

  @override
  String get next => 'ቀጥል';

  @override
  String get back => 'ጀብ';

  @override
  String get save => 'ቀን';

  @override
  String get cancel => 'ተወው';

  @override
  String get delete => 'ሰርዙ';

  @override
  String get edit => 'ያርትዑ';

  @override
  String get add => 'ጨምር';

  @override
  String get remove => 'ወግደው';

  @override
  String get searchProducts => 'ምርቶች ውጤታ';

  @override
  String get noResults => 'ውጤት አልተገኙም';

  @override
  String get filterBy => 'ወርወር በ';

  @override
  String get sortBy => 'በ ተከታትል';

  @override
  String get priceRange => 'ዋጋ ቅርጽ';

  @override
  String get rating => 'ደረጃ';

  @override
  String get wishlist => 'ወደ የምወድ ዝርዝር';

  @override
  String get addToWishlist => 'ወደ ወደ የምወድ ዝርዝር ጨምር';

  @override
  String get removeFromWishlist => 'ከ የምወድ ዝርዝር ወግደው';

  @override
  String get savedItems => 'በሩት ወደ ተቀሳ';

  @override
  String get noBookmarks => 'ምልክቶች የሉም';

  @override
  String get onSale => 'በሽያጭ ላይ';

  @override
  String get discount => 'ቅናሽ';

  @override
  String get wallet => 'ወለታ';

  @override
  String get balance => 'ሚዛን';

  @override
  String get recharge => 'ዳግም ሙሙ';

  @override
  String get transactions => 'ግብይቶች';

  @override
  String get walletHistory => 'ወለታ ታሪክ';

  @override
  String get error => 'ስህተት';

  @override
  String get success => 'ሊሠሩ';

  @override
  String get warning => 'ስጠየቅ';

  @override
  String get info => 'ይገልጹ';

  @override
  String get errorOccurred => 'ስህተት ተከስተ';

  @override
  String get tryAgain => 'ዳግም ሞክር';

  @override
  String get loading => 'ጭነት...';

  @override
  String get comingSoon => 'በቅርቡ ይመጣል';

  @override
  String get noInternet => 'ምንም ኢንተርኔት ግንኙነት የውቤት';

  @override
  String get checkConnection => 'እባክዎ ኢንተርኔት ግንኙነት ይመልከቱ';

  @override
  String get welcome => 'ወደ AIVO ይምጣ';

  @override
  String get exploreProducts => 'አስ በሮ አሪካቴ ምርቶች ይፈልጉ';

  @override
  String get bestDeals => 'በቅርብ እቃዎች ላይ ታላቁ ስቂቅ';

  @override
  String get freeShipping => 'ነፃ ማሰራጫ በ 50 በላይ ትዕዛዞች';

  @override
  String rateStar(Object count) {
    return '$count ነጅ ስቂቅ';
  }

  @override
  String get rateReview => 'ደረጃ & ግምገማ';

  @override
  String get writeReview => 'ግምገማ ይጻፉ';

  @override
  String get reviewThanks => 'ግምገማዎ ለ አመሰግናለሁ!';

  @override
  String get helpful => 'ይህ ሊሠር ነበር?';

  @override
  String get yes => 'አዎ';

  @override
  String get no => 'ምንም';

  @override
  String get report => 'ይዘገቡ';

  @override
  String get deliveryAddress => 'የመላኪያ አድራሻ';

  @override
  String get selectAddress => 'አድራሻ ይምረጡ';

  @override
  String get changeAddress => 'አድራሻ ይቀይሩ';

  @override
  String get deliveryDate => 'የመላኪያ ሰሪ';

  @override
  String get estimatedTime => 'ተገምተው ሰዓት';

  @override
  String get orderPlaced => 'ትዕዛዝ ተቀመጠ';

  @override
  String get confirmed => 'ታረረገ';

  @override
  String get shipped => 'ተላኩ';

  @override
  String get outForDelivery => 'መለኪያ ሎ';

  @override
  String get delivered => 'ተሰጠ';

  @override
  String get returnRequested => 'ይደግሙ ተጠየቀ';

  @override
  String get returnProcessing => 'ይደግሙ ማብረር';

  @override
  String get returnCompleted => 'ይደግሙ ተፈጸመ';

  @override
  String get storeAvailability => 'ማዘዝ ዕቅብ';

  @override
  String get checkAvailability => 'ዕቅብ ይመልከቱ';

  @override
  String get inStock => 'ላይ ክምችት';

  @override
  String get outOfStock => 'ከሙሉ ወጪ';

  @override
  String get lowStock => 'ዝቅተኛ ዕቅብ';

  @override
  String get newItems => 'አዲስ ዕቃዎች ነፃ ማሰራጫ';

  @override
  String get blackFriday => 'ጥቁር ሮምዖ';

  @override
  String get discountCollection => 'ስብስብ';

  @override
  String get grabYoursNow => 'ሃላይ የሀገር ተያዙ';

  @override
  String get summerSale => 'የበጋ ሽያጭ';

  @override
  String get specialOffer => 'ልዩ ዋጋ';

  @override
  String get logInTitle => 'ይግባኝ';

  @override
  String get forgotPasswordButton => 'ይለፈፍ ረስተሃል?';

  @override
  String get dontHaveAccount => ' jamie ስሩ?';

  @override
  String get signUpButton => 'ይመዝገቡ';

  @override
  String get loginFailedError => 'ግባ ወደ ላይ ሳቅ';

  @override
  String get signupFailedError => 'ተመዝገቡ ወደ ላይ ሳቅ';

  @override
  String get passwordResetSent => 'ይለፍ ቃል ዳግም ያስጀምሩ ድርጅት ወደ ኢሜል ተላኩ!';

  @override
  String get resetPasswordError => 'ይለፍ ቃል ዳግም ያስጀምሩ ስህተት';

  @override
  String get emailPlaceholder => 'ኢሜል አድራሻ';

  @override
  String get passwordPlaceholder => 'ይለፈፍ';

  @override
  String get askQuestion => 'ጥያቄ ይጠይቁ';

  @override
  String get askQuestion1 => 'ጥያቄዎን ይጠይቁ';

  @override
  String get yourQuestion => 'ጥያቄዎ...';

  @override
  String get send => 'ይላኩ';

  @override
  String get popularFaq => 'ታዋቂ ጊዜ ብዙ ጊዜ ጠየቁ ጥያቄዎች';

  @override
  String get allFaq => 'ሁሉ ጊዜ ብዙ ጊዜ ጠየቁ ጥያቄዎች';

  @override
  String get noFaqAvailable => 'ምንም ጊዜ ብዙ ጊዜ ጠየቁ ጥያቄዎች አሁን';

  @override
  String get faqLike => 'ምርጥ';

  @override
  String get cookiePreferences => 'ኩክ ምርጫዎች';

  @override
  String get resetPreferences => 'ምርጫዎች ዳግም ያስጀምሩ';

  @override
  String get preferencesReset => 'ምርጫዎች ዳግም ተጀመሩ';

  @override
  String get theme => 'ርዕሰ ጽሑፍ';

  @override
  String get lightTheme => 'ብርሃን';

  @override
  String get darkTheme => 'ጥቁር';

  @override
  String get systemTheme => 'ሥርዓት';

  @override
  String get emptyWishlist => 'የምህዩ ዝርዝር ባዶ ነው';

  @override
  String get emptyWishlistDescription => 'ምርቶች ወደ የምህዩ ዝርዝር ጨምሩ በቀላሉ ማግኘት';

  @override
  String get myWishlist => 'ያኔ ወደ የምወድ ዝርዝር';

  @override
  String get deleteAll => 'ሁሉ ሰርዙ';

  @override
  String get addToWishlistError => 'ወደ የምህዩ ዝርዝር ማከል ይችሉ አልቻሉም';

  @override
  String get walletTitle => 'ወለታ';

  @override
  String get chargeBalance => '+ ሚዛን ሙሙ';

  @override
  String get logoutFailed => 'ውጣ ወደ ላይ ሳቅ';

  @override
  String get loggedOutSuccessfully => 'በተሳካ ሁኔታ ወጣ';

  @override
  String get returnsTitle => 'ተመላሾች';

  @override
  String get returnsComingSoon => 'ተመላሾች (በቅርቡ ይመጣል)';

  @override
  String get helpTitle => 'እርዳታ ይያዙ';

  @override
  String get helpComingSoon => 'እርዳታ (በቅርቡ ይመጣል)';

  @override
  String get selectLanguage2 => 'ቋንቋ ይምረጡ';

  @override
  String get searchLanguage => 'ቋንቋ ጀምር...';

  @override
  String get connection => 'ቅንብሮች';

  @override
  String get findItem => 'እርስዎ መጠየቁ ዕቅብ ያን';

  @override
  String get getShoppingBags => 'ግዢ ብጥቫ ሙሉ ያድርጉ';

  @override
  String get fastSecurePayment => 'ፍጥነት & ደህንነት ክፍያ';

  @override
  String get paymentOptions => 'ብዙ ክፍያ ምርጫዎች ቀላሉ';

  @override
  String get packageTracking => 'ጥቅል ተከታትሎ';

  @override
  String get nearbyStores => 'አጠገብ ይወክሉ';

  @override
  String get noBestSellers => 'ምንም ታላቅ አሸናፊ ያገኙ';

  @override
  String get noProducts => 'ምንም ምርትቶች ያገኙ';

  @override
  String get noFlashSale => 'ምንም ብልጭ ሽያጭ ምርቶች';

  @override
  String get noPopularProducts => 'No popular products';

  @override
  String get sizeGuideTitle => 'መጠን መመሪያ';

  @override
  String get checkStores => 'ይወክሉ ይመልከቱ';

  @override
  String get continueShoppingBtn => 'ግዋብ ሳቅ';

  @override
  String get checkoutBtn => 'ገዛ';

  @override
  String get sleevelessRuffleTitle => 'አንደበር ገብ ስፌቶች';

  @override
  String get findSomething => 'አንድ ሌላ ጀምር...';

  @override
  String get storeSettings => 'ቅንብሮች';

  @override
  String reviewsCount(Object count) {
    return '($count ግምገማዎች)';
  }

  @override
  String get welcomeBackTitle => 'እንደገና ተቀበለህ!';

  @override
  String get logInDescription => 'በመመዝገብ ወቅት ያስገባህ ውሂብህን በመጠቀም ይግባኝ።';

  @override
  String get logInFailedError => 'ይግባኝ ውድቅ ተደርጓል';

  @override
  String get skipButton => 'ዘለል';

  @override
  String get allFieldsRequired => 'ሁሉንም መስኮች ሙላት';
}
