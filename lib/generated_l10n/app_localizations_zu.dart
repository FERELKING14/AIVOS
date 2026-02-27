// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Zulu (`zu`).
class AppLocalizationsZu extends AppLocalizations {
  AppLocalizationsZu([String locale = 'zu']) : super(locale);

  @override
  String get appTitle => 'AIVO';

  @override
  String get appSubtitle => 'I-Commerce App';

  @override
  String get bottomNavShop => 'Ivenkile';

  @override
  String get bottomNavDiscover => 'Tholakala';

  @override
  String get bottomNavBookmark => 'Uphawu';

  @override
  String get bottomNavBag => 'Isithwali';

  @override
  String get bottomNavProfile => 'Umprofayili';

  @override
  String get homeTitle => 'Ekhaya';

  @override
  String get discoverTitle => 'Tholakala';

  @override
  String get bookmarkTitle => 'Amaphawu';

  @override
  String get cartTitle => 'Inkwali Yokulima';

  @override
  String get profileTitle => 'Umprofayili';

  @override
  String get popularProducts => 'Imikhiqizo Eyaziwayo';

  @override
  String get flashSale => 'Ukuthengisa Kwesikhukhumi';

  @override
  String get bestSellers => 'Abathengisi Abakuhle Kakhulu';

  @override
  String get mostPopular => 'Ezaziwayo Kunazo Zonke';

  @override
  String get youMightAlsoLike => 'Ungase Nothande Futhi';

  @override
  String get categories => 'Izigaba';

  @override
  String get all => 'Konke';

  @override
  String get men => 'Amadoda';

  @override
  String get women => 'Abesifazane';

  @override
  String get kids => 'Abantwana';

  @override
  String get seeAll => 'Bonisa Konke';

  @override
  String get search => 'Sesha';

  @override
  String get notifications => 'Izaziso';

  @override
  String get productDetails => 'Imininingwane Yemikhiqizo';

  @override
  String get productPrice => 'Intengo';

  @override
  String get productRating => 'Ukulinganisa';

  @override
  String get productReviews => 'Izibuyekezo';

  @override
  String get productReview => 'Isibuyekezo';

  @override
  String get productDescription => 'Incazelo';

  @override
  String get shippingInfo => 'Imininingwane Yokuthumela';

  @override
  String get returnsPolicy => 'Ubuyele';

  @override
  String get sizeGuide => 'Umhlahlandlela Wosayizi';

  @override
  String get addToCart => 'Engeza Enkinkathe';

  @override
  String get addedToCart => 'Kwengezwe Enkinkathe';

  @override
  String get buyNow => 'Thenga Manje';

  @override
  String get notifyMe => 'Ngitshele';

  @override
  String get removeFromCart => 'Susa Enkinkathe';

  @override
  String get cartEmpty => 'Inkinkathe Yakho Iyinxa';

