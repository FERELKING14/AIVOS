// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Yoruba (`yo`).
class AppLocalizationsYo extends AppLocalizations {
  AppLocalizationsYo([String locale = 'yo']) : super(locale);

  @override
  String get appTitle => 'AIVO';

  @override
  String get appSubtitle => 'App Ẹkọ-Ìlàná';

  @override
  String get bottomNavShop => 'Ṣopu';

  @override
  String get bottomNavDiscover => 'Ṣawari';

  @override
  String get bottomNavBookmark => 'Ami Iwe';

  @override
  String get bottomNavBag => 'Ẹko';

  @override
  String get bottomNavProfile => 'Ìkọkọ';

  @override
  String get homeTitle => 'Ile';

  @override
  String get discoverTitle => 'Ṣawari';

  @override
  String get bookmarkTitle => 'Awọn Ami Iwe';

  @override
  String get cartTitle => 'Ẹko Ṣopu';

  @override
  String get profileTitle => 'Ìkọkọ';

  @override
  String get popularProducts => 'Àwọn Ọrunṣe Olokiki';

  @override
  String get flashSale => 'Ṣopu Fulasi';

  @override
  String get bestSellers => 'Ẹni ti o dara julo';

  @override
  String get mostPopular => 'Ti o jẹ olokiki julo';

  @override
  String get youMightAlsoLike => 'O le tun fe';

  @override
  String get categories => 'Awọn Ẹka';

  @override
  String get all => 'Gbogbo';

  @override
  String get men => 'Awọn okùnrin';

  @override
  String get women => 'Awọn obinrin';

  @override
  String get kids => 'Awọn omo';

  @override
  String get seeAll => 'Ri Gbogbo';

  @override
  String get search => 'Wa';

  @override
  String get notifications => 'Ìfitanná';

  @override
  String get productDetails => 'Awọn Itupale Ọrunṣe';

  @override
  String get productPrice => 'Idiyele';

  @override
  String get productRating => 'Iyika';

  @override
  String get productReviews => 'Awọn Atunwo';

  @override
  String get productReview => 'Atunwo';

  @override
  String get productDescription => 'Apejuwe';

  @override
  String get shippingInfo => 'Ìfitanná Iṣea';

  @override
  String get returnsPolicy => 'Awọn Iṣitubu';

  @override
  String get sizeGuide => 'Iwe Elu';

  @override
  String get addToCart => 'Fi Kun Ẹko';

  @override
  String get addedToCart => 'Ti Kun Ẹko';

  @override
  String get buyNow => 'Ra Bayi';

  @override
  String get notifyMe => 'Ṣe Mi Ajubọ';

  @override
  String get removeFromCart => 'Yi Ẹko le';

  @override
  String get cartEmpty => 'Ẹko rẹ tutu';

