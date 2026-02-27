// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Swahili (`sw`).
class AppLocalizationsSw extends AppLocalizations {
  AppLocalizationsSw([String locale = 'sw']) : super(locale);

  @override
  String get appTitle => 'AIVO';

  @override
  String get appSubtitle => 'Programu ya Biashara';

  @override
  String get bottomNavShop => 'Duka';

  @override
  String get bottomNavDiscover => 'Gundua';

  @override
  String get bottomNavBookmark => 'Alama';

  @override
  String get bottomNavBag => 'Mfuko';

  @override
  String get bottomNavProfile => 'Wasifu';

  @override
  String get homeTitle => 'Nyumbani';

  @override
  String get discoverTitle => 'Gundua';

  @override
  String get bookmarkTitle => 'Alama';

  @override
  String get cartTitle => 'Kadi ya Ununuzi';

  @override
  String get profileTitle => 'Wasifu';

  @override
  String get popularProducts => 'Bidhaa Maajabu';

  @override
  String get flashSale => 'Mauzo ya Haraka';

  @override
  String get bestSellers => 'Jina Lisilo na Kundi';

  @override
  String get mostPopular => 'Karibu sana Maajabu';

  @override
  String get youMightAlsoLike => 'Huenda pia upende';

  @override
  String get categories => 'Aina';

  @override
  String get all => 'Zote';

  @override
  String get men => 'Wanaume';

  @override
  String get women => 'Wanawake';

  @override
  String get kids => 'Watoto';

  @override
  String get seeAll => 'Tazama Zote';

  @override
  String get search => 'Tafuta';

  @override
  String get notifications => 'Arifa';

  @override
  String get productDetails => 'Maelezo ya Bidhaa';

  @override
  String get productPrice => 'Bei';

  @override
  String get productRating => 'Kiwango';

  @override
  String get productReviews => 'Mapamaji';

  @override
  String get productReview => 'Mapamaji';

  @override
  String get productDescription => 'Maelezo';

  @override
  String get shippingInfo => 'Habari za Usambazaji';

  @override
  String get returnsPolicy => 'Kurudishwa';

  @override
  String get sizeGuide => 'Mwongozo wa Ukubwa';

  @override
  String get addToCart => 'Ongeza kwa Kadi';

  @override
  String get addedToCart => 'Imeongezwa kwa Kadi';

  @override
  String get buyNow => 'Nunua Sasa';

  @override
  String get notifyMe => 'Nijulishe';

  @override
  String get removeFromCart => 'Ondoa kutoka Kadi';

  @override
  String get cartEmpty => 'Kadi yako ni tupu';