  @override
  String cartItemsCount(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count izinto',
      one: 'Into enye',
      zero: 'Akukho zinto',
    );
    return '$_temp0';
  }

  @override
  String get checkout => 'Ukulandela';

  @override
  String get continueShopping => 'Qhubeka Nokuthengisa';

  @override
  String get subtotal => 'Isamba Esincane';

  @override
  String get shipping => 'Ukuthumela';

  @override
  String get tax => 'Itaksi';

  @override
  String get total => 'Total';

  @override
  String get applyCoupon => 'Sebenzisa I-Coupon';

  @override
  String get couponCode => 'Ikhodi Ye-Coupon';

  @override
  String get orderConfirmation => 'I-Oda Iyaqinisekile';

  @override
  String get orderNumber => 'Inombolo Ye-Order';

  @override
  String get estimatedDelivery => 'Ukulethelwa Okunethunjini';

  @override
  String get orderTracking => 'Landela I-Order';

  @override
  String get orders => 'Ama-Oda';

  @override
  String get orderHistory => 'Umlando We-Order';

  @override
  String get orderStatus => 'Isimo Se-Order';

  @override
  String get addresses => 'Amakomole';

  @override
  String get addAddress => 'Engeza Ikhomole';

  @override
  String get editAddress => 'Hlela Ikhomole';

  @override
  String get deleteAddress => 'Susa Ikhomole';

  @override
  String get defaultAddress => 'Ikhomole Okukhethekile';

  @override
  String get setAsDefault => 'Setha Njengokweminyakozelo';

  @override
  String get fullName => 'Igama Eliphelele';

  @override
  String get phoneNumber => 'Inombolo Yefoni';

  @override
  String get streetAddress => 'Ikhomole Lomgwaqo';

  @override
  String get city => 'Umjiji';

  @override
  String get state => 'Ifastela';

  @override
  String get zipCode => 'Ikhodi Ye-Zip';

  @override
  String get country => 'Izwe';

  @override
  String get paymentMethod => 'Indlela Yokukhokhela';

  @override
  String get addPaymentMethod => 'Engeza Indlela Yokukhokhela';

  @override
  String get cardName => 'Igama Le-Card';

  @override
  String get cardNumber => 'Inombolo Ye-Card';

  @override
  String get expiryDate => 'Usuku Lokumiswa';

  @override
  String get cvv => 'CVV';

  @override
  String get userInfo => 'Imininingwane Yomsebenzisi';

  @override
  String get editProfile => 'Hlela Umprofayili';

  @override
  String get firstName => 'Igama Lokuqala';

  @override
  String get lastName => 'Isigamelo Sokugcina';

  @override
  String get email => 'Ikheli Le-Email';

  @override
  String get updateProfile => 'Kubuyekezelwe Umprofayili';

  @override
  String get changePassword => 'Shintsha Iphasiwedi';

  @override
  String get currentPassword => 'Iphasiwedi Yangoku';

  @override
  String get newPassword => 'Iphasiwedi Entsha';

  @override
  String get confirmPassword => 'Qinisekisa Iphasiwedi';

  @override
  String get preferences => 'Izinto Ezithandwayo';

  @override
  String get enableNotifications => 'Nika Amandla Ezaziso';

  @override
  String get emailNotifications => 'Izaziso Ze-Email';

  @override
  String get pushNotifications => 'Izaziso Zokuthiskisa';

  @override
  String get smsNotifications => 'Izaziso Ze-SMS';

  @override
  String get language => 'Ulimi';

  @override
  String get english => 'English';

  @override
  String get french => 'Français';

  @override
  String get selectLanguage => 'Khetha Ulimi';

  @override
  String get location => 'Indawo';

  @override
  String get settings => 'Imihlelo';

  @override
  String get helpSupport => 'Usizo & Ukusekela';

  @override
  String get getHelp => 'Zama Usizo';

  @override
  String get faq => 'Imibuzo Ebutelwe Kaningi';

  @override
  String get contactUs => 'Xhumana Nathi';

  @override
  String get aboutApp => 'Mayelana Ne-AIVO';

  @override
  String get termsConditions => 'Amagama & Imigomo';

  @override
  String get privacyPolicy => 'Umgwaqo Wamagalelo';

  @override
  String get login => 'Ngena';

  @override
  String get signup => 'Bhalisela';

  @override
  String get signup_getStarted => 'Ake siqalise!';

  @override
  String get signup_message =>
      'Sicela ufake ulwazi olulungile ukuze udluze i-akhawunti.';

  @override
  String get logout => 'Jika ngaphandle';

  @override
  String get forgotPassword => 'Ukhohlwe Iphasiwedi?';

  @override
  String get passwordRecovery => 'Ukubuyela Iphasiwedi';

  @override
  String get enterEmail => 'Ufake ikheli lakho le-email';

  @override
  String get resetPassword => 'Setha kabusha I-Pasiwedi';

  @override
  String get sendResetLink => 'Thumela I-Link Yokusetha Kabusha';

  @override
  String get username => 'Igama Lomsebenzisi';

  @override
  String get password => 'Iphasiwedi';

  @override
  String get passwordConfirm => 'Qinisekisa I-Pasiwedi';

  @override
  String get agreeTerms => 'Ngiyavuma Amagama & Imigomo';

  @override
  String get haveAccount => 'Uyase I-akhawunti yini?';

  @override
  String get noAccount => 'Awunayo I-akhawunti?';

  @override
  String get continue_ => 'Qhubeka';

  @override
  String get next => 'Okulandelayo';

  @override
  String get back => 'Emuva';

  @override
  String get save => 'Londoloza';

  @override
  String get cancel => 'Khansela';

  @override
  String get delete => 'Susa';

  @override
  String get edit => 'Hlela';

  @override
  String get add => 'Engeza';

  @override
  String get remove => 'Susa';

  @override
  String get searchProducts => 'Sesha imikhiqizo';

  @override
  String get noResults => 'Azikho izithwala';

  @override
  String get filterBy => 'Hlela Nge';

  @override
  String get sortBy => 'Hlukahluka Nge';

  @override
  String get priceRange => 'Isikhathi Sentengo';

  @override
  String get rating => 'Ukulinganisa';

  @override
  String get wishlist => 'Ulwazi Lokuthanda';

  @override
  String get addToWishlist => 'Engeza Kulwazi Lokuthanda';

  @override
  String get removeFromWishlist => 'Susa Kulwazi Lokuthanda';

  @override
  String get savedItems => 'Izinto Ezilondolozwe';

  @override
  String get noBookmarks => 'Akakunaphawu';

  @override
  String get onSale => 'Nokutengeziwe';

  @override
  String get discount => 'Okukhokhela';

  @override
  String get wallet => 'Imali';

  @override
  String get balance => 'Isikwelekwete';

  @override
  String get recharge => 'Phakamisa';

  @override
  String get transactions => 'Izitransakhishini';

  @override
  String get walletHistory => 'Umlando Wemali';

  @override
  String get error => 'Iphutha';

  @override
  String get success => 'Impumelelo';

  @override
  String get warning => 'Isexwayiso';

  @override
  String get info => 'Imininingwane';

  @override
  String get errorOccurred => 'Iphutha lalitholakala';

  @override
  String get tryAgain => 'Zama Futhi';

  @override
  String get loading => 'Ilayode...';

  @override
  String get comingSoon => 'Uzofika Kamuva';

  @override
  String get noInternet => 'Akukho Ukuxhumeka I-Internet';

  @override
  String get checkConnection =>
      'Sicela ubalazele ukuxhumeka kwe-Internet kwakho';

  @override
  String get welcome => 'Sizwakalile I-AIVO';

  @override
  String get exploreProducts => 'Tholakala imikhiqizo yethu eyakudumala';

  @override
  String get bestDeals => 'Indenimali enhle kakhulu ku-izinto ozithandayo';

  @override
  String get freeShipping => 'Ukuthumela okukhululekile kuhla ama-order 50';

  @override
  String rateStar(Object count) {
    return '$count inkanyezi';
  }

  @override
  String get rateReview => 'Linganisa & Buyekezo';

  @override
  String get writeReview => 'Bhala Isibuyekezo';

  @override
  String get reviewThanks => 'Ngiyabonga eyisibuyekezo sakho!';

  @override
  String get helpful => 'Ingaba lokhu kwanusiza?';

  @override
  String get yes => 'Yebo';

  @override
  String get no => 'Cha';

  @override
  String get report => 'Menyeza';

  @override
  String get deliveryAddress => 'Ikhomole Lokuhambisela';

  @override
  String get selectAddress => 'Khetha I-Address';

  @override
  String get changeAddress => 'Shintsha I-Address';

  @override
  String get deliveryDate => 'Usuku Lokuhambisela';

  @override
  String get estimatedTime => 'Isikhathi Sokulinganisa';

  @override
  String get orderPlaced => 'Oda ELikhisiwe';

  @override
  String get confirmed => 'Iqinisekile';

  @override
  String get shipped => 'Ithumwe';

  @override
  String get outForDelivery => 'Kuhambisela';

  @override
  String get delivered => 'Ivunyelwe';

  @override
  String get returnRequested => 'Ubuyele Bucelwe';

  @override
  String get returnProcessing => 'Ubuyele Busebenziswa';

  @override
  String get returnCompleted => 'Ubuyele Buphelile';

  @override
  String get storeAvailability => 'Ukuthola Kule Sivikili';

  @override
  String get checkAvailability => 'Hlola Ukuthola';

  @override
  String get inStock => 'Kusetho';

  @override
  String get outOfStock => 'Phandle Kwesetho';

  @override
  String get lowStock => 'Isetho Eliphansi';

  @override
  String get newItems => 'Izinto Ezintsha kanye Nokuthumela Okukhululekile';

  @override
  String get blackFriday => 'Umsombela Omnyama';

  @override
  String get discountCollection => 'Okukungenisela';

  @override
  String get grabYoursNow => 'Zihute kwamanje';

  @override
  String get summerSale => 'Intengiso Yesikhathi Sokuphumela';

  @override
  String get specialOffer => 'Isiphakamiso Esikhethekile';

  @override
  String get logInTitle => 'Ngena';

  @override
  String get forgotPasswordButton => 'Ukhohlwe Iphasiwedi?';

  @override
  String get dontHaveAccount => 'Awunayo I-akhawunti?';

  @override
  String get signUpButton => 'Bhalisela';

  @override
  String get loginFailedError => 'Ukungena Akuphumelele';

  @override
  String get signupFailedError => 'Ukubhalisela Akuphumelele';

  @override
  String get passwordResetSent =>
      'Isixhumanisi sokusetha kabusha iphasiwedi sithumelwe ku-imeyili yakho!';

  @override
  String get resetPasswordError => 'Iphutha lokuwusetha kabusha iphasiwedi';

  @override
  String get emailPlaceholder => 'Ikheli le-Email';

  @override
  String get passwordPlaceholder => 'Iphasiwedi';

  @override
  String get askQuestion => 'Buza Umbuzo';

  @override
  String get askQuestion1 => 'Buza umbuzo wakho';

  @override
  String get yourQuestion => 'Umbuzo wakho...';

  @override
  String get send => 'Thumela';

  @override
  String get popularFaq => 'Imibuzo Eyaziwayo Ebutelwe Kaningi';

  @override
  String get allFaq => 'Yonke Imibuzo Ebutelwe Kaningi';

  @override
  String get noFaqAvailable =>
      'Akukho mibuzo ebutelwe kaningi ngalesi sikhathi';

  @override
  String get faqLike => 'Thande';

  @override
  String get cookiePreferences => 'Izinto Ezithandwayo Ze-Cookie';

  @override
  String get resetPreferences => 'Setha kabusha izinto ezithandwayo';

  @override
  String get preferencesReset => 'Izinto Ezithandwayo Setha Kabusha';

  @override
  String get theme => 'Isihloko';

  @override
  String get lightTheme => 'Okukhanya';

  @override
  String get darkTheme => 'Umnyama';

  @override
  String get systemTheme => 'Uhlelo';

  @override
  String get emptyWishlist => 'Ulwazi lokuthanda lwakho uyinxa';

  @override
  String get emptyWishlistDescription =>
      'Engeza imikhiqizo kulwazi lokuthanda lokuze uyitholakale kalula';

  @override
  String get myWishlist => 'Ulwazi Lami Lokuthanda';

  @override
  String get deleteAll => 'Susa Konke';

  @override
  String get addToWishlistError => 'Ayikwazi ukwengeza kulwazi lokuthanda';

  @override
  String get walletTitle => 'Imali';

  @override
  String get chargeBalance => '+ Phakamisa Isikwelekwete';

  @override
  String get logoutFailed => 'Ukuphuma Akuphumelele';

  @override
  String get loggedOutSuccessfully => 'Uphume Ngempumelelo';

  @override
  String get returnsTitle => 'Ubuyele';

  @override
  String get returnsComingSoon => 'Ubuyele (Uzofika Kamuva)';

  @override
  String get helpTitle => 'Zama Usizo';

  @override
  String get helpComingSoon => 'Usizo (Uzofika Kamuva)';

  @override
  String get selectLanguage2 => 'Khetha Ulimi';

  @override
  String get searchLanguage => 'Sesha ulimi...';

  @override
  String get connection => 'Imihlelo';

  @override
  String get findItem => 'Tholakala into oyizingayo';

  @override
  String get getShoppingBags => 'Gcwalisa amabhegi akho wokuthenga';

  @override
  String get fastSecurePayment => 'Okuqalekazi Nomthamo Wokukhokhela';

  @override
  String get paymentOptions =>
      'Eziningi izindlela zokukhokhela ezitholakalayo ngezinhloko';

  @override
  String get packageTracking => 'Landela Ipakithe';

  @override
  String get nearbyStores => 'Izivikili Ezikufutshane';

  @override
  String get noBestSellers => 'Akukho abothengisi abakuhle kakhulu';

  @override
  String get noProducts => 'Akukho mikhiqizo itholakala';

  @override
  String get noFlashSale => 'Akukho imikhiqizo yokuthungisa kwesikhukhumi';

  @override
  String get noPopularProducts => 'Akukho imikhiqizo eyaziwayo';

  @override
  String get sizeGuideTitle => 'Umhlahlandlela Wosayizi';

  @override
  String get checkStores => 'Hlola Izivikili';

  @override
  String get continueShoppingBtn => 'Qhubeka Nokuthengisa';

  @override
  String get checkoutBtn => 'Ukulandela';

  @override
  String get sleevelessRuffleTitle => 'Ingaphansi Ruffles';

  @override
  String get findSomething => 'Tholakala nto...';

  @override
  String get storeSettings => 'Imihlelo';

  @override
  String reviewsCount(Object count) {
    return '($count Izibuyekezo)';
  }
}