  @override
  String cartItemsCount(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count awọn nkan',
      one: '1 nkan',
      zero: 'Nkan ko si',
    );
    return '$_temp0';
  }

  @override
  String get checkout => 'Ti Gbale';

  @override
  String get continueShopping => 'Tẹsiwaju Ṣopu';

  @override
  String get subtotal => 'Apapọ Kekere';

  @override
  String get shipping => 'Iṣea';

  @override
  String get tax => 'Owe';

  @override
  String get total => 'Apapọ';

  @override
  String get applyCoupon => 'Lo Welu';

  @override
  String get couponCode => 'Koodu Welu';

  @override
  String get orderConfirmation => 'Ohun Elo Fifi';

  @override
  String get orderNumber => 'Nọmba Ohun Elo';

  @override
  String get estimatedDelivery => 'Igbesẹ Ti A Dapọ';

  @override
  String get orderTracking => 'Tẹle Ohun Elo';

  @override
  String get orders => 'Awọn Elo';

  @override
  String get orderHistory => 'Itan Ohun Elo';

  @override
  String get orderStatus => 'Isis Ohun Elo';

  @override
  String get addresses => 'Awọn Adiresi';

  @override
  String get addAddress => 'Fi Adiresi';

  @override
  String get editAddress => 'Ṣatele Adiresi';

  @override
  String get deleteAddress => 'Pa Adiresi';

  @override
  String get defaultAddress => 'Adiresi Isalẹ';

  @override
  String get setAsDefault => 'Ṣetele Bi Isalẹ';

  @override
  String get fullName => 'Orukọ Kikun';

  @override
  String get phoneNumber => 'Nọmba Fonu';

  @override
  String get streetAddress => 'Adiresi Ọna';

  @override
  String get city => 'Ilu';

  @override
  String get state => 'Ipinle';

  @override
  String get zipCode => 'Koodu Zip';

  @override
  String get country => 'Orileede';

  @override
  String get paymentMethod => 'Ọna Sisanwo';

  @override
  String get addPaymentMethod => 'Fi Ọna Sisanwo';

  @override
  String get cardName => 'Orukọ Kaadi';

  @override
  String get cardNumber => 'Nọmba Kaadi';

  @override
  String get expiryDate => 'Ọjọ Iyipada';

  @override
  String get cvv => 'CVV';

  @override
  String get userInfo => 'Alaye Olumulo';

  @override
  String get editProfile => 'Ṣatele Ìkọkọ';

  @override
  String get firstName => 'Orukọ Akọkọ';

  @override
  String get lastName => 'Orukọ Ikẹhin';

  @override
  String get email => 'Adiresi Imẹili';

  @override
  String get updateProfile => 'Mu Ìkọkọ';

  @override
  String get changePassword => 'Yi Ọrọ Isiro';

  @override
  String get currentPassword => 'Ọrọ Isiro Loni';

  @override
  String get newPassword => 'Ọrọ Isiro Tuntun';

  @override
  String get confirmPassword => 'Jẹrisi Ọrọ Isiro';

  @override
  String get preferences => 'Awọn Ohun Ti O I Nipẹ';

  @override
  String get enableNotifications => 'Ṣeto Ìfitanná';

  @override
  String get emailNotifications => 'Ìfitanná Imẹili';

  @override
  String get pushNotifications => 'Ìfitanná Ṣiṣe';

  @override
  String get smsNotifications => 'Ìfitanná SMS';

  @override
  String get language => 'Ede';

  @override
  String get english => 'English';

  @override
  String get french => 'Français';

  @override
  String get selectLanguage => 'Yan Ede';

  @override
  String get location => 'Ilu';

  @override
  String get settings => 'Awọn Iṣeto';

  @override
  String get helpSupport => 'Iranlọwọ & Atilẹyin';

  @override
  String get getHelp => 'Mu Iranlọwọ';

  @override
  String get faq => 'Awọn Ibeère Ti A Beère Igbagbo';

  @override
  String get contactUs => 'Kan Si Wa';

  @override
  String get aboutApp => 'Nipa AIVO';

  @override
  String get termsConditions => 'Awọn Igba & Awọn Eto';

  @override
  String get privacyPolicy => 'Ilana Isokan';

  @override
  String get login => 'Wòle';

  @override
  String get signup => 'Forukọsilẹ';

  @override
  String get signup_getStarted => 'Jeun lo!';

  @override
  String get signup_message => 'Jọwọ tẹ alaye ti o peye lati ṣẹda akọọlẹ.';

  @override
  String get logout => 'Jade';

  @override
  String get forgotPassword => 'Ṣubẹ Ọrọ Isiro?';

  @override
  String get passwordRecovery => 'Isiro Ọrọ Atunbasi';

  @override
  String get enterEmail => 'Tẹ adiresi imẹili rẹ';

  @override
  String get resetPassword => 'Tan Ọrọ Isiro';

  @override
  String get sendResetLink => 'Firanṣẹ Isipin Atunbasi';

  @override
  String get username => 'Orukọ Olumulo';

  @override
  String get password => 'Ọrọ Isiro';

  @override
  String get passwordConfirm => 'Jẹrisi Ọrọ Isiro';

  @override
  String get agreeTerms => 'Mo gbe Awọn Igba & Awọn Eto';

  @override
  String get haveAccount => 'Ṣe o ni akọọlẹ tẹlẹ?';

  @override
  String get noAccount => 'Ṣe o ko ni akọọlẹ?';

  @override
  String get continue_ => 'Tẹsiwaju';

  @override
  String get next => 'Atẹle';

  @override
  String get back => 'Pada';

  @override
  String get save => 'Gba';

  @override
  String get cancel => 'Fagile';

  @override
  String get delete => 'Pa';

  @override
  String get edit => 'Ṣatele';

  @override
  String get add => 'Fi';

  @override
  String get remove => 'Yi le';

  @override
  String get searchProducts => 'Wa awọn ọrunṣe';

  @override
  String get noResults => 'Ìwadii ko ri';

  @override
  String get filterBy => 'Tan Fun';

  @override
  String get sortBy => 'Gbe Fun';

  @override
  String get priceRange => 'Iyipo Idiyele';

  @override
  String get rating => 'Iyika';

  @override
  String get wishlist => 'Orodun Ti O Fẹ';

  @override
  String get addToWishlist => 'Fi Si Orodun Ti O Fẹ';

  @override
  String get removeFromWishlist => 'Yi Ninu Orodun Ti O Fẹ';

  @override
  String get savedItems => 'Awọn Nkan Ti A Gba';

  @override
  String get noBookmarks => 'Awọn ami iwe ko si';

  @override
  String get onSale => 'Ni Ṣopu';

  @override
  String get discount => 'Yiyara Idiyele';

  @override
  String get wallet => 'Iwọ Owo';

  @override
  String get balance => 'Iwọ';

  @override
  String get recharge => 'Tu Lẹ';

  @override
  String get transactions => 'Awọn Ade';

  @override
  String get walletHistory => 'Itan Iwọ Owo';

  @override
  String get error => 'Aṣiṣe';

  @override
  String get success => 'Aṣeyọri';

  @override
  String get warning => 'Oniyi';

  @override
  String get info => 'Ìfitanná';

  @override
  String get errorOccurred => 'Aṣiṣe ti ṣẹlẹ';

  @override
  String get tryAgain => 'Gbiyanju Lẹ';

  @override
  String get loading => 'N ṣiṣẹ...';

  @override
  String get comingSoon => 'N bọ Ni Isalẹ';

  @override
  String get noInternet => 'Ajọ Intanẹti ko si';

  @override
  String get checkConnection => 'Jọwọ ṣayẹwo asopọ intanẹti rẹ';

  @override
  String get welcome => 'Kaabo si AIVO';

  @override
  String get exploreProducts => 'Ṣawari awọn ọrunṣe iyalẹnu wa';

  @override
  String get bestDeals => 'Orisun ti o dara julo lori awọn nkan ti o fẹ';

  @override
  String get freeShipping => 'Iṣea opẹ lori awọn elo ti o ju 50';

  @override
  String rateStar(Object count) {
    return '$count ìya';
  }

  @override
  String get rateReview => 'Iyika & Atunwo';

  @override
  String get writeReview => 'Kọ Atunwo';

  @override
  String get reviewThanks => 'O ṣeun fun atunwo rẹ!';

  @override
  String get helpful => 'Ṣe eyi ranlọwọ?';

  @override
  String get yes => 'Bẹẹni';

  @override
  String get no => 'Rara';

  @override
  String get report => 'Jẹ ẹkọ';

  @override
  String get deliveryAddress => 'Adiresi Ifẹwasẹ';

  @override
  String get selectAddress => 'Yan Adiresi';

  @override
  String get changeAddress => 'Yi Adiresi';

  @override
  String get deliveryDate => 'Ọjọ Ifẹwasẹ';

  @override
  String get estimatedTime => 'Akoko Iṣaju';

  @override
  String get orderPlaced => 'Elo Ti Sile';

  @override
  String get confirmed => 'Jɛri';

  @override
  String get shipped => 'Ti Firanṣẹ';

  @override
  String get outForDelivery => 'Fun Ifẹwasẹ';

  @override
  String get delivered => 'Ti Gba';

  @override
  String get returnRequested => 'Ṣiṣẹ Iṣitubu';

  @override
  String get returnProcessing => 'Iṣitubu N sẹ';

  @override
  String get returnCompleted => 'Iṣitubu Ti Pari';

  @override
  String get storeAvailability => 'Ifẹ Ile Ṣopu';

  @override
  String get checkAvailability => 'Ṣayẹwo Ti o wa';

  @override
  String get inStock => 'Ninu Ile Ṣopu';

  @override
  String get outOfStock => 'Aisalẹ Ile Ṣopu';

  @override
  String get lowStock => 'Ile Ṣopu Kekere';

  @override
  String get newItems => 'Awọn Nkan Tuntun pẹlu Iṣea opẹ';

  @override
  String get blackFriday => 'Alaroko Dudu';

  @override
  String get discountCollection => 'Ikumponi';

  @override
  String get grabYoursNow => 'Ṣẹ ti rẹ bayii';

  @override
  String get summerSale => 'Ṣopu Opin';

  @override
  String get specialOffer => 'Ọfọ Iyalẹnu';

  @override
  String get logInTitle => 'Wọlé';

  @override
  String get forgotPasswordButton => 'Rántí ọ̀fìn ìsirí?';

  @override
  String get dontHaveAccount => 'Àkó lé àkáun?';

  @override
  String get signUpButton => 'Forígisá';

  @override
  String get loginFailedError => 'Wòle Kuna';

  @override
  String get signupFailedError => 'Forukọsilẹ Kuna';

  @override
  String get passwordResetSent =>
      'Isipin atunbasi ọrọ isiro ti firanṣẹ si imẹili rẹ!';

  @override
  String get resetPasswordError => 'Aṣiṣe atunbasi ọrọ isiro';

  @override
  String get emailPlaceholder => 'Ọ̀rọ̀ tí a fi rán';

  @override
  String get passwordPlaceholder => 'Ọ̀fìn ìsirí';

  @override
  String get askQuestion => 'Beere Ibeère';

  @override
  String get askQuestion1 => 'Beere ibeère rẹ';

  @override
  String get yourQuestion => 'Ibeère rẹ...';

  @override
  String get send => 'Firanṣẹ';

  @override
  String get popularFaq => 'Awọn Ibeère Ti Olokiki Beère';

  @override
  String get allFaq => 'Gbogbo Awọn Ibeère Beère';

  @override
  String get noFaqAvailable => 'Ko si awọn ibeère beère bayi';

  @override
  String get faqLike => 'Fẹ';

  @override
  String get cookiePreferences => 'Awọn Ohun Ti O I Nipẹ Cookie';

  @override
  String get resetPreferences => 'Tan Awọn Ohun Ti O I Nipẹ';

  @override
  String get preferencesReset => 'Awọn Ohun Ti O I Nipẹ Tan';

  @override
  String get theme => 'Orisun';

  @override
  String get lightTheme => 'Iyalẹ';

  @override
  String get darkTheme => 'Dudu';

  @override
  String get systemTheme => 'Eto';

  @override
  String get emptyWishlist => 'Orodun ti o fe rẹ tutu';

  @override
  String get emptyWishlistDescription =>
      'Fi awọn ọrunṣe kun orodun ti o fe lati wa wọn ni ironu';

  @override
  String get myWishlist => 'Orodun Orodun Rẹ';

  @override
  String get deleteAll => 'Pa Gbogbo';

  @override
  String get addToWishlistError => 'Ko le fi kun orodun ti o fe';

  @override
  String get walletTitle => 'Iwọ Owo';

  @override
  String get chargeBalance => '+ Tu Iwọ';

  @override
  String get logoutFailed => 'Jade Kuna';

  @override
  String get loggedOutSuccessfully => 'Jade Ti Aṣeyọri';

  @override
  String get returnsTitle => 'Awọn Iṣitubu';

  @override
  String get returnsComingSoon => 'Awọn Iṣitubu (N bọ Ni Isalẹ)';

  @override
  String get helpTitle => 'Mu Iranlọwọ';

  @override
  String get helpComingSoon => 'Iranlọwọ (N bọ Ni Isalẹ)';

  @override
  String get selectLanguage2 => 'Yan Ede';

  @override
  String get searchLanguage => 'Wa ede...';

  @override
  String get connection => 'Awọn Iṣeto';

  @override
  String get findItem => 'Wa ọrunṣe ti o n wa';

  @override
  String get getShoppingBags => 'Kun awọn ẹko ṣopu rẹ';

  @override
  String get fastSecurePayment => 'Ṣiṣẹ Mipara & Didan Sisanwo';

  @override
  String get paymentOptions => 'Ọpọ awọn ọna sisanwo wa fun irinu rẹ';

  @override
  String get packageTracking => 'Tẹle Apo';

  @override
  String get nearbyStores => 'Awọn Ile Ṣopu Nitosi';

  @override
  String get noBestSellers => 'Ẹni ko si ti o dara julo';

  @override
  String get noProducts => 'Ko si awọn ọrunṣe';

  @override
  String get noFlashSale => 'Ko si awọn ọrunṣe ṣopu fulasi';

  @override
  String get noPopularProducts => 'Ko si awọn ọrunṣe olokiki';

  @override
  String get sizeGuideTitle => 'Iwe Elu';

  @override
  String get checkStores => 'Ṣayẹwo Ile Ṣopu';

  @override
  String get continueShoppingBtn => 'Tẹsiwaju Ṣopu';

  @override
  String get checkoutBtn => 'Ti Gbale';

  @override
  String get sleevelessRuffleTitle => 'Aiwe Ruffles';

  @override
  String get findSomething => 'Wa nkan ...';

  @override
  String get storeSettings => 'Awọn Iṣeto';

  @override
  String reviewsCount(Object count) {
    return '($count Awọn Atunwo)';
  }

  @override
  String get welcomeBackTitle => 'Kaabọ̀ pẹ̀lú!';

  @override
  String get logInDescription => 'Wọlé pẹ̀lú data tí o tẹ̀ sí ajọ ìforígì.';

  @override
  String get logInFailedError => 'Wọ̀lé kúrò';

  @override
  String get skipButton => 'Fòlò';

  @override
  String get allFieldsRequired => 'Báwo ni a mọ alaye gbogbo àáye';
}