  @override
  String cartItemsCount(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count vitu',
      one: 'Kitu 1',
      zero: 'Hakuna vitu',
    );
    return '$_temp0';
  }

  @override
  String get checkout => 'Kumaliza';

  @override
  String get continueShopping => 'Endelea na Ununuzi';

  @override
  String get subtotal => 'Jumla ndogo';

  @override
  String get shipping => 'Usambazaji';

  @override
  String get tax => 'Kodi';

  @override
  String get total => 'Jumla';

  @override
  String get applyCoupon => 'Tumia Karata';

  @override
  String get couponCode => 'Kikomo cha Karata';

  @override
  String get orderConfirmation => 'Amri Imethibitisha';

  @override
  String get orderNumber => 'Namba ya Amri';

  @override
  String get estimatedDelivery => 'Kupokelewa Kinadhani';

  @override
  String get orderTracking => 'Fuatilia Amri';

  @override
  String get orders => 'Amri';

  @override
  String get orderHistory => 'Historia ya Amri';

  @override
  String get orderStatus => 'Hali ya Amri';

  @override
  String get addresses => 'Anwani';

  @override
  String get addAddress => 'Ongeza Anwani';

  @override
  String get editAddress => 'Hariri Anwani';

  @override
  String get deleteAddress => 'Futa Anwani';

  @override
  String get defaultAddress => 'Anwani Kawaida';

  @override
  String get setAsDefault => 'Weka kama Kawaida';

  @override
  String get fullName => 'Jina Kamili';

  @override
  String get phoneNumber => 'Namba ya Simu';

  @override
  String get streetAddress => 'Anwani ya Barabara';

  @override
  String get city => 'Jiji';

  @override
  String get state => 'Jimbo';

  @override
  String get zipCode => 'Namba ya Posta';

  @override
  String get country => 'Nchi';

  @override
  String get paymentMethod => 'Njia ya Malipo';

  @override
  String get addPaymentMethod => 'Ongeza Njia ya Malipo';

  @override
  String get cardName => 'Jina la Kadi';

  @override
  String get cardNumber => 'Namba ya Kadi';

  @override
  String get expiryDate => 'Tarehe ya Kumalizika';

  @override
  String get cvv => 'CVV';

  @override
  String get userInfo => 'Taarifa za Mtumiaji';

  @override
  String get editProfile => 'Hariri Wasifu';

  @override
  String get firstName => 'Jina la Kwanza';

  @override
  String get lastName => 'Jina la Mwisho';

  @override
  String get email => 'Anwani ya Barua';

  @override
  String get updateProfile => 'Sasisha Wasifu';

  @override
  String get changePassword => 'Badilisha Neno la Siri';

  @override
  String get currentPassword => 'Neno la Siri la Sasa';

  @override
  String get newPassword => 'Neno la Siri Jipya';

  @override
  String get confirmPassword => 'Thibitisha Neno la Siri';

  @override
  String get preferences => 'Mapenzi';

  @override
  String get enableNotifications => 'Wezesha Arifa';

  @override
  String get emailNotifications => 'Arifa za Barua';

  @override
  String get pushNotifications => 'Arifa za Kusukuma';

  @override
  String get smsNotifications => 'Arifa za SMS';

  @override
  String get language => 'Lugha';

  @override
  String get english => 'English';

  @override
  String get french => 'Français';

  @override
  String get selectLanguage => 'Chagua Lugha';

  @override
  String get location => 'Mahali';

  @override
  String get settings => 'Mipango';

  @override
  String get helpSupport => 'Usaidizi & Msaada';

  @override
  String get getHelp => 'Pata Usaidizi';

  @override
  String get faq => 'Maswali Yanayoulizwa Sana';

  @override
  String get contactUs => 'Wasiliana Nasi';

  @override
  String get aboutApp => 'Kuhusu AIVO';

  @override
  String get termsConditions => 'Masharti na Hali';

  @override
  String get privacyPolicy => 'Sera ya Faragha';

  @override
  String get login => 'Ingia';

  @override
  String get signup => 'Jandali';

  @override
  String get signup_getStarted => 'Mitende!';

  @override
  String get signup_message =>
      'Tafadhali ingiza taarifa sahihi ili kuunda akaunti.';

  @override
  String get logout => 'Toka';

  @override
  String get forgotPassword => 'Umesahau Neno la Siri?';

  @override
  String get passwordRecovery => 'Kurudishwa kwa Neno la Siri';

  @override
  String get enterEmail => 'Ingiza anwani yako ya barua';

  @override
  String get resetPassword => 'Seti tena Neno la Siri';

  @override
  String get sendResetLink => 'Tuma Kiungo cha Kuseti tena';

  @override
  String get username => 'Jina la Mtumiaji';

  @override
  String get password => 'Neno la Siri';

  @override
  String get passwordConfirm => 'Thibitisha Neno la Siri';

  @override
  String get agreeTerms => 'Nakubali Masharti na Hali';

  @override
  String get haveAccount => 'Je, tayari una akaunti?';

  @override
  String get noAccount => 'Huna akaunti?';

  @override
  String get continue_ => 'Endelea';

  @override
  String get next => 'Inayofuata';

  @override
  String get back => 'Nyuma';

  @override
  String get save => 'Hifadhi';

  @override
  String get cancel => 'Kataa';

  @override
  String get delete => 'Futa';

  @override
  String get edit => 'Hariri';

  @override
  String get add => 'Ongeza';

  @override
  String get remove => 'Ondoa';

  @override
  String get searchProducts => 'Tafuta bidhaa';

  @override
  String get noResults => 'Hakuna matokeo yaliyopatikana';

  @override
  String get filterBy => 'Changia Kwa';

  @override
  String get sortBy => 'Panga Kwa';

  @override
  String get priceRange => 'Upeo wa Bei';

  @override
  String get rating => 'Kiwango';

  @override
  String get wishlist => 'Orodha ya Matakwa';

  @override
  String get addToWishlist => 'Ongeza kwa Orodha ya Matakwa';

  @override
  String get removeFromWishlist => 'Ondoa kutoka Orodha ya Matakwa';

  @override
  String get savedItems => 'Vitu Vilivyohifadhiwa';

  @override
  String get noBookmarks => 'Hakuna alama tata';

  @override
  String get onSale => 'Kwa Mauzo';

  @override
  String get discount => 'Punguzo';

  @override
  String get wallet => 'Foleni';

  @override
  String get balance => 'Salio';

  @override
  String get recharge => 'Jaza tena';

  @override
  String get transactions => 'Miamala';

  @override
  String get walletHistory => 'Historia ya Foleni';

  @override
  String get error => 'Kosa';

  @override
  String get success => 'Mafanikio';

  @override
  String get warning => 'Onyo';

  @override
  String get info => 'Taarifa';

  @override
  String get errorOccurred => 'Kosa lilitokea';

  @override
  String get tryAgain => 'Jaribu tena';

  @override
  String get loading => 'Inapakia...';

  @override
  String get comingSoon => 'Inakuja Karibuni';

  @override
  String get noInternet => 'Hakuna Muunganisho wa Intaneti';

  @override
  String get checkConnection =>
      'Tafadhali angalia muunganisho wako wa intaneti';

  @override
  String get welcome => 'Karibu AIVO';

  @override
  String get exploreProducts => 'Chunguza bidhaa zetu za ajabu';

  @override
  String get bestDeals => 'Makupuni bora kwenye vitu vyako vya kupenda';

  @override
  String get freeShipping => 'Usambazaji wa bure kwa amri zaidi ya 50';

  @override
  String rateStar(Object count) {
    return '$count nyota';
  }

  @override
  String get rateReview => 'Kiwango & Mapamaji';

  @override
  String get writeReview => 'Andika Mapamaji';

  @override
  String get reviewThanks => 'Asante kwa mapamaji yako!';

  @override
  String get helpful => 'Je, hii ilikuwa na msaada?';

  @override
  String get yes => 'Ndiyo';

  @override
  String get no => 'Hapana';

  @override
  String get report => 'Ripoti';

  @override
  String get deliveryAddress => 'Anwani ya Kupokelewa';

  @override
  String get selectAddress => 'Chagua Anwani';

  @override
  String get changeAddress => 'Badilisha Anwani';

  @override
  String get deliveryDate => 'Tarehe ya Kupokelewa';

  @override
  String get estimatedTime => 'Wakati unaokadiriwa';

  @override
  String get orderPlaced => 'Amri Iliyowekwa';

  @override
  String get confirmed => 'Imethibitisha';

  @override
  String get shipped => 'Iliyotumwa';

  @override
  String get outForDelivery => 'Kwa Kupokelewa';

  @override
  String get delivered => 'Iliyopokelewa';

  @override
  String get returnRequested => 'Kurudisha Kuombolezwa';

  @override
  String get returnProcessing => 'Kurudisha Kutengenezwa';

  @override
  String get returnCompleted => 'Kurudisha Kukamilika';

  @override
  String get storeAvailability => 'Kupatikana kwa Duka';

  @override
  String get checkAvailability => 'Angalia Kupatikana';

  @override
  String get inStock => 'Katika Soko';

  @override
  String get outOfStock => 'Nje ya Soko';

  @override
  String get lowStock => 'Soko Chache';

  @override
  String get newItems => 'Vitu vipya na Usambazaji wa bure';

  @override
  String get blackFriday => 'Ijumaa Nyeusi';

  @override
  String get discountCollection => 'Mkusanyiko';

  @override
  String get grabYoursNow => 'Jichukulie lako sasa';

  @override
  String get summerSale => 'Mauzo ya Kiangazi';

  @override
  String get specialOffer => 'Zawadi Maalum';

  @override
  String get logInTitle => 'Ingia';

  @override
  String get forgotPasswordButton => 'Umesahau Neno la Siri?';

  @override
  String get dontHaveAccount => 'Huna akaunti?';

  @override
  String get signUpButton => 'Jandali';

  @override
  String get loginFailedError => 'Ingia Hakuniwezi';

  @override
  String get signupFailedError => 'Jandali Hakuniwezi';

  @override
  String get passwordResetSent =>
      'Kiungo cha kuseti neno la siri lilitumwa kwa barua yako!';

  @override
  String get resetPasswordError => 'Kosa la kuseti neno la siri';

  @override
  String get emailPlaceholder => 'Anwani ya Barua';

  @override
  String get passwordPlaceholder => 'Neno la Siri';

  @override
  String get askQuestion => 'Uliza Swali';

  @override
  String get askQuestion1 => 'Uliza swali lako';

  @override
  String get yourQuestion => 'Swali lako...';

  @override
  String get send => 'Tuma';

  @override
  String get popularFaq => 'Maswali Maajabu Yanayoulizwa Sana';

  @override
  String get allFaq => 'Maswali Yote Yanayoulizwa Sana';

  @override
  String get noFaqAvailable => 'Hakuna maswali yanayoulizwa sana kwa sasa';

  @override
  String get faqLike => 'Kama';

  @override
  String get cookiePreferences => 'Mapenzi ya Kuki';

  @override
  String get resetPreferences => 'Seti tena Mapenzi';

  @override
  String get preferencesReset => 'Mapenzi Seti tena';

  @override
  String get theme => 'Mada';

  @override
  String get lightTheme => 'Mwanga';

  @override
  String get darkTheme => 'Giza';

  @override
  String get systemTheme => 'Mfumo';

  @override
  String get emptyWishlist => 'Orodha yako ya matakwa ni tupu';

  @override
  String get emptyWishlistDescription =>
      'Ongeza bidhaa kwa orodha yako ya matakwa ili kuzipatia kwa urahisi';

  @override
  String get myWishlist => 'Orodha Yangu ya Matakwa';

  @override
  String get deleteAll => 'Futa Zote';

  @override
  String get addToWishlistError => 'Haiwezi kuongeza kwa orodha ya matakwa';

  @override
  String get walletTitle => 'Foleni';

  @override
  String get chargeBalance => '+ Jaza Salio';

  @override
  String get logoutFailed => 'Toka Hakuniwezi';

  @override
  String get loggedOutSuccessfully => 'Umefanikiwa Kutoka';

  @override
  String get returnsTitle => 'Kurudishwa';

  @override
  String get returnsComingSoon => 'Kurudishwa (Inakuja Karibuni)';

  @override
  String get helpTitle => 'Pata Usaidizi';

  @override
  String get helpComingSoon => 'Usaidizi (Inakuja Karibuni)';

  @override
  String get selectLanguage2 => 'Chagua Lugha';

  @override
  String get searchLanguage => 'Tafuta lugha...';

  @override
  String get connection => 'Mipango';

  @override
  String get findItem => 'Tafuta bidhaa uliyokuwa ukitafuta';

  @override
  String get getShoppingBags => 'Jaza mifuko yako ya ununuzi';

  @override
  String get fastSecurePayment => 'Malipo ya Haraka na Salama';

  @override
  String get paymentOptions =>
      'Kuna chaguo nyingi za malipo zinazopatikana kwa ajili yako';

  @override
  String get packageTracking => 'Fuatilia Pakiti';

  @override
  String get nearbyStores => 'Maduka Yaliyokaribiana';

  @override
  String get noBestSellers => 'Hakuna jina lisilo na kundi linalozuia';

  @override
  String get noProducts => 'Hakuna bidhaa zinazopatikana';

  @override
  String get noFlashSale => 'Hakuna bidhaa za mauzo ya haraka';

  @override
  String get noPopularProducts => 'Hakuna bidhaa maajabu';

  @override
  String get sizeGuideTitle => 'Mwongozo wa Ukubwa';

  @override
  String get checkStores => 'Angalia Maduka';

  @override
  String get continueShoppingBtn => 'Endelea na Ununuzi';

  @override
  String get checkoutBtn => 'Kumaliza';

  @override
  String get sleevelessRuffleTitle => 'Bila Mikono Ruffles';

  @override
  String get findSomething => 'Tafuta kitu...';

  @override
  String get storeSettings => 'Mipango';

  @override
  String reviewsCount(Object count) {
    return '($count Mapamaji)';
  }
}
