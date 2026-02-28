// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get appTitle => 'AIVO';

  @override
  String get appSubtitle => 'Application E-Commerce';

  @override
  String get bottomNavShop => 'Boutique';

  @override
  String get bottomNavDiscover => 'Découvrir';

  @override
  String get bottomNavBookmark => 'Favoris';

  @override
  String get bottomNavBag => 'Panier';

  @override
  String get bottomNavProfile => 'Profil';

  @override
  String get homeTitle => 'Accueil';

  @override
  String get discoverTitle => 'Découvrir';

  @override
  String get bookmarkTitle => 'Favoris';

  @override
  String get cartTitle => 'Panier';

  @override
  String get profileTitle => 'Profil';

  @override
  String get popularProducts => 'Produits Populaires';

  @override
  String get flashSale => 'Vente Éclair';

  @override
  String get bestSellers => 'Nos Best-Sellers';

  @override
  String get mostPopular => 'Plus Populaires';

  @override
  String get youMightAlsoLike => 'Vous aimerez peut-être aussi';

  @override
  String get categories => 'Catégories';

  @override
  String get all => 'Tous';

  @override
  String get men => 'Hommes';

  @override
  String get women => 'Femmes';

  @override
  String get kids => 'Enfants';

  @override
  String get seeAll => 'Voir tout';

  @override
  String get search => 'Recherche';

  @override
  String get notifications => 'Notifications';

  @override
  String get productDetails => 'Détails du produit';

  @override
  String get productPrice => 'Prix';

  @override
  String get productRating => 'Note';

  @override
  String get productReviews => 'Avis';

  @override
  String get productReview => 'Avis';

  @override
  String get productDescription => 'Description';

  @override
  String get shippingInfo => 'Informations d\'expédition';

  @override
  String get returnsPolicy => 'Retours';

  @override
  String get sizeGuide => 'Guide des tailles';

  @override
  String get addToCart => 'Ajouter au panier';

  @override
  String get addedToCart => 'Ajouté au panier';

  @override
  String get buyNow => 'Acheter maintenant';

  @override
  String get notifyMe => 'Me notifier';

  @override
  String get removeFromCart => 'Retirer du panier';

  @override
  String get cartEmpty => 'Votre panier est vide';

  @override
  String cartItemsCount(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count articles',
      one: '1 article',
      zero: 'Aucun article',
    );
    return '$_temp0';
  }

  @override
  String get checkout => 'Valider l\'achat';

  @override
  String get continueShopping => 'Continuer vos achats';

  @override
  String get subtotal => 'Sous-total';

  @override
  String get shipping => 'Livraison';

  @override
  String get tax => 'Taxes';

  @override
  String get total => 'Total';

  @override
  String get applyCoupon => 'Appliquer un coupon';

  @override
  String get couponCode => 'Code coupon';

  @override
  String get orderConfirmation => 'Commande confirmée';

  @override
  String get orderNumber => 'Numéro de commande';

  @override
  String get estimatedDelivery => 'Livraison estimée';

  @override
  String get orderTracking => 'Suivi de commande';

  @override
  String get orders => 'Commandes';

  @override
  String get orderHistory => 'Historique des commandes';

  @override
  String get orderStatus => 'Statut de la commande';

  @override
  String get addresses => 'Adresses';

  @override
  String get addAddress => 'Ajouter une adresse';

  @override
  String get editAddress => 'Modifier l\'adresse';

  @override
  String get deleteAddress => 'Supprimer l\'adresse';

  @override
  String get defaultAddress => 'Adresse par défaut';

  @override
  String get setAsDefault => 'Définir comme adresse par défaut';

  @override
  String get fullName => 'Nom complet';

  @override
  String get phoneNumber => 'Numéro de téléphone';

  @override
  String get streetAddress => 'Adresse';

  @override
  String get city => 'Ville';

  @override
  String get state => 'Région';

  @override
  String get zipCode => 'Code postal';

  @override
  String get country => 'Pays';

  @override
  String get paymentMethod => 'Modes de paiement';

  @override
  String get addPaymentMethod => 'Ajouter un mode de paiement';

  @override
  String get cardName => 'Nom sur la carte';

  @override
  String get cardNumber => 'Numéro de carte';

  @override
  String get expiryDate => 'Date d\'expiration';

  @override
  String get cvv => 'CVV';

  @override
  String get userInfo => 'Informations utilisateur';

  @override
  String get editProfile => 'Modifier le profil';

  @override
  String get firstName => 'Prénom';

  @override
  String get lastName => 'Nom de famille';

  @override
  String get email => 'Adresse e-mail';

  @override
  String get updateProfile => 'Mettre à jour le profil';

  @override
  String get changePassword => 'Changer le mot de passe';

  @override
  String get currentPassword => 'Mot de passe actuel';

  @override
  String get newPassword => 'Nouveau mot de passe';

  @override
  String get confirmPassword => 'Confirmer le mot de passe';

  @override
  String get preferences => 'Préférences';

  @override
  String get enableNotifications => 'Activer les notifications';

  @override
  String get emailNotifications => 'Notifications par e-mail';

  @override
  String get pushNotifications => 'Notifications push';

  @override
  String get smsNotifications => 'Notifications par SMS';

  @override
  String get language => 'Langue';

  @override
  String get english => 'English';

  @override
  String get french => 'Français';

  @override
  String get selectLanguage => 'Sélectionner la langue';

  @override
  String get location => 'Localisation';

  @override
  String get settings => 'Paramètres';

  @override
  String get helpSupport => 'Aide & Support';

  @override
  String get getHelp => 'Obtenir de l\'aide';

  @override
  String get faq => 'FAQ';

  @override
  String get contactUs => 'Nous contacter';

  @override
  String get aboutApp => 'À propos d\'AIVO';

  @override
  String get termsConditions => 'Conditions générales';

  @override
  String get privacyPolicy => 'Politique de confidentialité';

  @override
  String get login => 'Connexion';

  @override
  String get signup => 'Inscription';

  @override
  String get signup_getStarted => 'Commençons!';

  @override
  String get signup_message =>
      'Veuillez entrer vos données valides pour créer un compte.';

  @override
  String get logout => 'Déconnexion';

  @override
  String get forgotPassword => 'Mot de passe oublié?';

  @override
  String get passwordRecovery => 'Récupération du mot de passe';

  @override
  String get enterEmail => 'Entrez votre adresse e-mail';

  @override
  String get resetPassword => 'Réinitialiser le mot de passe';

  @override
  String get sendResetLink => 'Envoyer le lien de réinitialisation';

  @override
  String get username => 'Nom d\'utilisateur';

  @override
  String get password => 'Mot de passe';

  @override
  String get passwordConfirm => 'Confirmer le mot de passe';

  @override
  String get agreeTerms => 'J\'accepte les conditions générales';

  @override
  String get haveAccount => 'Vous avez déjà un compte?';

  @override
  String get noAccount => 'Vous n\'avez pas de compte?';

  @override
  String get continue_ => 'Continuer';

  @override
  String get next => 'Suivant';

  @override
  String get back => 'Retour';

  @override
  String get save => 'Économiser';

  @override
  String get cancel => 'Annuler';

  @override
  String get delete => 'Supprimer';

  @override
  String get edit => 'Modifier';

  @override
  String get add => 'Ajouter';

  @override
  String get remove => 'Retirer';

  @override
  String get searchProducts => 'Rechercher des produits';

  @override
  String get noResults => 'Aucun résultat trouvé';

  @override
  String get filterBy => 'Filtrer par';

  @override
  String get sortBy => 'Trier par';

  @override
  String get priceRange => 'Gamme de prix';

  @override
  String get rating => 'Note';

  @override
  String get wishlist => 'Liste de souhaits';

  @override
  String get addToWishlist => 'Ajouter à la liste de souhaits';

  @override
  String get removeFromWishlist => 'Retirer de la liste de souhaits';

  @override
  String get savedItems => 'Articles enregistrés';

  @override
  String get noBookmarks => 'Aucun favori pour le moment';

  @override
  String get onSale => 'En solde';

  @override
  String get discount => 'Réduction';

  @override
  String get wallet => 'Portefeuille';

  @override
  String get balance => 'Solde';

  @override
  String get recharge => 'Recharger';

  @override
  String get transactions => 'Transactions';

  @override
  String get walletHistory => 'Historique du portefeuille';

  @override
  String get error => 'Erreur';

  @override
  String get success => 'Succès';

  @override
  String get warning => 'Avertissement';

  @override
  String get info => 'Information';

  @override
  String get errorOccurred => 'Une erreur s\'est produite';

  @override
  String get tryAgain => 'Réessayer';

  @override
  String get loading => 'Chargement...';

  @override
  String get comingSoon => 'Très bientôt';

  @override
  String get noInternet => 'Pas de connexion Internet';

  @override
  String get checkConnection => 'Veuillez vérifier votre connexion Internet';

  @override
  String get welcome => 'Bienvenue chez AIVO';

  @override
  String get exploreProducts => 'Explorez nos produits incroyables';

  @override
  String get bestDeals => 'Les meilleures offres sur vos articles préférés';

  @override
  String get freeShipping =>
      'Livraison gratuite pour les commandes de plus de 50';

  @override
  String rateStar(Object count) {
    return '$count étoiles';
  }

  @override
  String get rateReview => 'Noter et avis';

  @override
  String get writeReview => 'Écrire un avis';

  @override
  String get reviewThanks => 'Merci pour votre avis!';

  @override
  String get helpful => 'Cet avis était-il utile?';

  @override
  String get yes => 'Oui';

  @override
  String get no => 'Non';

  @override
  String get report => 'Signaler';

  @override
  String get deliveryAddress => 'Adresse de livraison';

  @override
  String get selectAddress => 'Sélectionner une adresse';

  @override
  String get changeAddress => 'Changer l\'adresse';

  @override
  String get deliveryDate => 'Date de livraison';

  @override
  String get estimatedTime => 'Délai estimé';

  @override
  String get orderPlaced => 'Commande passée';

  @override
  String get confirmed => 'Confirmée';

  @override
  String get shipped => 'Expédiée';

  @override
  String get outForDelivery => 'En cours de livraison';

  @override
  String get delivered => 'Livrée';

  @override
  String get returnRequested => 'Retour demandé';

  @override
  String get returnProcessing => 'Traitement du retour';

  @override
  String get returnCompleted => 'Retour terminé';

  @override
  String get storeAvailability => 'Disponibilité en magasin';

  @override
  String get checkAvailability => 'Vérifier la disponibilité';

  @override
  String get inStock => 'En stock';

  @override
  String get outOfStock => 'Rupture de stock';

  @override
  String get lowStock => 'Stock faible';

  @override
  String get newItems => 'Nouveaux articles avec livraison gratuite';

  @override
  String get blackFriday => 'Black Friday';

  @override
  String get discountCollection => 'Collection';

  @override
  String get grabYoursNow => 'Profitez-en maintenant';

  @override
  String get summerSale => 'Soldes d\'été';

  @override
  String get specialOffer => 'Offre spéciale';

  @override
  String get logInTitle => 'Se connecter';

  @override
  String get forgotPasswordButton => 'Mot de passe oublié?';

  @override
  String get dontHaveAccount => 'Vous n\'avez pas de compte?';

  @override
  String get signUpButton => 'S\'inscrire';

  @override
  String get loginFailedError => 'Échec de la connexion';

  @override
  String get signupFailedError => 'Échec de l\'inscription';

  @override
  String get passwordResetSent =>
      'Lien de réinitialisation du mot de passe envoyé à votre e-mail!';

  @override
  String get resetPasswordError =>
      'Erreur lors de la réinitialisation du mot de passe';

  @override
  String get emailPlaceholder => 'Adresse e-mail';

  @override
  String get passwordPlaceholder => 'Mot de passe';

  @override
  String get askQuestion => 'Poser une question';

  @override
  String get askQuestion1 => 'Posez votre question';

  @override
  String get yourQuestion => 'Votre question...';

  @override
  String get send => 'Envoyer';

  @override
  String get popularFaq => 'FAQ populaires';

  @override
  String get allFaq => 'Toutes les FAQ';

  @override
  String get noFaqAvailable => 'Aucune FAQ disponible pour le moment';

  @override
  String get faqLike => 'Like';

  @override
  String get cookiePreferences => 'Préférences de cookies';

  @override
  String get resetPreferences => 'Réinitialiser les préférences';

  @override
  String get preferencesReset => 'Préférences réinitialisées';

  @override
  String get theme => 'Thème';

  @override
  String get lightTheme => 'Clair';

  @override
  String get darkTheme => 'Sombre';

  @override
  String get systemTheme => 'Système';

  @override
  String get emptyWishlist => 'Votre liste de souhaits est vide';

  @override
  String get emptyWishlistDescription =>
      'Ajoutez des produits à votre liste de souhaits pour les retrouver facilement';

  @override
  String get myWishlist => 'Ma Wishlist';

  @override
  String get deleteAll => 'Tout supprimer';

  @override
  String get addToWishlistError =>
      'Impossible d\'ajouter à la liste de souhaits';

  @override
  String get walletTitle => 'Portefeuille';

  @override
  String get chargeBalance => '+ Recharger le solde';

  @override
  String get logoutFailed => 'Échec de la déconnexion';

  @override
  String get loggedOutSuccessfully => 'Déconnecté avec succès';

  @override
  String get returnsTitle => 'Retours';

  @override
  String get returnsComingSoon => 'Retours (à venir)';

  @override
  String get helpTitle => 'Obtenir de l\'aide';

  @override
  String get helpComingSoon => 'Aide (à venir)';

  @override
  String get selectLanguage2 => 'Sélectionner une langue';

  @override
  String get searchLanguage => 'Rechercher une langue...';

  @override
  String get connection => 'Paramètres';

  @override
  String get findItem => 'Trouvez l\'article que vous recherchiez';

  @override
  String get getShoppingBags => 'Remplissez vos sacs d\'achat';

  @override
  String get fastSecurePayment => 'Paiement rapide et sécurisé';

  @override
  String get paymentOptions =>
      'De nombreuses options de paiement sont à votre disposition';

  @override
  String get packageTracking => 'Suivi des colis';

  @override
  String get nearbyStores => 'Magasins à proximité';

  @override
  String get noBestSellers => 'Aucun best-seller disponible';

  @override
  String get noProducts => 'Aucun produit disponible';

  @override
  String get noFlashSale => 'Aucun produit en vente éclair';

  @override
  String get noPopularProducts => 'Aucun produit populaire';

  @override
  String get sizeGuideTitle => 'Guide des tailles';

  @override
  String get checkStores => 'Vérifier les magasins';

  @override
  String get continueShoppingBtn => 'Continuer vos achats';

  @override
  String get checkoutBtn => 'Valider l\'achat';

  @override
  String get sleevelessRuffleTitle => 'Sans manches à froufrous';

  @override
  String get findSomething => 'Trouvez quelque chose...';

  @override
  String get storeSettings => 'Paramètres';

  @override
  String reviewsCount(Object count) {
    return '($count Avis)';
  }

  @override
  String get welcomeBackTitle => 'Bienvenue!';

  @override
  String get logInDescription =>
      'Connectez-vous avec les données que vous avez saisies lors de votre inscription.';

  @override
  String get logInFailedError => 'Échec de la connexion';

  @override
  String get skipButton => 'Passer';

  @override
  String get allFieldsRequired => 'Veuillez remplir tous les champs';

  @override
  String get onboardingStep1Title => 'Find the item you\'ve\nbeen looking for';

  @override
  String get onboardingStep1Description =>
      'Here you\'ll see rich varieties of goods, carefully classified for seamless browsing experience.';

  @override
  String get onboardingStep2Title => 'Get those shopping\nbags filled';

  @override
  String get onboardingStep2Description =>
      'Add any item you want to your cart, or save it on your wishlist, so you don\'t miss it in your future purchases.';

  @override
  String get onboardingStep3Title => 'Fast & secure\npayment';

  @override
  String get onboardingStep3Description =>
      'There are many payment options available for your ease.';

  @override
  String get onboardingStep4Title => 'Package tracking';

  @override
  String get onboardingStep4Description =>
      'In particular, AIVO can pack your orders, and help you seamlessly manage your shipments.';

  @override
  String get onboardingStep5Title => 'Nearby stores';

  @override
  String get onboardingStep5Description =>
      'Easily track nearby shops, browse through their items and get information about their prodcuts.';

  @override
  String get themeMode => 'Mode Thème';

  @override
  String get themeAccent => 'Couleur d\'Accent';

  @override
  String get themeContrast => 'Contraste';

  @override
  String get normal => 'Normal';

  @override
  String get highContrast => 'Haut Contraste';

  @override
  String get purple => 'Violet';

  @override
  String get skyBlue => 'Bleu Ciel';

  @override
  String get forestGreen => 'Vert Forêt';

  @override
  String get orange => 'Orange';

  @override
  String get coral => 'Corail';
}
